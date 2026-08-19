# lens

`totto2727/lens` is a MoonBit module for typed JSON lenses, builders, and aggregate validation. The module publishes one `lens` package; see the [detailed package README](./src/README.mbt.md) for checked examples and package-level usage.

This document is canonical `README.mbt.md`; maintain `README.md` as the relative symlink `README.md -> README.mbt.md`.

## Usage

Read a typed property from a JSON document after completing [Setup](#setup).

```moonbit
test "read a typed JSON property" {
  let document = @json.parse("{\"user\":{\"name\":\"Ada\"}}")
  let name = @lens.object("user").string("name").get(document)
  inspect(name, content="Ada")
}
```

For builders, presence semantics, and validation, see the [detailed package README](./src/README.mbt.md#usage).

## Key features

- One publishable `lens` package for typed JSON traversal and construction.
- Checked package examples for typed reads and JSON object building.
- Generated public API documentation on Mooncakes.

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
