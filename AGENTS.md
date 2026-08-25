# lens

## Repository structure

```text
moon.mod            Mooncakes module metadata and published package identity
src/                Lens implementation, JSON boundary adapters, and MoonBit tests
README.mbt.md       Canonical literate module overview
README.md           Relative symlink to README.mbt.md
docs/          Design notes and roadmap
.github/       MoonBit CI and publishing workflows
flake.nix      Reproducible MoonBit development shell
```

## Development commands

### Execution rules

- Run commands from the repository root.
- Use the MoonBit toolchain provided by `flake.nix` or an equivalent installed `moon` binary.
- Keep `README.mbt.md` as the single consumer entrypoint and preserve `README.md -> README.mbt.md`.
- Keep public API behavior and semantics in `///` source documentation.

### Standard tasks

- `moon check` — Check the complete MoonBit module.
- `moon test --target native` — Run native tests.
- `moon test --target wasm-gc` — Run WebAssembly garbage-collection target tests.
- `moon build --target native` — Build the native package.
- `moon package --list` — Validate the publishable package contents.

## Architecture

### Typed lens access

- `ObjectLens` composes JSON object-property paths and creates typed `Lens[T]` values.
- `Lens[T]` owns a pointer plus decoder and encoder; `PresenceLens[T]` replaces missing and `null` behavior without nested options.
- `LensTrait` erases successful values only for aggregate `validate` checks.

### JSON boundaries

- Primitive and array decoders raise structured `LensError` values with RFC 6901 pointers.
- `custom` delegates to standard `FromJson` and `ToJson` traits while preserving nested `JsonPath` values.
- `JsonBuilder` writes typed values to a new object and reports path conflicts as `JsonBuildError` without mutating a failed build.

## Development tools

- **MoonBit**: Compiles, checks, tests, and packages the module.
- **Mooncakes**: Publishes the module and hosts the generated API reference at [totto2727/lens](https://mooncakes.io/docs/totto2727/lens).
- **Nix flakes**: Provide the reproducible standalone MoonBit development shell.

## Package-specific rules

- Add or update `///` documentation when changing a public symbol; Mooncakes uses these comments for the generated API reference.
- Keep README examples concise, and keep detailed operational commands in this file.
- Preserve the package's typed JSON boundary: use `custom` for application types with standard JSON traits and `json` only when a raw JSON value is intentional.

_This AGENTS.md was generated from the [share-artifact skill](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/SKILL.md) and [AGENTS template](https://raw.githubusercontent.com/totto2727-org/agent/refs/heads/main/plugins/totto2727-coding/skills/share-artifact/agents/template.md)._
