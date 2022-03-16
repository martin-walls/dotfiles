#!/bin/bash

kanshi &> /dev/null & pid=$!
sleep 2
kill $pid
