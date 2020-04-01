
# 1st phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2nd phase starts
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html