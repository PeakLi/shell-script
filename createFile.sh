#!/bin/bash
rm -rf Android.mk
touch Android.mk
echo "Hello World!" >> Android.mk
var="Http://www.google.com.cn/file.html"
echo ${var%/*} >> Android.mk
read -p "Press any key to continue"