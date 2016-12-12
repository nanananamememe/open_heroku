#!/bin/sh
app=$1;
if [ -z "$app" ];then
    app="short_url";
fi
git clone https://github.com/nanananamememe/short_url $app;
cd $app;
heroku create;
heroku addons:create heroku-redis:hobby-dev;
git push heroku master;
state=`heroku addons:info heroku-redis|grep State|awk '{print $2}'`;
hold="creating"
while [ $state = $hold ]
do
    echo "heroku-redis state $state.";
    sleep 10s;
    state=`heroku addons:info heroku-redis|grep State|awk '{print $2}'`;
done;
echo "Allrady heroku-redis state $state.";
heroku open;
