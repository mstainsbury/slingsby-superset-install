#!/bin/bash

export LC_ALL=en_GB.utf8
export LANG=en_GB.utf8

superset run -h 0.0.0.0 -p 8080 --with-threads --reload --debugger