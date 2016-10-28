#!/bin/bash
sed -i 's/user name="test"/user name=\"'"$MYCAT_USER"'"/' /usr/local/mycat/conf/server.xml
sed -i 's/name="password">test/name="password">'"$MYCAT_PASS"'/' /usr/local/mycat/conf/server.xml
mysqld_safe & /usr/local/mycat/bin/mycat start & httpd & /usr/local/tomcat/bin/catalina.sh run
