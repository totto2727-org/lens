---
moonbit:
  import:
    - path: totto2727/lens@0.4.2
      alias: lens
    - path: moonbitlang/core/json
      alias: json
---

# lens

`totto2727/lens` is a MoonBit module for typed JSON traversal, construction, and aggregate validation through one `lens` package.

## Usage

Read a typed property from a JSON document after completing [Setup](#setup).

```mbt check
///|
test "read a typed JSON property" {
  let document = @json.parse("{\"user\":{\"name\":\"Ada\"}}")
  let name = @lens.object("user").string("name").get(document)
  inspect(name, content="Ada")
}
```

Build a new JSON object through the same typed lenses. `JsonBuilder` reports path conflicts without mutating a failed build.

```mbt check
///|
test "build typed JSON properties" {
  let builder = @lens.JsonBuilder::JsonBuilder()
  let user = @lens.object("user")
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

1. Add `totto2727/lens` to a MoonBit project.

```bash
moon add totto2727/lens@0.4.2
```

2. Import the lens package and the standard JSON parser in the consumer package's `moon.pkg`.

```moonbit
import {
  "totto2727/lens" @lens,
  "moonbitlang/core/json" @json,
}
```

## API

The maintained public API index and generated signatures are published in the [Mooncakes API reference](https://mooncakes.io/docs/totto2727/lens).

## Current scope

The package traverses object properties and builds new JSON objects. It does not mutate source documents or provide refinements, alternatives, or array-index traversal; see the [design contract](./docs/design.md) for the detailed constraints and roadmap.

## Development

For repository structure, validation commands, and contribution rules, see [AGENTS.md](./AGENTS.md).

## License

MIT. See [LICENSE](./LICENSE).

_This README was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [README template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/readme/template.md)._
