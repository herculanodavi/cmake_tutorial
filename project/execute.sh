#!/bin/bash
printf "\n\nConfiguring...\n\n"

cmake -Bbuild $@

printf "\n\nBuilding...\n\n"

make -Cbuild

printf "\n\nExecuting binary...\n\n"

./build/main 32984798
./build/main 100
./build/main
