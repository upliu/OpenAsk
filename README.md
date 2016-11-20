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
- 帐号在 openask_user 表，密码都是 123456 。admin|123456

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

