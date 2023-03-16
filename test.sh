#!/bin/sh
WASMTIME_BACKTRACE_DETAILS=1

(
    echo '*** TESTING EXE'
    cd exe
    zig build
    echo
    echo '** wasmtime'
    wasmtime zig-out/bin/exe.wasm
    echo
    echo
    echo '** function-runner'
    echo '{}' | function-runner -f zig-out/bin/exe.wasm
)

echo

(
    echo '*** TESTING LIB'
    cd lib
    zig build
    echo
    echo '** wasmtime'
    wasmtime zig-out/lib/lib.wasm
    echo
    echo
    echo '** function-runner'
    echo '{}' | function-runner -f zig-out/lib/lib.wasm
)