#!/bin/bash

awk ' {
printf("%s\t", $1)
for (i=2; i<=NF; i++)
	printf("%i:%s\t", i-1,$i)
printf("\n") # CR at end of line
} ' $1
