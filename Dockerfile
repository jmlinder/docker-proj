FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

# actual production code will be in /app/build
# FROM statements terminate the previous block.

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html