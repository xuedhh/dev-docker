# zz-med 开发环境

# 容器

- nginx  121.0.0.2
- php    121.0.0.3


# 本机修改host

```
127.0.0.1       doc-api.zz-med-local.com
127.0.0.1       patient-api.zz-med-local.com
127.0.0.1       common-api.zz-med-local.com
127.0.0.1       admin-center.zz-med-local.com
127.0.0.1       saas-base-service.zz-med-local.com
127.0.0.1       agreement-service-base.zz-med-local.com
127.0.0.1       saas-survey-service.zz-med-local.com
127.0.0.1       bp-api.zz-med-local.com
```


# 初始化项目

```
# 当前目录下创建文件夹
mkdir projects && cd projects


# 拉取需要的项目如：doc-api 等
git clone ssh://git@gitlab.zz-med-stg.com:2224/mmc-server/doc-api.git


# 当前目录下执行
docker-compose up -d

# 进入php机器
docker exec -it zzmed-php bash

# 进入nginx机器
docker exec -it zzmed-nginx bash
```
