#!/bin/bash

# Simple web server for documentation
# Starts a Python HTTP server on port 8000

PORT=${1:-8000}
DIR=${2:-.}

echo "=========================================="
echo "  Hello OCaml - Documentation Server"
echo "=========================================="
echo ""
echo "Starting server on port $PORT..."
echo "Documentation available at:"
echo "  - http://localhost:$PORT/DOCUMENTATION_FA.md"
echo "  - http://localhost:$PORT/README.md"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT --directory $DIR
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer $PORT
else
    echo "Error: Python not found. Please install Python 3."
    exit 1
fi

