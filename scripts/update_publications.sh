#!/usr/bin/env bash
set -euo pipefail

# update_publications.sh
#
# Runs both publication update steps in sequence:
#   1. Fetch Chicago-style citations from the Zotero API
#   2. Generate _publications/*.md stubs for any new publications
#
# Any flags (e.g. --test, --clear-cache) are passed through to fetch_zotero_citations.rb.
# Run from the repo root, or from anywhere — the script resolves paths automatically.
#
# Usage:
#   ./scripts/update_publications.sh
#   ./scripts/update_publications.sh --test
#   ./scripts/update_publications.sh --clear-cache

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${REPO_ROOT}"

echo "=== Step 1: Fetching Zotero citations ==="
ruby scripts/fetch_zotero_citations.rb "$@"

echo ""
echo "=== Step 2: Generating publication page stubs ==="
ruby scripts/generate_publication_pages.rb

echo ""
echo "=== Done. Commit any new/changed files in _data/ and _publications/ ==="
