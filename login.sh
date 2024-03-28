#!/bin/bash

set timeout -1
spawn ssh minh@45.76.146.134
expect "password:"
send -- "conheohong\r"
expect "$ "
send -- "cd /home/minh/tesstJenkins/testtam\r"
expect "$ "
send -- "chmod +x build.sh\r"
expect "$ "
send -- "./build.sh\r"
send -- "exit\r"
expect eof
