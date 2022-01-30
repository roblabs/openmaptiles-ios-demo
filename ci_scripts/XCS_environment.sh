#!/bin/sh
# Copyright © 2020-2022 ePi Rational, Inc.. All rights reserved.
# SPDX-License-Identifier: MIT
# XCS Pre-Integration Script Trigger name:   XCS_environment
echo This log was generated at $(date) from: XCS_environment.sh

# MARK: - Xcode Server Environment Variable Reference
# https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/EnvironmentVariableReference.html

if [ ${XCS} ]; then
    echo "Environment Variables from Xcode Server Bots 🤖 "
    echo XCS=${XCS}
    echo "XCS_ARCHIVE              = ${XCS_ARCHIVE}"               # The path to the .xarchive file, if archiving occurred during the integration.
    echo "XCS_BOT_NAME             = ${XCS_BOT_NAME}"
    echo "XCS_INTEGRATION_NUMBER   = ${XCS_INTEGRATION_NUMBER}"
    echo "XCS_PRIMARY_REPO_DIR     = ${XCS_PRIMARY_REPO_DIR}"
    echo "XCS_SOURCE_DIR           = ${XCS_SOURCE_DIR}"
    echo "XCS_DERIVED_DATA_DIR     = ${XCS_DERIVED_DATA_DIR}"
    echo "XCS_PRIMARY_REPO_REVISION= ${XCS_PRIMARY_REPO_REVISION}" # Only used when not checking out a branch or a tag.
    echo "XCS_PRIMARY_REPO_BRANCH  = ${XCS_PRIMARY_REPO_BRANCH}"   # Only used when checking out a branch.
    echo "XCS_PRIMARY_REPO_TAG     = ${XCS_PRIMARY_REPO_TAG}"      # Only used when checking out a tag.
    echo "XCS_OUTPUT_DIR           = ${XCS_OUTPUT_DIR}"
    echo "XCS_BOT_ID               = ${XCS_BOT_ID}"
    echo "XCS_PRODUCT              = ${XCS_PRODUCT}"               # The path to the .app, .ipa, or .package file, if a product was exported from an archive during the integration.
    echo "XCS_BOT_TINY_ID          = ${XCS_BOT_TINY_ID}"
    echo "https://Bots JSON        = https://$(hostname):20343/api/bots"
    echo "https://bots/latest      = https://$(hostname)/xcode/bots/latest"
    echo "https://latest this bot  = https://$(hostname)/xcode/bots/latest/${XCS_BOT_TINY_ID}"
    echo "https://Integration JSON = https://$(hostname)/xcode/internal/api/integrations/${XCS_INTEGRATION_ID}"
    echo "https://Download         = https://$(hostname)/xcode/internal/api/integrations/${XCS_INTEGRATION_ID}/assets"
    echo "xcbost://See Bot in Xcode= xcbot://$(hostname)/botID/${XCS_BOT_ID}/integrationID/${XCS_INTEGRATION_ID}"

    # Git metadata
    gitBranch=$(/usr/bin/git -C ${XCS_PRIMARY_REPO_DIR} rev-parse --abbrev-ref HEAD)
    echo branch = $gitBranch
    gitSHA=$(/usr/bin/git -C ${XCS_PRIMARY_REPO_DIR} rev-parse HEAD)
    echo SHA = $gitSHA
fi

# set verbose
set -v

# MARK: - build environment
hostname

# print Mac OS X operating system version information
sw_vers

# Print operating system name
uname -a

# Xcode version & path
/usr/bin/xcodebuild -version
/usr/bin/xcode-select -print-path

# installed SDKs
/usr/bin/xcodebuild -showsdks -json
system_profiler -json SPDeveloperToolsDataType

set +v

