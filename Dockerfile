FROM rust:latest

# Install build dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install cargo-watch
RUN cargo install cargo-watch

WORKDIR /usr/src/app

# Pre-cache dependencies
COPY Cargo.toml ./

# Dummy src to allow build
RUN mkdir src && echo "fn main() {}" > src/main.rs && cargo build || true
RUN rm -r src

# Copy the actual project
COPY . .