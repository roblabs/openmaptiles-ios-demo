#!/bin/sh
# Copyright © 2022 ePi Rational, Inc.. All rights reserved.
# SPDX-License-Identifier: MIT
# https://developer.apple.com/documentation/xcode/writing-custom-build-scripts
# The post-clone script runs after Xcode Cloud clones your Git repository
echo This log was generated at $(date) from: ci_post_clone.sh

echo "# Fetching Mapbox Maps v10 🗺"
touch ~/.netrc
echo "machine api.mapbox.com" > ~/.netrc
echo "login mapbox" >> ~/.netrc
echo "password ${MAPBOX_TOKEN}" >> ~/.netrc
ls -l ~/.netrc

echo "# curl 🥌, either a Zip 🤐 or MBTiles 🗺"
export INPUT_ZIP_OR_MBTILES=""
export OUTPUT__ZIP_OR_MBTILES=""

# Already installed on macOS
# use `curl --location` to follow HTTP 3xx redirects
#   curl --location --output ${OUTPUT_ZIP_FILE} ${INPUT_ZIP_OR_MBTILES}
curl --version

# TODO: extract tiles from native sqlite3 commands
sqlite3 -version

# TODO: unzip compressed version of map tiles
unzip -version

# MARK: XCS — Xcode Server Bots 🤖
if [ ${XCS} ]; then
    bash $PROJECT_DIR/ci_scripts/XCS_environment.sh
fi
