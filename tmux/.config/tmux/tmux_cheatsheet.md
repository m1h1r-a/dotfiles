# Tmux Cheatsheet

> **Prefix Key:** `Ctrl + Space`

## 🚀 Core & Session Management

| Action | Shortcut | Notes |
| :--- | :--- | :--- |
| **Prefix Key** | `Ctrl + Space` | Replaced default `Ctrl + b` |
| **Reload Config** | `:source ~/.config/tmux/tmux.conf` | Run inside tmux command prompt (`Prefix + :`) |
| **Detach Session** | `Prefix + d` | |
| **Rename Session** | `Prefix + $` | |
| **List Sessions** | `Prefix + s` | Interactive session tree |
| **New Session** | `tmux new -s <name>` | Run in terminal |

## 🪟 Window Management

| Action | Shortcut | Alternative | Notes |
| :--- | :--- | :--- | :--- |
| **New Window** | `Prefix + c` | | Opens in current directory |
| **Rename Window** | `Prefix + ,` | | |
| **Previous Window** | `Shift + Left` | `Alt + Shift + H` | No Prefix required |
| **Next Window** | `Shift + Right` | `Alt + Shift + L` | No Prefix required |
| **Select Window** | `Prefix + 0..9` | | |
| **Close Window** | `Prefix + &` | | |

## 🖼️ Pane Management

| Action | Shortcut | Alternative | Notes |
| :--- | :--- | :--- | :--- |
| **Split Horizontal** (Left/Right) | `Prefix + v` | | Opens in current directory |
| **Split Vertical** (Top/Bottom) | `Prefix + h` | | Opens in current directory |
| **Zoom Pane** | `Prefix + z` | | Toggles zoom |
| **Kill Pane** | `Prefix + x` | | |
| **Select Pane** (Vim keys) | `Prefix + h / j / k / l` | | |
| **Select Pane** (Arrow keys) | `Alt + ← / ↓ / ↑ / →` | | No Prefix required |
| **Smart Navigate** | `Ctrl + h / j / k / l` | | Seamless Vim/Tmux navigation (No Prefix) |

## 📝 Copy Mode (Vi-Style)

| Action | Shortcut | Notes |
| :--- | :--- | :--- |
| **Enter Copy Mode** | `Prefix + [` | |
| **Navigate** | `h / j / k / l` | Standard Vim movement |
| **Begin Selection** | `v` | |
| **Rectangle Selection** | `Ctrl + v` | Toggle rectangle mode |
| **Copy (Yank)** | `y` | Copies to system clipboard (`wl-copy`) |
| **Paste Buffer** | `Prefix + ]` | Paste internal tmux buffer |
| **System Paste** | `Ctrl + Shift + V` | Standard terminal paste |

## 🔌 Plugins

### TPM (Tmux Plugin Manager)

| Action | Shortcut | Notes |
| :--- | :--- | :--- |
| **Install Plugins** | `Prefix + I` | (Capital I) Installs new plugins |
| **Update Plugins** | `Prefix + U` | Updates existing plugins |
| **Clean Plugins** | `Prefix + Alt + u` | Removes unused plugins |

### Tmux Resurrect

| Action | Shortcut | Notes |
| :--- | :--- | :--- |
| **Save Environment** | `Prefix + Ctrl + s` | Manually save sessions/panes |
| **Restore Environment** | `Prefix + Ctrl + r` | Manually restore sessions/panes |