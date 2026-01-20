FROM node:alpine3.20

# 接收构建参数
ARG ARGO_AUTH
ARG ARGO_DOMAIN
ARG UUID

# 设置为环境变量（写入镜像）
ENV ARGO_AUTH=${ARGO_AUTH}
ENV ARGO_DOMAIN=${ARGO_DOMAIN}
ENV UUID=${UUID}

WORKDIR /tmp

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
