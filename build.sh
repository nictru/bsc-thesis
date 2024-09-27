#!/bin/bash

mkdir -p build
pdflatex -output-directory=build main.tex
cd build && makeglossaries "main" && cd ..
pdflatex -output-directory=build main.tex

mv build/main.pdf build/Thesis.pdf
