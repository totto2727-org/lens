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

## API

The package-owned API index and generated signatures are available in the [Mooncakes API reference](https://mooncakes.io/docs/totto2727/lens).

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
