#!/bin/sh
# Copyright © 2022 ePi Rational, Inc.. All rights reserved.
# SPDX-License-Identifier: MIT
# https://developer.apple.com/documentation/xcode/writing-custom-build-scripts
# The post-xcodebuild script runs after Xcode Cloud runs the `xcodebuild` command — even if the `xcodebuild` command fails
echo This log was generated at $(date) from: ci_post_xcodebuild.sh

echo "# 🧱 ci_post_xcodebuild.sh"
