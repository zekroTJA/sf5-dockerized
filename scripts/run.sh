#!/bin/bash

set -e

if ! [ -t "server.properties" ] || [ -z "$(cat server.properties)" ]; then
    cat template.server.properties > server.properties
fi

cat <<EOF > user_jvm_args.txt
-Xmx${XMX}
-Xms${XMS}
EOF

. ./run.sh