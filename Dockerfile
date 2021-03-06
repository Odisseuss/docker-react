FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/buid /user/share/nginx

