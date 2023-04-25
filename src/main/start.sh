#!/bin/bash
# @file start.sh
# @brief Startup the open-appsec-poc Docker Compose stack.
#
# @description Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
#
# === Services
#
# ==== docs-page
#
# include::ROOT:partial$services/docs-page.adoc[]
#
# === Script Arguments
#
# The script does not accept any parameters.
#
# === Script Example
#
# [source, bash]
# ```
# ./start.sh
# ```


set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace


echo -e "$LOG_INFO Run $0"
docker-compose up -d
