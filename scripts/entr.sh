#!/usr/bin/env bash

find -L lib test | grep .ex | entr -sr 'mix format && mix test'
