#!/bin/bash

./yii serve --docroot=@app/web --port=8080 127.0.0.1 &
cd web/static/ThemeAssetMedia
gulp
gulp watch &
browser-sync start -p 127.0.0.1:8080  -f '*.css' &
