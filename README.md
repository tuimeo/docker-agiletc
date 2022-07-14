# docker-agiletc

Simple docker project to build docker image for AgileTC(https://github.com/didi/AgileTC)

## 不装了，说中文

本项目是一个对AgileTC，这么一款来自滴滴的超轻量化测试管理软件的Docker封装。官方Repo里面其实写了如何Docker部署的，里面用到了（yestodayhadrain/case-server）这个Docker镜像。但是目前看已经没有更新了，停留在1.0.6的版本上，也没找到开放出来的Dockerfile，所以不得已自己又做了一遍。

### 使用

1. 创建一个新目录，用于放配置、数据库文件等
2. 把`docker-compose.yml`和`case-server.sql`拷贝到这个目录内
3. 在目录内，准备好数据目录。`mkdir -p data/mysql`和`mkdir -p data/uploads`
4. `docker-compose up -d`就拉起了，首次创建数据库的时候，会自动从case-server.sql这里创建表。如果你有老数据要转移的话，可以dump出来，塞到这个sql里面，就可以比较方便转移到docker环境。

### 构建镜像

譬如说，你魔改过AgileTC，又或者需要用不同的版本的，就需要自己构建了，我们也提供了构建脚本和Dockerfile。首先，我们用了git submodule，所以AgileTC目录总是指向我们指定的commit。你可以在里面魔改，切分支/commit等。然后执行`./build.sh`,就会build了。