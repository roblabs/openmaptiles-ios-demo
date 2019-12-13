#! /bin/sh
# Add to To scheme with these commands
  # sh ${PROJECT_DIR}/Continuous-Integration/post-action-script.sh
  
export LANG=en_US.UTF-8
date

# if Xcode Server, then log several key XCS_ environment variables
if [ "$XCS" == 1 ]
then

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
