FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# important to set the correct path for your app
ARG BASE_PATH=/<team>/app/<app-path>/
RUN npm run build -- --base=${BASE_PATH}

# --- serve
FROM nginxinc/nginx-unprivileged:1.29.1-alpine
COPY --from=build /app/dist /usr/share/nginx/html/<team>/app/<app-path>/
