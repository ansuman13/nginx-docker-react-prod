FROM node:21-alpine AS builder

WORKDIR /app
COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:1
COPY --from=builder /app/build /usr/share/nginx/html