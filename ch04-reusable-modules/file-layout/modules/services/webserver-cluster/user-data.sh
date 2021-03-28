#!/bin/bash

cat > index.html <<EOF
<p>
<h1>This is Cluster: ${cluster_name}</h1>
</>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &
