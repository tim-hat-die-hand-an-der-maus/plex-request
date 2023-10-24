# PlexRequest

## Setup

```shell
mix phx.new plex_request --database postgres --no-mailer --install
```

### Models

#### Source

```shell
mix phx.gen.json Requests Source source name:string --web Api
```

#### Request

```shell
mix phx.gen.json Requests Request request upstream_id:string source_id:references:source --web Api
```
