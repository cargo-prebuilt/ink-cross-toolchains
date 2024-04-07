# ink-cross-toolchains

Cross compiling toolchains meant for [ink-cross-images](https://github.com/cargo-prebuilt/ink-cross-images).

## Toolchains

### 2024.01 (Upcoming)

[Config Files](https://github.com/cargo-prebuilt/ink-cross-toolchains/tree/v2024.01/config)

#### Host Platform Support

- aarch64-linux-gnu
- x86_64-linux-gnu

#### Versions

TODO: Bundle zlib and musl

| Target (Rust/LLVM)             | GCC Target           | GCC    | BinUtils | Musl  | Linux Kernel |
|--------------------------------|----------------------|--------|----------|-------|--------------|
| aarch64-unknown-linux-musl     | aarch64-linux-musl   | 12.3.0 | 2.42     | 1.2.4 | 5.4.260      |
| armv7-unknown-linux-musleabihf | arm-linux-musleabihf | 12.3.0 | 2.42     | 1.2.4 | 5.4.260      |
| x86_64-unknown-linux-musl      | x86_64-linux-musl    | 12.3.0 | 2.42     | 1.2.4 | 5.4.260      |

## Download and Install

TODO

## Building

### Build

```shell
docker buildx build \
  -f ./docker/$TARGET.Dockerfile \
  -t ink-toolchain:dev \
  .
```

### Extract

```shell
./scripts/extract.sh
```

## Acknowledgements

- [musl-cross](https://github.com/musl-cross/musl-cross)
- [crosstool-ng](https://github.com/crosstool-ng/crosstool-ng)
