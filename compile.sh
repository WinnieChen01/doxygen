#!/bin/bash
# ProgramBench-style build: must produce ./executable at the repo root.
# doxygen requires bison >= 2.7; macOS ships 2.3, so use the Homebrew bison.
set -e
cd "$(dirname "$0")"
export PATH="$(brew --prefix bison)/bin:$(brew --prefix flex 2>/dev/null)/bin:$PATH"
rm -rf build
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 >/dev/null
cmake --build build -j2
cp build/bin/doxygen executable
