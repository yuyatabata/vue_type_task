# ベースイメージ
FROM node:13.10.1-alpine3.11
# vue-cliインストール
RUN npm install --global @vue/cli
# 作業ディレクトリ指定
WORKDIR /myprojects