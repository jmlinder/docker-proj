FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD npm run build

# actual production code will be in /app/build
# FROM statements terminate the previous block.

FROM nginx
#EXPOSE is used by AWS / other providers to map certain ports
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
