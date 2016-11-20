OpenAsk
=======

OpenAsk 是一个开源的问答系统。

运行
---

- 导入 dump.sql 到数据库
- 修改配置文件 config/db.php
- 安装依赖
```
composer install
```
- 启动 WEB 服务
```
php yii serve --docroot=@app/web --port=8080 127.0.0.1
```
- 访问首页：http://127.0.0.1:8080/

系统使用
----

- 登录请访问：http://127.0.0.1:8080/site/login ，在输入框输入用户 ID（例如 1）点击登录出现登录成功的提示

开发流程
----

- 更改当前目录到主题目录 ```cd web/themes/sf```，运行
```
npm install
```
- 启动 gulp
```
gulp && gulp watch
```
- 启动 browser-sync
```
browser-sync start -p 127.0.0.1:8080  -f '*.css'
```

