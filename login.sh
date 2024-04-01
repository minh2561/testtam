#!/bin/bash

# Kết nối SSH và thực hiện các lệnh
ssh minh@45.76.146.134 << EOF
cd /home/minh/tesstJenkins/testtam
chmod +x build.sh
./build.sh
exit
EOF
