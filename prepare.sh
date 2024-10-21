#!/bin/bash

# build release
./gradlew jproRelease

# create runtime dir
mkdir -p runtime

# copy release to runtime
cp build/distributions/qftest-jpro-javafx-playground-jpro.zip runtime/

# download loadbalancer
cd runtime
URL="curl -LO https://sandec.jfrog.io/artifactory/repo/one/jpro/jpro-loadbalancer/0.14.0-SNAPSHOT/jpro-loadbalancer-0.14.0-SNAPSHOT.jar"
curl -LO https://sandec.jfrog.io/artifactory/repo/one/jpro/jpro-loadbalancer/0.14.0-SNAPSHOT/jpro-loadbalancer-0.14.0-SNAPSHOT.jar
