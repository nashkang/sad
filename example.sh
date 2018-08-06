#! /bin/bash

##Function
Identify()
{
if lspci -vvv | grep -w Product\ Name | grep 332i > /dev/null ; then
  echo Pass
else
  echo Device not found or missing driver. > Result.log
fi
}

Output()
{
lspci -vvv | grep -w 332i | grep Product\ Name | awk -F: '{print $2}' > Result.log
lspci -vvv | grep -A29 332i | grep -w LnkSta | awk '{print $1 $2 $3 $4 $5}' >> Result.log
}

##shunit2
test_Identify()
{
  assertEquals "$(Identify)" "Pass"
}

source "/root/shunit2-xml/src/shell/shunit2"
