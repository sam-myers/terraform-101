#!/usr/bin/env bash

docker pull "${portworx_container}"
docker run \
    --entrypoint /runc-entry-point.sh \
    --rm --privileged=true \
    -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx \
    "${portworx_container}" --upgrade

/opt/pwx/bin/px-runc install \
    -k "consul://127.0.0.1:8500" \
    -c "demo-cluster" \
    -a

systemctl daemon-reload
systemctl enable portworx
systemctl restart portworx
