FROM node:16:alpine as react-application

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=react-application /app/build /usr/share/nginx/html