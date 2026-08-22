# lens package

Detailed usage for the `totto2727/lens` package: typed JSON lenses, builders, and aggregate validation for reusable, checked access to JSON documents.

This document is the canonical literate package README; the repository module overview is [../README.mbt.md](../README.mbt.md).

## Usage

Create typed child lenses once and reuse them across documents. A lens read reports a structured `LensError` with its JSON Pointer when traversal or decoding fails.

```mbt check
///|
test {
  let document = @json.parse("{\"user\":{\"name\":\"Ada\",\"age\":37}}")
  let user = object("user")
  let name_lens = user.string("name")
  let age_lens = user.int("age")

  inspect(name_lens.get(document), content="Ada")
  inspect(age_lens.get(document), content="37")
}
```

Build a new JSON object through the same typed lenses.

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

## Key features

- Typed accessors for strings, booleans, numbers, integers, objects, arrays, custom `FromJson`/`ToJson` values, and raw `Json`.
- Presence-aware reads and writes with distinct `nullable`, `optional`, and `nullish` semantics.
- `JsonBuilder` construction with typed path-conflict errors and deterministic replacement/removal behavior.
- Aggregate `validate` checks that preserve every failure in input order without constructing application values.
- RFC 6901 pointers and standard `JsonDecodeError` path propagation for nested custom decoders.

## Prerequisites

- **MoonBit**: Install a current MoonBit toolchain from the [official documentation](https://docs.moonbitlang.com/en/latest/).

## Setup

1. Add the published module to a MoonBit project.

```bash
moon add totto2727/lens@0.4.3
```

2. Import the package as `@lens` and compose lenses from `@lens.root()` or `@lens.object("property")`.

## API

The maintained public API index and generated signatures are published in the [Mooncakes API reference](https://mooncakes.io/docs/totto2727/lens).

## Development

For repository structure, validation commands, and contribution rules, see [AGENTS.md](../AGENTS.md).

## License

MIT. See [LICENSE](../LICENSE).

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
