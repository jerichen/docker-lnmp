# docker 多容器部署LNMP 
## Nginx + php-fpm + Mysql + Redis 

**操作方法**

* 下載 docker-lnmp
* 複製 .env.example to .env 並編輯.env檔案
* 新增nginx 預設ssl憑證
* 修改 hosts
    - ex. example.com.tw(必須和資料夾名稱相同)
        - 127.0.0.1 php55.dev
        - 127.0.0.1 php56.dev
        - 127.0.0.1 php71.dev

**其他說明**

* 切換 php版本
    - 說明 : 透過nginx/sites/php*.conf 當php版本的設定樣版

