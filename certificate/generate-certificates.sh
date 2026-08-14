#!/bin/sh

. ./common.sh

generateCA
generate data-collector   ../../data-collector/config
generate event-store      ../../event-store/config
generate algotiqa         ../../gateway/config
generate inventory-server ../../inventory-server/config
generate portfolio-trader ../../portfolio-trader/config
generate storage-manager  ../../storage-manager/config
generate system-adapter   ../../system-adapter/config
generate keycloak         ../identity-provider/config
generateBrowser

rm *.srl
rm *.csr
