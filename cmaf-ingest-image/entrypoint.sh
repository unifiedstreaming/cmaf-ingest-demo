#!/bin/sh

# validate required variables are set
if [ ! $PUB_POINT_URI ]
  then
  echo >&2 "Error: PUB_POINT_URI environment variable is required but not set."
  PUB_POINT_URI=http://live-origin/test/test.isml
fi
if [ ! $CMAF_FILES]
  then
  echo >&2 "Error: CMAF FILES variable is required but not set."
  CMAF_FILES=tos-096-750k.cmfv
fi
if [ ! $CMD_ARGS]
  then
  echo >&2 "Error: CMAF FILES variable is required but not set."
  CMD_ARGS=-r --chunked
fi
exec "$@"
