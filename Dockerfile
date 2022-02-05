FROM node:16-alpine as react-app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=react-app /app/build /usr/share/nginx/html