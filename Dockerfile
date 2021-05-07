FROM node:Its-alpine:latest as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM yahyadwiyantara/go-httpserver:latest
COPY --from=builder /app/dist /static
EXPOSE 8080
