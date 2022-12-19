#! /bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=awsProject

echo "> Build 파일 복사"

cp $REPOSITORY/zip/*.jar $REPOSITORY/

echo "> 현재 구동 중인 애플리케이션 pid 확인"

CURRENT_PID=$(pgrep -fl awsProjecat | grep jar | awk '{print $1}')  # pgrep : process id 만 추출하는 명령어

echo "현재 구동중인 애플리케이션 pid: $CURRENR_PID"

if [ -z "$CURRENT_PID" ]; then
        echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다"
else
        echo "> kill -15 $CURRENT_PID"
        kill -15 $CURRENT_PID
        sleep 5
fi

echo "> 새 애플리케이션 배포"

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)
# 새로 실행할 jar파일 명을 찾는다. tail -n1로 가장 나중의 jar파일을 변수에 저장

echo "> JAR Name : $JAR_NAME"

echo "> $JAR_NAME 에 실행권한 추가"

chmod +x $JAR_NAME

echo "> $JAR_NAME 실행"

nohup java -jar \
-Dspring.config.location=classpath:/application.properties,/home/ec2-user/app/application-oauth.properties,
/hoem/ec2-user/app/application-real-db.properties,classpath:/application-real.properties \
-Dspring.profiles.active=real \
$JAR_NAME > $REPOSITORY/nohup.out 2>&1 &