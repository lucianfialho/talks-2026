#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
python3 -m http.server 8731 >/dev/null 2>&1 & SRV=$!; sleep 2
node gen-pdf.js; kill "$SRV" 2>/dev/null || true
