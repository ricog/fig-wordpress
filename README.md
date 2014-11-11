# Wordpress deployed with Fig / Docker

A Wordpress installation deployed with Fig and Docker; complete with `backup`
and `restore` commands.

## Requirements

- Docker
- Fig

## Install

    git clone https://github.com/ricog/fig-wordpress.git website
    cd website
    ./bin/init.sh

## Usage

### Deploy

    fig up -d

### Backup

Creates a backup sql file and a copy of the website files in `./backups`.

    ./bin/backup.sh

### Restore

Restores the website to the latest backup or to a backup specified by `timestamp`.

    ./bin/restore.sh [timestamp]

### Reset

Deploys a clean version of Wordpress, wiping out the existing website.

    ./bin/reset.sh

### Init

Typically only run on first install. Downloads a fresh (latest) copy of Wordpress and creates an empty database file. Backup files are not removed during this process.

    ./bin/init.sh

