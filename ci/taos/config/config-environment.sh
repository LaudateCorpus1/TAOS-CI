#!/usr/bin/env bash

# Do not append a license statement in the configuration file
# for a differnet license-based repository.

##
## @file     config-environment.sh
## @brief    The configuration file to maintain all scripts
## @see      https://github.com/nnstreamer/TAOS-CI
## @author   Geunsik Lim <geunsik.lim@samsung.com>
##
## This script is to maintain consistently all scripts files.
##
## If you have to run this CI script at the below environment, Please change
## the contents appropriately.
## a. In case that you want to apply this CI script to another repository
## b. In case that you have to install CI in a new CI server for more high-performance
## c. In case that you need to create new project
##

################# Modify the below statements for your server  #######################


#### Repository setting

# Add TOKEN ID to access your GitHub repository using WebHook APIs
# Refer to https://github.com/settings/tokens
# WARNING: Do NOT OPEN THE TOKEN ID OF GITHUB TO AVOID A SECURITY FLAW.
TOKEN="111111111122222222223333333333444444444455"

# Write an account name (or organization name) of the '{master|upstream}' branch
# e.g., https://github-website/{account_name}/{project_name}/
GITHUB_ACCOUNT="nnsuite"

# Write a project name (or repository name)
# e.g., https://github-website/{account_name}/{project_repo_name}/
# A repo name in github server (.._SERVER)
# A repo name in CI server (.._LOCAL)
PRJ_REPO_UPSTREAM_SERVER="TAOS-CI"
PRJ_REPO_UPSTREAM_LOCAL="TAOS-CI"

# Specify the web address of the CI server. Should end with /
CISERVER="http://<YOUR_CI_DNS>.mooo.com/"

# Prebuild group area (pr-prebuild) to inventigate source code
# Add root path of source folders. For example, specify a path of source code:
# 1) to check prohibited hardcoded paths (e.g., /home/* for now)
# 2) to check code formatting sytele with clang-format
SRC_PATH="./ci/taos/"

# If you want to use another name instead of the default TAOS name, Write the name that you
# want to use for your GitHub repository. For example, "CHATBOT", "REVIEWBOT".
BOT_NAME="TAOS"

# Skip Paths: prebuild group (pr-prebuild)
# declare a folder name to skip the file size and newline inspection.
# (e.g., <github-repository-name>/temproal-bin/)
SKIP_CI_PATHS_FORMAT="temporal-bin"

# Skip Paths: postbuild group (pr-postbuild)
# Skip build-checker / unit-test checker if all changes are limited to:
# The path starts without / and it denotes the full paths in the git repo. (regex)
SKIP_CI_PATHS_AUDIT="^ci/.*|^Documentation/.*|^\.github/.*|^obsolete/.*|^README\.md|^external/.*|^temporal-bin/.*"

# Define the number of CPUs to build source codes in parallel
# We recommend that you define appropriate # of CPUs that does not result in
# Out-Of-Memory and Too mnay task migration among the CPUs.
CPU_NUM=3

#### Automatic PR commenter: enabling(1), disabling(0)

# Inform a PR submitter of a rule to pass the CI process
pr_comment_notice=1

# Inform all developers of their activity whenever PR submitter resubmit their PR after applying comments of reviews
pr_comment_pr_updated=0

# Inform a PR submitter that they do not have to merge their own PR directly.
pr_comment_self_merge=0

# infrom a PR submitter of how to submit a PR that include lots of commits.
pr_comment_many_commit=0

# Inform a PR submitter of the webpage address in order that they can monitor the current status of their PR.
pr_comment_pr_monitor=0

# Empower CI bot to do the 'Review changes' activity (e.g., Comment, Approve, Request changes) as a reviwer
pr_comment_review_activity=1

#### Build test: Write a build type to test ex) "x86_64 i586 armv7l aarch64"
# Currently, this variable is declared to hande the "gbs build" command on Tizen.
pr_build_arch_type="x86_64"

### Check level of doxygen tag:
# Basic = 0 (@file + @brief)
# Advanced = 1 (Basic + "@author, @bug and functions with ctags")
pr_doxygen_check_level=0

### Check doxygen check for the definition (for non-header file)
# Skip function defintion = 1
# Don't skip function definition = 0
# Note that in *.h file, function definitions are still checked
pr_doxygen_check_skip_function_definition=0

### set default doxygen function check flag
# f means function definition only
# p means function prototype only
# f+p means function definition and prototype
# this will be overriden for non-header files if @a pr_doxygen_check_skip_function_definition is set
pr_doxygen_check_function_flag=f+p

