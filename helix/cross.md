
# cross musl

musl musl-aarch64 rust-musl rust-aarch64-musl

```toml
[target.x86_64-unknown-linux-musl]
# linker = "cc"
linker = "x86_64-linux-musl-gcc"
rustflags = [
    "-C", "target-feature=+crt-static",
    "-C", "link-args=-static -lm"
]

[target.aarch64-unknown-linux-musl]
linker = "aarch64-linux-musl-gcc"
rustflags = [
    "-C", "target-feature=+crt-static",
    "-C", "link-args=-static -lm"
]

```

HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1 HELIX_RUNTIME=/usr/lib/helix/runtime cargo build --target x86_64-unknown-linux-musl --release

HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1 HELIX_RUNTIME=/usr/lib/helix/runtime cargo build --target aarch64-unknown-linux-musl --release

HELIX_RUNTIME=/usr/lib/helix/runtime


