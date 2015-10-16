#!/bin/bash

top -pid $(ps -ef | grep nanocyte-engine-simple | grep node | awk '{print $2}')
