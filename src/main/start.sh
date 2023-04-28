#!/bin/bash
# @file start.sh
# @brief Startup the open-appsec-poc Docker Compose stack.
#
# @description Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
#
# === Components
#
# [plantuml, rendered-plantuml-image, svg]
#
# ....
# include::ROOT:image$bash-docs/whitebox.puml[]
# ....
#
# ==== Reverse Proxy + open-appsec agent
#
# include::ROOT:partial$services/reverse-proxy.adoc[]
#
# ==== Docs Page
#
# include::ROOT:partial$services/docs-page.adoc[]
#
# ==== Acme Audit
#
# include::ROOT:partial$services/owasp-juiceshop.adoc[]
#
# ==== OWASP Juice Shop
#
# include::ROOT:partial$services/owasp-juiceshop.adoc[]
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


readonly TOKEN_FILE=".secrets/openappsec-fritz-box.token"


if [ ! -f "$TOKEN_FILE" ]
then
    echo -e "$LOG_ERROR Cannot start docker compose stack"
    echo -e "$LOG_ERROR Missing $TOKEN_FILE"
    exit 8
fi


echo -e "$LOG_INFO Read token"
TOKEN="$(cat $TOKEN_FILE)"
readonly TOKEN
export TOKEN

echo -e "$LOG_INFO Startup services"
docker compose up -d --build
