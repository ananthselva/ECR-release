FROM node:18 as build

WORKDIR /app

COPY package*.json ./

RUN npm install --force

COPY . .

RUN npm run build

FROM nginx:1.23.1

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 8090

CMD ["nginx", "-g", "daemon off;"]

