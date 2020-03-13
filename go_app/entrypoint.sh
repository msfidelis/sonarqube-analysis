#!/bin/bash

PROJECT=${PWD##*/}
VERSION=$(git rev-parse --short HEAD)
echo $PROJECT
echo $VERSION

FILE=./sonar-project.properties

if test -f "$FILE"; then
    echo "$FILE exist"
else
    echo "$FILE dont exists, creating..."

    echo "
sonar.host.url=http://sonar:9000
sonar.projectKey=$PROJECT
sonar.projectName=$PROJECT
sonar.projectVersion=$VERSION
sonar.sources=./
sonar.sourceEncoding=UTF-8
" > sonar-project.properties

fi