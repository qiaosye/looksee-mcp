#!/usr/bin/env python3
"""Build standalone binary for looksee-mcp."""

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent

subprocess.run(
    [
        sys.executable,
        "-m",
        "PyInstaller",
        "--onefile",
        "--name",
        "looksee-mcp",
        str(ROOT / "src" / "looksee_mcp" / "server.py"),
    ],
    check=True,
    cwd=str(ROOT),
)
print("✅ 二进制文件: dist/looksee-mcp")
