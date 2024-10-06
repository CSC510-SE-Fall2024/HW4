#!/bin/bash

ps aux | grep '[i]nfinite.sh' | gawk '{print $2}' | xargs kill