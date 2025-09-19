# Distributed TCP Task Runner — README (for GitHub)

Welcome to the **Distributed TCP Task Runner** project. This repository demonstrates a simple way to distribute computational tasks across multiple machines (server and clients) using only Python’s standard library and TCP sockets. It is lightweight, dependency-free, and designed as an educational example of distributed systems.

> ⚠️ **Ethics note:** This project is strictly for **educational, authorized, and legal use**. Do not use it for unauthorized password cracking or illegal activities.

---

## 📖 Project Overview

The system consists of:

* **Server (`server_tcp.py`)**: Reads a `tasks.txt` file, places each line in a work queue, and serves work batches to clients over TCP.
* **Clients (`client_tcp.py`)**: Connect to the server, request work, process the tasks (default: compute SHA-256 of each string), and return results.
* **Shared file (`tasks.txt`)**: A plain text file on the server, each line representing one unit of work.
* **Helper scripts**: `install.sh` for Linux/macOS and `install.bat` for Windows to quickly set up a Python virtual environment.

The server divides tasks into batches and assigns them to clients as they connect. Results are collected and stored on the server.

---

## ✨ Features

* Minimal setup — runs with Python 3.8+ and standard libraries.
* Pure TCP socket communication (no HTTP/webserver).
* JSON messages with length-prefixing for reliability.
* Batch processing with configurable size (`BATCH_SIZE`).
* Threaded server — supports multiple concurrent clients.
* Cross-platform (Linux, macOS, Windows).

---

## 🗂 Repository Structure

```
├── README.md           # This file
├── install.sh          # Setup script for Linux/macOS
├── install.bat         # Setup script for Windows
├── server_tcp.py       # Server script (not included here)
├── client_tcp.py       # Client script (not included here)
└── tasks.txt           # Example tasks file
```

---

## ⚙️ Installation

### Linux / macOS

```bash
chmod +x install.sh
./install.sh
```

This will create a virtual environment in `venv/`. To activate:

```bash
source venv/bin/activate
```

### Windows

```bat
install.bat
```

This will create `venv/`. To activate:

```bat
venv\Scripts\activate
```

---

## 🚀 Usage

### 1. Prepare tasks

Edit `tasks.txt` on the server machine. Each line should be a string to process.

### 2. Start the server

```bash
python server_tcp.py
```

The server will:

* Load lines from `tasks.txt` into a queue
* Wait for client connections
* Assign batches of tasks on request

### 3. Start the clients

On each client machine:

```bash
python client_tcp.py
```

Make sure `SERVER_HOST` in `client_tcp.py` points to the server’s IP address.

### 4. Collect results

The server prints collected results to its console. You can adapt the code to write them into a CSV, database, or log file.

---

## 🔧 Configuration

Configuration constants are inside the Python scripts:

* `HOST` (server bind address)
* `PORT` (default: 40000)
* `BATCH_SIZE` (number of tasks per client request)
* `TXT_PATH` (path to `tasks.txt` on the server)
* `SERVER_HOST` (IP address of the server, set on clients)

---

## 🔒 Security Notes

* The provided code uses plain TCP and no authentication. For real deployments, add **TLS encryption** and **authentication tokens**.
* Handle client failures by re-queuing uncompleted tasks.
* Store results in a persistent database (SQLite, PostgreSQL, etc.) for reliability.

---

## 🤝 Contributing

Pull requests and issues are welcome! Suggested areas for contribution:

* Adding TLS support
* Adding authentication
* Implementing persistent storage for results
* Building a monitoring dashboard

---

## 📜 License

This project is released into the public domain / MIT license (choose what fits your repo). Use it freely for lawful purposes.

---

## 🙏 Acknowledgments

Inspired by simple task-queue systems (Celery, Hashtopolis, etc.) but re-imp
