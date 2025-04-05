# 使用官方 Node.js 镜像（轻量 Alpine 版）
FROM node:18-alpine

# 设置容器内的工作目录
WORKDIR /app

# 拷贝 package.json 和 package-lock.json（如果有）
COPY package*.json ./

# 安装依赖
RUN npm install

# 拷贝项目所有文件到容器
COPY . .

# 暴露端口（你的 app 监听的是 3000）
EXPOSE 3000

# 启动命令（匹配你的 index.js）
CMD ["npm", "start"]
