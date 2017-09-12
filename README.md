docker 多容器部署LNMP

Nginx + php 7.1-fpm + Mysql + Redis

<h5><span style="text-decoration: underline;">操作方法</span></h5>
<pre style="padding-left: 30px;">
1.下載 docker-lnmp
2.修改 .env.example to .env
3.新增站台.增加 ssl(需在nginx容器內作業，執行後必須重新執行nginx容器)
    <b>ex. example.com.tw(必須和資料夾名稱相同)</b>
        $ docker-compose exec nginx
        $ sh /usr/local/bin/run-ssl.sh example.com.tw
    <b>其他說明</b>
        default.sh : 
            第一次啟動容器時會自動跑default.sh 
            default.sh主要是產生一組default的ssl-key
            user可以放一支index.php測試是否有正常啟動nginx
        
        run-ssl.sh : 
            user也可以不用執行自行建立conf 和 ssl-key
            如執行後即會copy一份default.conf並更名為example.com.tw.conf
            並產生一組example.com.tw ssl-key
       
4.修改 hosts 
    <b>ex. example.com.tw(必須和資料夾名稱相同)</b>
        192.168.99.100 dev.example.com.tw
    <b>其他說明</b>
        user自行判斷docker-machine ip
        docker-machine default ip 192.168.99.100
       
5.切換 php版本
    <b>說明</b>      
        php-fpm 提供 php5.6 和 php7.1，在.env 設定變數 PHP_VERSION
    <b>目前做法</b>
        將不同php版本分別放在不同的docker machine
        nginx + php5.6 + mysql + redis
        nginx + php7.1 + mysql + redis
        分別建議專案
</pre>


