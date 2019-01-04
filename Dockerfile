FROM node:alpine as build-phase
WORKDIR /root/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build-phase /root/app/build /usr/share/nginx/html
