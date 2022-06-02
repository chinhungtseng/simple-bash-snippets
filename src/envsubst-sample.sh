#!/bin/bash

# export required variables first.
export NAME=Peter
export FRUIT=Apple

# print output to console and redirect same output to hellofile.
envsubst <sample.tmpl | tee hellofile
