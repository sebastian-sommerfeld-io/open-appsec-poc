#!/bin/bash
# @file stop.sh
# @brief Shutdown the open-appsec-poc Docker Compose stack.
#
# @description Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
# tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam
# et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem#
# ipsum dolor sit amet.
#
# === Script Arguments
#
# The script does not accept any parameters.
#
# === Script Example
#
# [source, bash]
# ```
# ./stop.sh
# ```


set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace


echo -e "$LOG_INFO Shutdown services and clean up"
docker compose down -v --rmi all
