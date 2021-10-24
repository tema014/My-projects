#!/usr/bin/env bash
XVAR1=${OUTFILE}.out
echo $XVAR1
XVAR2=${OUTFILE}.err
echo $XVAR2

./cmd1 < $INFILE | ./cmd3 1> $XVAR1 2> $XVAR2
