#!/bin/sh

set -e

exec fluentd -c ${FLUENTD_CONF_PATH}/${FLUENTD_CONF} -p /fluentd/plugins --gemfile /fluentd/Gemfile ${FLUENTD_OPT}
