#!/bin/bash

git clone https://github.com/bikass/kora.git
cd kora
cp -r kora-light $HOME/.local/share/icons/
cd ..
rm -rf kora
