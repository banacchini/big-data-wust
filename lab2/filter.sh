#!/usr/bin/env bash

tr -dc 'a-zA-Z0-9_@#' < /dev/urandom

# -d usuwa znagi z zestawu, -c neguje zestaw, -dc usuwa wszystko co nie było w zestawie