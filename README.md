# 📖 CLI-Grimoire

Personal development environment setup for terminal, shell, and tools.

---

## ✨ Features

* 🐚 Zsh configuration
* 🚀 Starship config
* 🖥️ Alacritty terminal config
* 🔗 Symlink-based setup
* 📦 Modular install scripts

---

## 🚀 Quick Install

Run this one-liner:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/dominic-myb/cli-grimoire/main/install.sh)"
```

---

## 📦 Manual Install

```bash
git clone https://github.com/dominic-myb/cli-grimoire.git ~/.cli-grimoire
cd ~/.cli-grimoire
./install.sh
```

---

## 📁 Structure

```
cli-grimoire/
├── install.sh
├── scripts/
│   ├── zsh.sh
│   ├── alacritty.sh
│   ├── starship.sh
│   └── dnf.sh
│
├── zsh/
│   └── .zshrc
│
├── alacritty/
│   └── alacritty.toml
│
├── starship/
│   └── starship.toml
│
└── dnf/
    └── dnf.conf
```

---

## ⚠️ Notes

* Some scripts (e.g. `dnf.sh`) modify system files and require `sudo`.
* Existing configs are automatically backed up before changes.
* Review scripts before running if you are unsure.

---

## 🔧 Customization

Edit configs inside their respective folders:

* `zsh/.zshrc`
* `alacritty/alacritty.toml`
* `starship/starship.toml`

Then re-run:

```bash
./install.sh
```

---

## 🧠 Philosophy

* Keep configs version-controlled
* Use symlinks instead of copying
* Automate setup with simple scripts
* Stay minimal but extensible

---