### Check level of CPPCheck for a static analysis of C/C++ source code:
# CPPCheck Level 0: The check level is 'err'.
# CPPCheck Level 1: 'err' + 'warning,performance,unusedFunction'
pr_cppcheck_check_level=0


#### File size limit
# Unit of the file size is MB.
filesize_limit=5

#### Dependency policy between prebuild and postbuild group
# No dependency = 0
# Dependency = 1 (based on the order of definition)
# If dependency, PR group running order follows FCFS ordering
dep_policy_between_groups=0


#### Build mode of software platform

# BUILD_MODE_***=0  : execute a build process without a debug file.
# BUILD_MODE_***=1  : execute a build process with a debug file.
# BUILD_MODE_***=99 : skip a build process (by default)
#
# Note: if a package builder is not normally executed to generate package file,
# Please declare `BUILD_MODE_***=99` untile the issue will be fixed.
# 1) Tizen (packaging/*.spec): If a maintainer done the 'gbs' based build process,
#    you may change builde mode among 0, 1, and 99.
# 2) Ubuntu (debian/*.rule)  : If a maintainer done the 'pdebuild' based build process,
#    you may change builde mode among 0, 1, and 99.
# 3) Yocto (CMakeLists.txt)  : If a maintainer done the 'devtool' based build process,
#    you may change builde mode among 0, 1, and 99.
# 4) Android (jni/Android.mk)  : If a maintainer done the 'ndk-build' based build process,
#    you may change builde mode among 0, 1, and 99.
BUILD_MODE_TIZEN=99
BUILD_MODE_UBUNTU=99
BUILD_MODE_YOCTO=99
BUILD_MODE_ANDROID=99

# When BUILD_MODE_ANDROID is on, specify ANDROID_NDK_PATH to call ndk
ANDROID_NDK_PATH=/var/www/html/ndks/android-ndk-r22b

# Tizen: If each git repository must be defined by a different profile (e.g., ~/.gbs.conf),
# The name of TIZEN_GBS_PROFILE can be given without the "profile." prefix as follows.
# For example, [profile.tizen40_mobile] has to be declared with TIZEN_GBS_PROFILE="tizen40_mobile".
TIZEN_GBS_PROFILE=""

# Pull Request Scheduler: The number of jobs on Run-Queue to process PRs
RUN_QUEUE_PR_JOBS=8

# Version format: Major.Minor.DATE
VERSION="1.5.20200925"

#### Location of the GitHub repository
# We assume that the default folder of the www-data (user-id of Apache webserver) is "/var/www/html/" folder.

# Reference repository to speed up the exectuion time of the "git clone" command
REFERENCE_REPOSITORY="/var/www/html/$PRJ_REPO_UPSTREAM_LOCAL/"

# Specify RPM repo cache for accerating the GBS build speed of Tizen platform
REPOCACHE="/var/www/html/$PRJ_REPO_UPSTREAM_LOCAL/repo_cache/"

# GitHub repostiroy a web address
REPOSITORY_WEB="https://github.com/$GITHUB_ACCOUNT/$PRJ_REPO_UPSTREAM_SERVER"
REPOSITORY_GIT="https://github.com/$GITHUB_ACCOUNT/$PRJ_REPO_UPSTREAM_SERVER.git"

# Specify GitHub webhook API address
# a. Enterprise Edition - "https://github.{YOUR_COMPANY_DNS}/api/v3/repos/$GITHUB_ACCOUNT/$PRJ_REPO_UPSTREAM_SERVER"
# b. Community  Edition- "https://api.github.com/repos/$GITHUB_ACCOUNT/$PRJ_REPO_UPSTREAM_SERVER"
GITHUB_WEBHOOK_API="https://api.github.com/repos/$GITHUB_ACCOUNT/$PRJ_REPO_UPSTREAM_SERVER"

# Coverity module, the configuration variables for the coverity module
# https://scan.coverity.com/dashboard
# If you want to skip the build procedure, please specify a "none" value in the '_cov_build_type'.
# WARNING: Do NOT OPEN THE TOKEN ID of COVERITY TO AVOID A SECURITY FLAW.
_cov_build_type="meson"
_cov_email="your-id@gmail.com"
_cov_token="1234567890123456789012"
_cov_yellow_card=10
_cov_red_card=50

# Activate a selective PR audit to handle multiple projecst in the one GitHub repository
# a. for enterprise edition - "github.{YOUR_COMPANY_DNS}"
# b. for community  edition - "patch-diff.githubusercontent.com"
# If you want to examine all PRs, declare "SELECTIVE_PR_AUDIT=0".
# For example, if you want to activate a "doc" directory, write a "doc/" format (without "/doc/" format).
SELECTIVE_PR_AUDIT=0
PR_ACTIVATE_DIR="doc/"

