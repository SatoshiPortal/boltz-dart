#!/bin/bash
cd boltz-dart || exit 1
bash linux.sh "$VERSION"
exec "$@"