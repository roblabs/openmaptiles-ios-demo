#! /bin/sh
# This file is called:  Continuous-Integration/ci.sh

# Add to scheme with these commands
  # sh ${PROJECT_DIR}/Continuous-Integration/ci.sh
  

# Output log name
export PREBUILD_LOG=${PROJECT_DIR}/prebuild.log
rm -f $PREBUILD_LOG

# check if we are usings Xcode Server Bots integration
if [ "$XCS" == 1 ]
then
  export PREBUILD_LOG=${PROJECT_DIR}/prebuild.${XCS_BOT_TINY_ID}.${XCS_INTEGRATION_NUMBER}.log
fi

# Xcode Pre-build scripts goto stdError, so use this to capture
exec > $PREBUILD_LOG 2>&1

export LANG=en_US.UTF-8   # to avoid Pod WARNING: CocoaPods requires your terminal to be using UTF-8 encoding.
date

# if Xcode Server, then log several key XCS_ environment variables
if [ "$XCS" == 1 ]
then
  export PREBUILD_LOG=${PROJECT_DIR}/prebuild.${XCS_BOT_TINY_ID}.${XCS_INTEGRATION_NUMBER}.log

  echo XCS = $XCS
  echo XCS_BOT_NAME = $XCS_BOT_NAME
  echo XCS_BOT_ID = $XCS_BOT_ID
  echo XCS_BOT_TINY_ID = $XCS_BOT_TINY_ID
  echo XCS_INTEGRATION_ID = $XCS_INTEGRATION_ID
  echo XCS_INTEGRATION_TINY_ID = $XCS_INTEGRATION_TINY_ID
  echo XCS_INTEGRATION_NUMBER = $XCS_INTEGRATION_NUMBER
  echo XCS_INTEGRATION_RESULT = $XCS_INTEGRATION_RESULT
  echo XCS_SOURCE_DIR = $XCS_SOURCE_DIR
  echo XCS_OUTPUT_DIR = $XCS_OUTPUT_DIR
  echo XCS_DERIVED_DATA_DIR = $XCS_DERIVED_DATA_DIR
  echo XCS_XCODEBUILD_LOG = $XCS_XCODEBUILD_LOG
  echo INTEGRATION_URL = https://$(hostname)/xcode/bots/${XCS_BOT_TINY_ID}/integrations/${XCS_INTEGRATION_TINY_ID}
fi

echo PROJECT_DIR = $PROJECT_DIR
gitBranch=$(git -C ${PROJECT_DIR} rev-parse --abbrev-ref HEAD)
echo gitBranch = $gitBranch
gitSHA=$(git -C ${PROJECT_DIR} rev-parse HEAD)
echo gitSHA = $gitSHA

echo CURRENT_PROJECT_VERSION = $CURRENT_PROJECT_VERSION
echo MARKETING_VERSION = $MARKETING_VERSION

echo DEVELOPMENT_TEAM = $DEVELOPMENT_TEAM
echo PREBUILD_LOG = $PREBUILD_LOG
sw_vers                                     # macOS Version
/usr/bin/xcodebuild -version                # xcode
system_profiler SPDeveloperToolsDataType    # Developer tools including SDK version
echo PROJECT_DIR = ${PROJECT_DIR}
cd ${PROJECT_DIR}

set -v
echo $PATH
export PATH=/usr/local/bin:.:$PATH
echo $PATH

date
carthage version
carthage update
wait
date

echo PREBUILD_LOG = $PREBUILD_LOG
open $PREBUILD_LOG
