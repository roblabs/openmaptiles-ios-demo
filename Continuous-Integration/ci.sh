#! /bin/sh
# Add to To scheme with these commands
  # sh ${PROJECT_DIR}/../Continuous-Integration/ci.sh
  
export LANG=en_US.UTF-8   # to avoid Pod WARNING: CocoaPods requires your terminal to be using UTF-8 encoding.

# Output log name
export PREBUILD_LOG=${PROJECT_DIR}/prebuild.log
rm -f $PREBUILD_LOG

# Xcode Server, then use the integration number
if [ $XCS -eq 1 ]
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
  echo PROJECT_DIR = $PROJECT_DIR
  echo XCS_SOURCE_DIR = $XCS_SOURCE_DIR
  echo XCS_OUTPUT_DIR = $XCS_OUTPUT_DIR
  echo XCS_DERIVED_DATA_DIR = $XCS_DERIVED_DATA_DIR
  echo XCS_XCODEBUILD_LOG = $XCS_XCODEBUILD_LOG
fi

# Xcode Pre-build scripts goto stdError, so use this to capture
exec > $PREBUILD_LOG 2>&1
echo PREBUILD_LOG = $PREBUILD_LOG

echo PROJECT_DIR = ${PROJECT_DIR}
cd ${PROJECT_DIR}

set -v
echo $PATH
export PATH=/usr/local/bin:.:$PATH
echo $PATH
sw_vers
/usr/bin/xcodebuild -version
system_profiler SPDeveloperToolsDataType
pod --version
pod install

open $PREBUILD_LOG
