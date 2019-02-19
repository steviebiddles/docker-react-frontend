## Build ##
FROM node:alpine AS build

WORKDIR '/app'

COPY package.json .
RUN yarn install

COPY . .

RUN yarn run build

## Run ##
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html