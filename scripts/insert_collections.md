# Inserting Collection Metadata

This document describes how to insert STAC collection metadata from a local machine into the `delta-backend-dev` database. Using cloud resources may be useful in the future for a tested and repeatable process, but a local process is all that is required at this time.

These steps assume you can connect to the PG STAC database instance from another AWS resource (such as an EC2) or security group inbound rule permitting access for your IP.

### Step 1: Generate collection sql

After reviewing examples in [collections-sql/](./collections-sql/) and the [STAC Collection Spec](https://github.com/radiantearth/stac-spec/blob/master/collection-spec/README.md), create another `.sql` file in collections-sql for the collection of interest.

### Step 2: Load PG STAC credentials from AWS

PG STAC credentials are stored in AWS Secrets Manager. The scripts below load the database host, username, database and password as local environment variables.

Before you run these commands, you will need AWS credentials set in your environment.

```bash
export AWS_PGSTAC_SECRET_ID=delta-backend-dev/pgstac/XXX
export SECRETS=$(aws secretsmanager get-secret-value --secret-id $AWS_PGSTAC_SECRET_ID | jq -c '.SecretString | fromjson')
export STAC_DB_HOST=$(echo $SECRETS | jq -r .host)
export STAC_DB_USER=$(echo $SECRETS | jq -r .username)
export STAC_DB_NAME=$(echo $SECRETS | jq -r .dbname)
# Setting this environment variable to surpass a psql password prompt
export PGPASSWORD=$(echo $SECRETS | jq -r .password)
```

### Step 3: Insert a given collection

```bash
export COLLECTION_NAME=OMSO2PCA-COG
psql -h $STAC_DB_HOST -U $STAC_DB_USER -d $STAC_DB_NAME -f collections-sql/${COLLECTION_NAME}.sql
```

### Deleting collections

... ADD ME ...