# ink-cross-toolchains

Cross compiling toolchains meant for [ink-cross-images](https://github.com/cargo-prebuilt/ink-cross-images).

## Toolchains

### 2024.01 (Upcoming)

#### Platform Support

- aarch64-unknown-linux-gnu
- x86_64-unknown-linux-gnu

#### Versions

| Rust Target                | GCC Target         | GCC    | BinUtils | Musl  | Linux Kernel |
|----------------------------|--------------------|--------|----------|-------|--------------|
| aarch64-unknown-linux-musl | aarch64-linux-musl | 12.3.0 | 2.40     | 1.2.4 | 5.4.248      |
| armv7-unknown-linux-musl   | arm-linux-musl     | 12.3.0 | 2.40     | 1.2.4 | 5.4.248      |
| x86_64-unknown-linux-musl  | x86_64-linux-musl  | 12.3.0 | 2.40     | 1.2.4 | 5.4.248      |

## Download and Install

TODO

## Acknowledgements

- [musl-cross](https://github.com/musl-cross/musl-cross)
- [crosstool-ng](https://github.com/crosstool-ng/crosstool-ng)
