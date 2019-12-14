#! /bin/sh
# Add to To scheme with these commands
  # sh ${PROJECT_DIR}/Continuous-Integration/metadata.sh

date

echo PROJECT_DIR = $PROJECT_DIR
gitBranch=$(git -C ${PROJECT_DIR} rev-parse --abbrev-ref HEAD)
echo gitBranch = $gitBranch
gitSHA=$(git -C ${PROJECT_DIR} rev-parse HEAD)
echo gitSHA = $gitSHA

echo CURRENT_PROJECT_VERSION = $CURRENT_PROJECT_VERSION
echo MARKETING_VERSION = $MARKETING_VERSION

echo DEVELOPMENT_TEAM = $DEVELOPMENT_TEAM
echo PREBUILD_LOG = $PREBUILD_LOG

sw_vers
/usr/bin/xcodebuild -version
system_profiler SPDeveloperToolsDataType
echo PROJECT_DIR = ${PROJECT_DIR}
cd ${PROJECT_DIR}

set -v
echo $PATH
export PATH=/usr/local/bin:.:$PATH
echo $PATH
