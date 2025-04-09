FROM rust:latest

WORKDIR /usr/src/app

# Optional: copy Cargo files and build dependencies for caching
COPY Cargo.toml Cargo.lock ./
RUN cargo fetch

# Copy the actual project
COPY . .

CMD ["cargo", "run"]
