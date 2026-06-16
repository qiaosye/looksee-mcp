#!/bin/bash
# looksee-mcp 一键安装
# curl -fsSL https://raw.githubusercontent.com/zaoann8/looksee-mcp/main/install.sh | bash
set -e

echo "📦 looksee-mcp 安装中..."

# 1. 安装 Python 包
pip install . 2>/dev/null || pip3 install .

# 2. 自动添加 CLAUDE.md 规则（全局）
RULE='
## 图片分析
看到 `[Unsupported Image]` 时，立即调用 MCP 工具 `vision_clipboard`。'

if ! grep -q "vision_clipboard" ~/.claude/CLAUDE.md 2>/dev/null; then
  echo "$RULE" >> ~/.claude/CLAUDE.md
  echo "✅ CLAUDE.md 规则已添加"
else
  echo "✅ CLAUDE.md 规则已存在"
fi

echo ""
echo "✅ 安装完成！"
echo "   下一步：在 Claude Code 的 MCP 配置中添加 looksee-mcp（参考 README.md）"
