#!/usr/bin/env bash

echo "Main-Class: org.apache.spark.sql.delta.storage.COSLogStore" > MANIFEST.MF
echo "Class-Path: COSLogStore.jar" >> MANIFEST.MF

ROOTDIR=$PWD

build/sbt compile 

cd target/scala-2.12/classes 
jar -cfm $ROOTDIR/COSLogStore.jar  $ROOTDIR/MANIFEST.MF `find . -name "*.class" | grep COSLog`
cd $ROOTDIR

rm MANIFEST.MF

ls -lh COSLogStore.jar
