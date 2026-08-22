# lens package guide

This guide complements the [module README](../README.mbt.md) with checked construction examples and package-specific behavior for `totto2727/lens`.

## Typed construction

Build a new JSON object through typed lenses. `JsonBuilder` reports path conflicts without mutating a failed build.

```mbt check
///|
test {
  let builder = JsonBuilder::JsonBuilder()
  let user = object("user")
  user.string("name").set(builder, "Ada")
  user.int("age").set(builder, 37)

  @json.json_inspect(builder, content={ "user": { "name": "Ada", "age": 37 } })
}
```

## Package behavior

- Typed accessors for strings, booleans, numbers, integers, objects, arrays, custom `FromJson`/`ToJson` values, and raw `Json`.
- Presence-aware reads and writes with distinct `nullable`, `optional`, and `nullish` semantics.
- `JsonBuilder` construction with typed path-conflict errors and deterministic replacement/removal behavior.
- Aggregate `validate` checks that preserve every failure in input order without constructing application values.
- RFC 6901 pointers and standard `JsonDecodeError` path propagation for nested custom decoders.
