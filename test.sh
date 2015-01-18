#!/bin/bash - 
#===============================================================================
#          FILE: test.sh
#         USAGE: ./test.sh 
#   DESCRIPTION: 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jess Portnoy (), <jess.portnoy@kaltura.com>
#  ORGANIZATION: Kaltura, inc.
#       CREATED: 01/18/2015 04:11:49 PM IST
#      REVISION:  ---
#===============================================================================

#set -o nounset     # Treat unset variables as an error
cd java
mkdir -p bin
cd bin
cp ../src/DemoImage.jpg ../src/DemoVideo.flv .
javac -d . -sourcepath ../src -cp ../lib/commons-codec-1.4.jar:../lib/commons-httpclient-3.1.jar:../lib/commons-logging-1.1.1.jar:../lib/junit-4.7.jar:../lib/log4j-1.2.15.jar ../src/com/kaltura/client/test/KalturaTestSuite.java
jar cvf  kalturaClient.jar .
cd ../
java -Dlog4j.configuration=file:src/log4j/log4j.properties -cp lib/commons-codec-1.4.jar:lib/commons-httpclient-3.1.jar:lib/commons-logging-1.1.1.jar:lib/junit-4.7.jar:lib/log4j-1.2.15.jar:bin/kalturaClient.jar org.junit.runner.JUnitCore   com.kaltura.client.test.KalturaTestSuite

