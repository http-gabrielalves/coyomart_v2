#build and run vite + vue
FROM node:14.17.0-alpine3.13 AS build
WORKDIR /app

COPY ./package.json ./package-lock.json /app/
RUN npm install

COPY . /app/

RUN npm run build

FROM nginx:1.21.1-alpine

COPY --from=build /app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]