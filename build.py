#!/usr/bin/env python3
"""Build standalone binary for looksee-mcp."""

import subprocess
import sys

subprocess.run(
    [
        sys.executable,
        "-m",
        "PyInstaller",
        "--onefile",
        "--name",
        "looksee-mcp",
        "--add-data",
        ".env.example:.",
        "src/looksee_mcp/server.py",
    ],
    check=True,
)
print("✅ 二进制文件: dist/looksee-mcp")
