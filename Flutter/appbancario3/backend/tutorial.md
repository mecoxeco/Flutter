# Install
npm install json-server
or
npm i


# Usage

Pass it to JSON Server CLI05
$ npx json-server db.json

Get a REST API

$ curl http://localhost:3000/posts/1
{
  "id": "1",
  "title": "a title",
  "views": 100
}


Run json-server --help for a list of options