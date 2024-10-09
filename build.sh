#!/bin/bash

mkdir -p build
pdflatex -output-directory=build main.tex

mv build/main.pdf build/Thesis.pdf
