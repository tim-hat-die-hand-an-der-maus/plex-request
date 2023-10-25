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

#### ServerLibrary

```shell
mix phx.gen.json Plex ServerLibrary server_library name:string server_id:references:server library_id:references:library --web Api
mix phx.gen.html Plex ServerLibrary server_library name:string server_id:references:server library_id:references:library --no-schema --no-context
```

#### ServerLibraryItem

```shell
mix phx.gen.json Plex ServerLibraryItem server_library_item name:string year:integer rating_key:integer server_library_id:references:server_library --web Api
mix phx.gen.html Plex ServerLibraryItem server_library_item name:string year:integer rating_key:integer server_library_id:references:server_library --no-schema --no-context
```

#### RequestFulfilment

```shell
mix phx.gen.json Requests RequestFulfilment request_fulfilment request_id:references:request server_library_item_id:references:server_library_item --web Api
mix phx.gen.html Requests RequestFulfilment request_fulfilment request_id:references:request server_library_item_id:references:server_library_item --no-schema --no-context
```
