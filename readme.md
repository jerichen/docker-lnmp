**docker 多容器部署LNMP <h2>** 
**Nginx + php-fpm + Mysql + Redis <h6>**

**操作方法**

* 下載 docker-lnmp 1
* 複製 .env.example to .env 並編輯.env檔案 2
* 新增nginx 預設ssl憑證 3
* 修改 hosts 4
    -ex. example.com.tw(必須和資料夾名稱相同)
        -127.0.0.1 php55.dev
        -127.0.0.1 php56.dev
        -127.0.0.1 php71.dev

**其他說明**

* 切換 php版本 1
    - 說明 : 透過nginx/sites/php*.conf 當php版本的設定樣版

