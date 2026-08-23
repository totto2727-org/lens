///|
test "README usage - reads a typed JSON property" {
  let document = @json.parse("{\"user\":{\"name\":\"Ada\"}}")
  let name = @lens.object("user").string("name").get(document)
  inspect(name, content="Ada")
}

///|
test "README usage - builds typed JSON properties" {
  let builder = @lens.JsonBuilder::JsonBuilder()
  let user = @lens.object("user")
  user.string("name").set(builder, "Ada")
  user.int("age").set(builder, 37)

  @json.json_inspect(builder, content={ "user": { "name": "Ada", "age": 37 } })
}
