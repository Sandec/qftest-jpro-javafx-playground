#!/bin/bash

# build release
./gradlew jproRelease

# create runtime dir
mkdir -p runtime

# copy release to runtime
cp build/distributions/qftest-jpro-javafx-playground-jpro.zip runtime/

# download loadbalancer
cd runtime
curl -LO https://sandec.jfrog.io/artifactory/repo/one/jpro/jpro-loadbalancer/2025.3.1/jpro-loadbalancer-2025.3.1.jar
