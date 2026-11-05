# Stage 1: Build React application
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ARG REACT_APP_SERVER_URL
ENV REACT_APP_SERVER_URL=$REACT_APP_SERVER_URL

RUN npm run build

# Stage 2: Serve using Nginx
FROM nginx:alpine

RUN apk update && apk upgrade --no-cacheRUN apk update && apk upgrade --no-cache

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]














