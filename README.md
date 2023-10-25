# PlexRequest

## Setup

```shell
mix phx.new plex_request --database postgres --no-mailer --install
```

### Models

#### Source

```shell
mix phx.gen.json Requests Source source name:string --web Api
 mix phx.gen.json Requests Source source name:string --no-schema --no-context
```

#### Request

```shell
mix phx.gen.json Requests Request request upstream_id:string source_id:references:source --web Api
mix phx.gen.html Requests Request request upstream_id:string source_id:references:source --no-schema --no-context
```

#### Server

```shell
mix phx.gen.json Plex Server server name:string --web Api
mix phx.gen.html Plex Server server name:string --no-schema --no-context
```

#### Library

```shell
mix phx.gen.json Plex Library library name:string --web Api
mix phx.gen.html Plex Library library name:string --no-schema --no-context
```
