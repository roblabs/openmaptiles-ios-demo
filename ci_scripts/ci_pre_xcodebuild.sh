#!/bin/sh
# Copyright © 2022 ePi Rational, Inc.. All rights reserved.
# SPDX-License-Identifier: MIT
# https://developer.apple.com/documentation/xcode/writing-custom-build-scripts
# The pre-xcodebuild script runs before Xcode Cloud runs the xcodebuild command. 
echo This log was generated at $(date) from: ci_pre_xcodebuild.sh

echo "# 🧱 ci_pre_xcodebuild.sh"
