#!/bin/bash
echo $(( $(echo "$@" |tr ' ' '+' )))
