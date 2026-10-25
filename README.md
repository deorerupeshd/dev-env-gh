# Ubuntu Dev Environment (`ubuntu-dev`)

This directory contains everything required to spin up a fully-equipped Ubuntu 24.04 LTS development container synced live with your `D:\Rupesh` folder.

---

## 📁 Directory Mount & Sync

* **Host Path**: `D:\Rupesh`
* **Container Path**: `/home/developer/workspace`
* **Live Sync**: Any file created, modified, or cloned inside `/home/developer/workspace` is immediately visible in `D:\Rupesh` on Windows, and vice-versa.
* **SSH Keys**: Your host SSH keys in `C:\Users\Acer\.ssh` are mounted read-only into `/home/developer/.ssh`, so Git SSH operations work out of the box.

---

## 🚀 Quick Start Guide

Open **PowerShell** or **Command Prompt** and navigate to this folder:

```powershell
cd D:\Rupesh\dev-env-gh
```

### 1. Build & Start the Container
```powershell
docker compose up -d --build
```
> This downloads the Ubuntu base image, installs all dev tools, sets up user permissions, and starts the container in the background.

### 2. Enter the Ubuntu Shell
```powershell
docker compose exec dev-env bash
```
You will enter the container prompt as the `developer` user:
```text
developer@<container-id>:~/workspace$
```

### 3. Verify the Mount & Sync
Inside the container, run:
```bash
ls -la
```
You should see all your folders from `D:\Rupesh` (`app`, `Project`, `Terraform`, etc.).

Create a test file inside Ubuntu:
```bash
echo "Hello from Ubuntu container" > test-sync.txt
```
Check your `D:\Rupesh` folder in Windows File Explorer — `test-sync.txt` will be there. You can delete it anytime.

---

## 🛑 Useful Commands

| Task | Command |
|---|---|
| Open Ubuntu bash | `docker compose exec dev-env bash` |
| View container status | `docker compose ps` |
| Stop container | `docker compose down` |
| Restart container | `docker compose restart` |
| View logs (if needed) | `docker compose logs -f` |

---

## 💻 Working with VS Code (Dev Containers)

1. Ensure the **Dev Containers** extension is installed in VS Code.
2. Run `docker compose up -d` to ensure the container is running.
3. In VS Code, press `F1` (or `Ctrl+Shift+P`), type **Dev Containers: Attach to Running Container...**, and select `ubuntu-dev`.
4. VS Code will open an editor window running directly inside your Ubuntu environment!

