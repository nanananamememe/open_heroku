#!/bin/sh
app=$1;
if [ -z "$app" ];then
    app="my_site";
fi
mkdir $app
cd $app
git init
heroku create
echo '{}' > composer.json;
echo '<p><b>Hellow World!!</b> Yes we can!!</p>' > index.html
git add .
git commit -a -m first
git push heroku master
heroku open
