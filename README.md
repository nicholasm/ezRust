![ezRust logo](https://mullerdigital.com/external_assets/github/ezrust/ezrust-logo.png)

**ezRust** is a lightweight Docker-based development environment for Rust that automatically watches your local project files and rebuilds on changes. Designed for ease and speed, it eliminates the hassle of manually setting up and managing Rust builds during development — just code and watch your changes compile instantly.

## 🚀 Features

- 🐳 Docker-powered Rust environment
- 🔄 Automatic file watching and rebuilding
- ⚡ Fast feedback loop for rapid development
- 🔧 Zero setup needed on the host machine (just Docker!)

## 📦 Dependencies
- [🐳 🖥️ Docker Desktop] (https://www.docker.com/products/docker-desktop/) (Ideally)
**Alternatively**
- [🐳 Docker](https://docs.docker.com/get-docker/) (version 20.10+ recommended)
- [🐳 📖 Docker Compose](https://docs.docker.com/compose/)

## 🧭 Getting Started

```bash
docker compose up
```

📝 Next step:
Open your main Rust source file in your favorite editor: 
```bash
code ./src/main.rs
```