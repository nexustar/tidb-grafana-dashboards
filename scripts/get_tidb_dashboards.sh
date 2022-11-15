#!/bin/bash

tag=$1
dst=$2
tmp="./tmp"
rm -r $dst
mkdir -p $dst
mkdir tmp

git clone --depth 1 -b $tag https://github.com/pingcap/tidb.git $tmp/tidb
cp $tmp/tidb/metrics/grafana/*.json $dst/
cp $tmp/tidb/br/metrics/grafana/*.json $dst/

git clone --depth 1 -b $tag https://github.com/tikv/pd.git $tmp/pd
cp $tmp/pd/metrics/grafana/*.json $dst/

git clone --depth 1 -b $tag https://github.com/tikv/tikv.git $tmp/tikv
cp $tmp/tikv/metrics/grafana/*.json $dst/

git clone --depth 1 -b $tag https://github.com/pingcap/tiflash.git $tmp/tiflash
cp $tmp/tiflash/metrics/grafana/*.json $dst/

git clone --depth 1 -b $tag https://github.com/pingcap/tidb-binlog.git $tmp/tidb-binlog
cp $tmp/tidb-binlog/metrics/grafana/*.json $dst/

git clone --depth 1 -b $tag https://github.com/pingcap/tiflow.git $tmp/tiflow
cp $tmp/tiflow/metrics/grafana/ticdc.json $dst/

git clone --depth 1 -b master https://github.com/pingcap/monitoring.git $tmp/monitoring
cp $tmp/monitoring/platform-monitoring/ansible/grafana/*.json $dst/

rm -rf $tmp