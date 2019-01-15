docker 基本操作指令

<h5><span style="text-decoration: underline;">Docker 指令</span></h5>
<pre style="padding-left: 30px;">查看所有images
docker images

刪除某個image
docker rmi IMAGE_ID

刪除所有images
docker rmi $(docker images -q)

正在運行中的containers
docker ps -a

刪除某個container
docker rm CONTAINER_ID

刪除所有container
docker rmi $(docker ps -a -q)</pre>
<h5><span style="text-decoration: underline;">Dockerfile</span></h5>
<pre style="padding-left: 30px;"><b>執行 docker build . </b>

如果你的 Docker 設定檔不是命名為 Dockerfile ，
那麼你可以自已指定 Dockerfile 名稱： <b>docker build -f centosDockerfile .</b>

指定 TAG：docker build -f centosDockerfile . -t jerichen/centos-docker</pre>
<h5><span style="text-decoration: underline;">執行並啟動container</span></h5>
<pre style="padding-left: 30px;">docker run -d --name centos -it jerichen/centos-docker</pre>
<h5><span style="text-decoration: underline;">進入container</span></h5>
<pre style="padding-left: 30px;">docker exec -it centos /bin/bash</pre>
<h5><span style="text-decoration: underline;">docker-compose.yml</span></h5>
<pre>docker-compose build
docker-compose up -d (後台執行)
docker-compose stop
docker-compose down (刪除所有container)
docker-compose exec {container-name} bash</pre>
<h5><span style="text-decoration: underline;">docker-machine</span></h5>
<pre>docker machine 列表 
docker-machine ls

建立一個docker machine
docker-machine create {name}

SSH docker machine
docker-machine ssh {name}

查看資訊
docker-machine env {name}

Run docker machine
eval "$(docker-machine env {name})"

</pre>

<h5><span style="text-decoration: underline;">Selenium</span></h5>
<pre>
Selenium Grid 的結構分成 Hub 和 Node，每一次使用 Selenium Grid 進行測試任務，
都是連線到 Hub，再由 Hub 分派測試任務，指定測試任務給符合要求的 Node。
這個要求可以依照「作業系統」、「瀏覽器」的不同而有不同的區分。

NODE_MAX_SESSION  一個 node，可以開的 session 數量
NODE_MAX_INSTANCES 指定一個瀏覽器可以開啟得數量
</pre>
