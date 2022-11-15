#!/bin/bash

vers=("5.3" "5.4" "6.0" "6.1" "6.2" "6.3")

for ver in ${vers[@]}; do
    $(dirname $0)/get_tidb_dashboards.sh "release-${ver}" "v${ver}.x"
done
