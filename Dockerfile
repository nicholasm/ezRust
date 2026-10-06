FROM rust:1.99-slim-trixie

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install cargo-watch
RUN cargo install --locked cargo-watch

# Create a non-root user (override UID/GID to match your host user on Linux)
ARG UID=1000
ARG GID=1000
RUN groupadd --gid ${GID} rust \
    && useradd --uid ${UID} --gid ${GID} --create-home rust

# Keep the user's crate registry in their home; toolchain and cargo-watch stay read-only in /usr/local
ENV CARGO_HOME=/home/rust/.cargo
ENV PATH=/usr/local/cargo/bin:$PATH

WORKDIR /usr/src/app
RUN chown rust:rust /usr/src/app

USER rust

# Pre-cache dependencies
COPY --chown=rust:rust Cargo.toml ./

# Dummy src to allow build
RUN mkdir src && echo "fn main() {}" > src/main.rs && cargo build || true
RUN rm -r src

# Copy the actual project
COPY --chown=rust:rust . .
