docker 多容器部署LNMP

Nginx + php-fpm + Mysql + Redis

<h5><span style="text-decoration: underline;">操作方法</span></h5>
<pre style="padding-left: 30px;">
1.下載 docker-lnmp
2.複製 .env.example to .env 並編輯.env檔案
3.新增nginx 預設ssl憑證
        make_ssl.sh : 
            產生一組nginx的ssl-key pair
4.修改 hosts 
    <b>ex. example.com.tw(必須和資料夾名稱相同)</b>
        127.0.0.1 php55.dev
        127.0.0.1 php56.dev
        127.0.0.1 php71.dev
    <b>其他說明</b>
       
5.切換 php版本
    <b>說明</b> 
       透過nginx/sites/php*.conf 當php版本的設定樣版   
</pre>


