#!/bin/sh


# mysqlとhttpdの起動数を取得

UP=$(pgrep mysql | wc -l);
if [ "$UP" -ne 1 ];
then
        echo "MySQL is down.";
        curl -X POST -H "X-ChatWorkToken: 06ae85662ce3084c35dfecfbf0af0e32" -d "body=mysql落ちてたので再起動しました&self_unread=0" "https://api.chatwork.com/v2/rooms/171437221/messages"
        systemctl restart mysql

else
        echo "All is well.";
fi

HTTPD_UP=$(pgrep httpd | wc -l);
if [ "$HTTPD_UP" -ne 1 ];
then
        echo "httpd is down.";
        curl -X POST -H "X-ChatWorkToken: 06ae85662ce3084c35dfecfbf0af0e32" -d "body=httpd落ちてたので再起動しました&self_unread=0" "https://api.chatwork.com/v2/rooms/171437221/messages"
        systemctl restart httpd

else
        echo "All is well.";
fi

