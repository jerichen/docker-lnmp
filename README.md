docker 多容器部署LNMP

Nginx + php 7.1-fpm + Mysql + Redis

<h5><span style="text-decoration: underline;">操作方法</span></h5>
<pre style="padding-left: 30px;">
1.下載 docker-lnmp
2.修改 .env.example to .env
3.新增站台.增加ssl
    <b>ex. example.com.tw(必須和資料夾名稱相同)</b>
        $ docker-compose exec nginx
        $ sh /usr/local/bin/run-ssl.sh example.com.tw
    <b>其他說明</b>
        run-ssl.sh(user也可以不用執行自行建立conf)
        執行後即會copy一份example.com.tw.conf
        並產生一組ssl key
       
4.修改 hosts 
    <b>ex. example.com.tw(必須和資料夾名稱相同)</b>
        192.168.99.100 dev.example.com.tw
</pre>


