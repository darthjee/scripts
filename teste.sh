#!/bin/bash

AAA= ps -ef | grep mlnet

echo ${AAA[0]}
echo ${AAA[1]}
echo ${AAA[2]}
echo ${AAA[3]}
