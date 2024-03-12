#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/test/app"
JAR_FILE="/home/ubuntu/test/co-pro-0.0.1-SNAPSHOT.jar"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# build 파일 복사
echo "$TIME_NOW > $JAR_FILE 파일 복사" >> $DEPLOY_LOG
cp $PROJECT_ROOT/build/libs/*.jar /home/ubuntu/test

# jar 파일 실행
echo "$TIME_NOW > $JAR_FILE 파일 실행" >> $DEPLOY_LOG
cd /home/ubuntu/test
nohup java -jar $JAR_FILE > $APP_LOG 2> $ERROR_LOG < /dev/null &

CURRENT_PID=$(lsof -ti tcp:9091)
echo "$TIME_NOW > 실행된 프로세스 아이디 $CURRENT_PID 입니다." >> $DEPLOY_LOG