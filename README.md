# Blast Demo Pipeline

This repo contains a demo pipeline created for you to explore the capabilities of Blast Data Platform. It is a small, real-life pipeline for event data collected from a mobile game, built on top of a public Firebase dataset. 

## Pipeline Structure
- The pipeline in this repository includes a `pipeline.yml` file that is used to define the defaults and the rules for the pipeline.
- Inside the pipeline, there's a `tasks` directory that contains a set of assets and sensors.
- Individual assets can be defined in multiple ways:
  - either as comments in the file, e.g. [see tasks/events_raw.sql](./tasks/events_raw.sql)
  - or as a YAML file that ends with `.task.yml`, e.g. [see tasks/users_daily.task.yml](./tasks/users_daily.task.yml)

An example `name.task.yml` can be considered as follow:

```yml
name: idfa_model.ad_tracking
type: bq.sql
run: query.sql
depends: 
    - asset1
    - asset2
```

In this file:
- `name`: defines the name of the task
- `type`: defines the type of the task
- `run`: the query file that contains the query that will be executed
- `depends`: defines the list of the tasks that the current one depends on

## Available Asset Types
This demo pipeline is built to be ran on BigQuery demo data we set up for you, therefore you can get started with the `bq.sql` type.

For a full list of available types, please [see our docs](https://datablast-analytics.github.io/blast-docs/).

## Fair use policy
This demo pipeline is built for the purposes of showcasing the capabilities of Blast Data Platform, therefore we'd like to ask you to use the platform in a fair way during this period based on mutual trust. We trust you to not to harm the platform in any way.