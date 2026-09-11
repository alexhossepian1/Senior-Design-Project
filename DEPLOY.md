# Deploying RC Part Picker on Ubuntu Server

Assumes Ubuntu Server 22.04 or 24.04 with sudo access.

## 1. Install Docker

Do not use `apt install docker.io`. It ships an old version without the `compose` subcommand. Use Docker's own repo:

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io \
  docker-buildx-plugin docker-compose-plugin
```

Add yourself to the docker group so you're not typing sudo constantly:

```bash
sudo usermod -aG docker $USER
newgrp docker          # or just log out and back in
docker compose version # should print v2.x
```

Note that the docker group is effectively root. That is a real privilege escalation path, so on a shared VM keep the group membership list short.

## 2. Lay out the project

```
rc-part-picker/
├── db/                     # the SQL files, unchanged
│   ├── 01_schema.sql
│   └── ...
├── deploy/
│   ├── docker-compose.yml
│   ├── Dockerfile          # or Dockerfile.python renamed
│   ├── .dockerignore
│   ├── .env.example
│   ├── Caddyfile
│   └── backup.sh
├── src/                    # your app code
└── package.json            # or requirements.txt
```

Copy `.dockerignore` up to the repo root too, since the build context is the repo root.

## 3. Create the .env file

```bash
cd rc-part-picker/deploy
cp .env.example .env
sed -i "s|replace-me-with-a-generated-value|$(openssl rand -base64 32)|" .env
nano .env    # set SITE_DOMAIN
```

Add `.env` to `.gitignore` right now, before your first commit. Committed database credentials are the single most common finding in student project repos, and they stay in the git history even after you delete the file.

## 4. Pick your Dockerfile

The default `Dockerfile` is Node. If you're on Python, delete it and rename `Dockerfile.python` to `Dockerfile`.

Both use a two-stage build so your build toolchain doesn't ship to production, and both run as a non-root user inside the container.

Adjust the `CMD` line to match your actual entrypoint. The Node one assumes `server.js`, the Python one assumes a `app:app` WSGI callable.

## 5. Bring it up

```bash
docker compose up -d --build
docker compose ps          # all three should be healthy/running
docker compose logs -f app # watch for startup errors
```

Verify the schema loaded:

```bash
docker compose exec db psql -U rcpp_app -d rcpp \
  -c "SET search_path TO rcpp; SELECT count(*) FROM variants;"
```

You should get 1360, spread over 57 part types in 5 build types.

The last seed file (`13_verify.sql`) prints a summary and warns about data
problems as the database initialises. It never fails the load, so read it:

```bash
docker compose logs db | grep rcpp:
```

You want to see every part type at 20+ variants, no undefined spec keys, the
`clean-*` demo builds at 0 errors and the `broken-*` ones with errors. A
`clean-` build that starts reporting errors means a seed edit broke something.

## 6. The gotcha that will get you

**`docker-entrypoint-initdb.d` only runs on the very first boot, when the pgdata volume is empty.** Edit a SQL file and restart, and nothing happens. This confuses everyone once.

While you're still iterating on the schema, reset with:

```bash
docker compose down -v      # the -v deletes the pgdata volume
docker compose up -d
```

Once you have real data you care about, stop doing that and switch to proper migrations (Flyway, Alembic, or node-pg-migrate). Do that switch before the cloud semester, not after.

Know the difference cold: `down` stops containers and keeps data. `down -v` deletes the volumes. There is no undo.

## 7. Firewall

```bash
sudo ufw allow OpenSSH
sudo ufw allow 80,443/tcp
sudo ufw enable
```

Important caveat: **Docker writes its own iptables rules and bypasses ufw** for any port published with `ports:`. A `ports: "5432:5432"` on the db service would be reachable from the internet even with ufw denying it. This compose file publishes nothing except Caddy's 80/443, which is exactly why. If you ever add a `ports:` line for debugging, bind it to localhost (`127.0.0.1:5432:5432`) and reach it over an SSH tunnel instead.

## 8. TLS

If `SITE_DOMAIN` has a DNS A record pointing at the VM and ports 80/443 are open, Caddy fetches a Let's Encrypt cert on first boot with zero configuration.

If you only have an IP and no DNS name, Let's Encrypt won't issue. Change the first line of the Caddyfile to `:443` and add `tls internal` inside the block for a self-signed cert. Browsers will warn, which is fine for a demo but worth mentioning in your writeup.

## 9. Backups

```bash
chmod +x deploy/backup.sh
crontab -e
```

Add:

```
0 3 * * * /home/YOURUSER/rc-part-picker/deploy/backup.sh >> /home/YOURUSER/backup.log 2>&1
```

Run it manually once to confirm it works. Then actually restore from a backup into a scratch database at least once, because a backup you have never restored is not a backup.

```bash
gunzip -c ~/backups/rcpp-XXXX.sql.gz | docker compose exec -T db psql -U rcpp_app -d rcpp
```

## Day-to-day commands

| Task | Command |
|---|---|
| Deploy new code | `git pull && docker compose up -d --build app` |
| App logs | `docker compose logs -f app` |
| psql shell | `docker compose exec db psql -U rcpp_app -d rcpp` |
| Restart one service | `docker compose restart app` |
| Disk usage | `docker system df` |
| Clean old images | `docker system prune -a` |

That last one matters. Rebuilding on every push fills the disk with dangling images, and a full disk on a small VM will take Postgres down. Run it every couple of weeks or add it to cron.

## What changes next semester

When you move to RDS or Azure Database for PostgreSQL:

1. Delete the `db` service from `docker-compose.yml`
2. Delete the `pgdata` volume
3. Point `DATABASE_URL` at the managed endpoint, adding `?sslmode=require`
4. Load the schema once with `psql "$DATABASE_URL" -f db/01_schema.sql` and so on

The app service does not change at all. That's the whole reason for doing it this way instead of apt-installing Postgres on the VM.
