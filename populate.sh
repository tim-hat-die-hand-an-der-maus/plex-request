url=http://localhost:4000
token="abc"
header='-H "Content-Type: application/json"'
auth_header="-H \"X-Api-Token: $token\""

curl "http://localhost:4000/api/source" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"source": {"name": "IMDb"}}'
curl "http://localhost:4000/api/request" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"request": {"name": "IMDb", "upstream_id": "tt000000", "source_id": "1"}}'
curl "http://localhost:4000/api/server" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"server": {"name": "Torben"}}'
curl "http://localhost:4000/api/library" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"library": {"name": "Movies"}}'
curl "http://localhost:4000/api/server_library" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"server_library": {"name": "Movies", "server_id": "1", "library_id": "1"}}'
curl "http://localhost:4000/api/server_library_item" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"server_library_item": {"name": "look ma i am a movie", "year": 2001, "rating_key": 3000, "server_library_id": "1"}}'
curl "http://localhost:4000/api/request_fulfilment" -H "Content-Type: application/json" -H "X-Api-Token: $token" -d '{"request_fulfilment": {"request_id": "1", "server_library_item_id": "1"}}'
