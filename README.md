# Dotfiles

这是一个使用 [Dotbot](https://github.com/anishathalye/dotbot) 管理的 dotfiles 仓库。

## 什么是 Dotbot？

Dotbot 是一个轻量级的配置文件管理工具，可以帮助您：
- 自动创建符号链接（symlinks）将配置文件链接到正确位置
- 在新系统上快速部署所有配置
- 使用 Git 版本控制管理您的配置文件

**Git Submodule** 是 Git 的一个功能，允许将 Dotbot 工具本身作为子项目包含在您的仓库中，这样您就不需要单独安装 Dotbot。

## 安装

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule add https://github.com/anishathalye/dotbot
./install
```

## 快速开始

1. 克隆此仓库到您的主目录
2. 初始化 Dotbot 子模块：`git submodule add https://github.com/anishathalye/dotbot`
3. 运行 `./install` 脚本来设置符号链接
4. 根据需要自定义 `dotfiles/install.conf.yaml` 配置文件

## 配置文件结构

```
.
├── .gitignore          # Git 忽略文件
├── .gitmodules         # Git 子模块配置（配置 Dotbot 为子模块）
├── install             # 安装脚本（在根目录运行）
├── README.md           # 说明文档
├── dotbot/             # Dotbot 子模块（通过 git submodule 添加）
└── dotfiles/           # 实际的配置文件目录
    ├── install.conf.yaml  # Dotbot 配置文件
    └── ghostty/        # Ghostty 终端配置
        └── config      # Ghostty 配置文件
```

## 已包含的配置

- **Ghostty 终端配置** - 使用 Catppuccin Mocha 主题和 Maple Mono NF CN 字体

## 自定义配置

编辑 [`dotfiles/install.conf.yaml`](dotfiles/install.conf.yaml) 文件来添加您的配置文件链接：

```yaml
- link:
    ~/.config/ghostty/config: ghostty/config  # 已配置
    ~/.bashrc: bashrc
    ~/.vimrc: vimrc
    ~/.gitconfig: gitconfig
```

## 添加新的配置文件

1. 将配置文件添加到此目录
2. 在 `install.conf.yaml` 中添加对应的链接配置
3. 运行 `./install` 更新链接

## 许可证

MIT