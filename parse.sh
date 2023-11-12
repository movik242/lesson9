#!/bin/bash
sh /root/Bash/scriptIP.sh > parse.txt
sh /root/Bash/scriptURL.sh >> parse.txt
sh /root/Bash/error.sh >> parse.txt

cat parse.txt
rm parse.txt
