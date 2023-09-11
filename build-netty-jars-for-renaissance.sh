#!/bin/bash

# variables
export SKIP_TESTS=""
#export SKIP_TESTS="-DskipTests"
#export SKIP_CHECKSTYLE=""
export SKIP_CHECKSTYLE="-Dcheckstyle.skip=true"
export JAVA_HOME="/home/woodhamc/template-aarch64-jdk17u/build/bsd-aarch64-template-aarch64-release/jdk"
#export JAVA_HOME="/home/woodhamc/template-aarch64-jdk17u/build/bsd-aarch64-template-aarch64-slowdebug/jdk"
export MAVEN_OPTS="-Xint -XX:-UseCompressedClassPointers -XX:-UseCompressedOops -Xms4G -Xmx4G -XX:+UseSerialGC"
export NETTY_VERSION="4.1.94.Final-SNAPSHOT"


cd /home/woodhamc/netty
# echo ">>>>>>>>    Stage 1 - mvn clean"
# mvn clean


# package and install netty-common
# echo ">>>>>>>>    Stage 2.1 - mvn package common"
# mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl common
# echo ">>>>>>>>    Stage 2.2 - mvn install and rename common"
# mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-common \
# 	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
# 	-Dfile=/home/woodhamc/netty/common/target/netty-common-$NETTY_VERSION.jar
# mv /home/woodhamc/.m2/repository/io/netty/netty-common/$NETTY_VERSION /home/woodhamc/.m2/repository/io/netty/netty-common/$NETTY_VERSION-CHERI


# package and install buffer
# echo ">>>>>>>>    Stage 3.1 - mvn package buffer"
# mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl buffer
# echo ">>>>>>>>    Stage 3.2 - mvn install and rename buffer"
# mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-buffer \
# 	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
# 	-Dfile=/home/woodhamc/netty/buffer/target/netty-buffer-$NETTY_VERSION.jar


# package and install resolver
# echo ">>>>>>>>    Stage 4.1 - mvn package resolver"
# mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl resolver
# echo ">>>>>>>>    Stage 4.2 - mvn install and rename resolver"
# mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-resolver \
# 	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
# 	-Dfile=/home/woodhamc/netty/resolver/target/netty-resolver-$NETTY_VERSION.jar

# package and install transport
# echo ">>>>>>>>    Stage 5.1 - mvn package transport"
# mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl transport
# echo ">>>>>>>>    Stage 5.2 - mvn install and rename transport"
# mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-transport \
# 	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
# 	-Dfile=/home/woodhamc/netty/transport/target/netty-transport-$NETTY_VERSION.jar

#### NOTE - NEED TO BUILD AND LOCALLY INSTALL INTO .m2 THE PORTED VERSION OF ZSTD-JNI

# package and install codec
echo ">>>>>>>>    Stage 6.1 - mvn package codec"
mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl codec
echo ">>>>>>>>    Stage 6.2 - mvn install and rename codec"
mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-codec \
	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
	-Dfile=/home/woodhamc/netty/codec/target/netty-codec-$NETTY_VERSION.jar


# package and install transport-native-unix-common
echo ">>>>>>>>    Stage 6.1 - mvn package transport-native-unix-common"
mvn package $SKIP_TESTS $SKIP_CHECKSTYLE -X -e -pl transport-native-unix-common
echo ">>>>>>>>    Stage 6.2 - mvn install and rename transport-native-unix-common"
mvn install:install-file $SKIP_TESTS $SKIP_CHECKSTYLE -DgroupId=io.netty -DartifactId=netty-transport-native-unix-common \
	-Dversion=$NETTY_VERSION-CHERI -Dpackaging=jar \
	-Dfile=/home/woodhamc/netty/transport-native-unix-common/target/netty-transport-native-unix-common-$NETTY_VERSION.jar


#mvn clean package -DskipTests -Dcheckstyle.skip=true -X -e
#mvn clean package -Dcheckstyle.skip=true -X -e
#mvn package -Dcheckstyle.skip=true -X -e -rf :netty-codec
#mvn package -Dcheckstyle.skip=true -X -e
#mvn clean install -Dcheckstyle.skip=true -DskipTests -DgroupID=io.netty -DartifactID=netty-common -Dversion=TEST-SNAPSHOT-CHERI -Dpackaging=jar -X -e -pl common
#mvn clean package -Dcheckstyle.skip=true -DskipTests -X -e -pl common
#mvn clean package -DskipTests -Dcheckstyle.skip=true -X -e -pl common
#mvn clean install -DskipTests -Dcheckstyle.skip=true -X -e -pl common
#mvn clean package -Dcheckstyle.skip=true -X -e -pl common
#mvn clean package -DskipsTests -Dcheckstyle.skip=true -X -e -pl transport
#mvn compile -Dcheckstyle.skip=true -X -e -pl buffer
#mvn package -Dcheckstyle.skip=true -X -e -pl buffer
#mvn clean package -DskipTests -Dcheckstyle.skip=true -X -e -pl transport