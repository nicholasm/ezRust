FROM rust:latest

WORKDIR /usr/src/app

# Copy the entire project first
COPY . .

# Then fetch dependencies
RUN cargo fetch

CMD ["cargo", "run"]
