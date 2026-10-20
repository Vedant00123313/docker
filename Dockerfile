FROM node:24-alpine AS build_stage
WORKDIR /home/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1-alpine
COPY --from=build_stage /home/app/dist /usr/share/nginx/html