#!/bin/bash
cmake -Bbuild
make -Cbuild

printf "\n\nExecuting binary...\n\n"

./build/main 32984798
./build/main 100
./build/main
