#!/bin/bash
ROOT="target"
VERSION=$1
NAME="libboltz"
LIB=$ROOT/$NAME.$VERSION

zip -r $LIB.zip $LIB