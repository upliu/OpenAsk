OpenAsk
=======

OpenAsk 是一个开源的问答系统。

运行
---

- 导入 dump.sql 到数据库
- 修改配置文件 config/db.php
- 运行
```
php yii serve --docroot=@app/web --port=8080 127.0.0.1
```
- 访问首页：http://127.0.0.1:8080/

系统使用
----

- 登录请访问：http://127.0.0.1:8080/site/login ，在输入框输入用户 ID（例如 4）点击登录出现登录成功的提示

开发流程
----

- 打开终端，启动 PHP 服务：```php yii serve --docroot=@app/web --port=8080 127.0.0.1```，（PHP 版本必须大于等于 5.4）
- 新建终端窗口，更改当前目录到主题目录 ```cd web/themes/sf```，启动 gulp ```gulp && gulp watch```
- 新建终端窗口，更改当前目录到主题目录 ```cd web/themes/sf```，启动 browser-sync ```browser-sync start -p 127.0.0.1:8080  -f '*.css'```

