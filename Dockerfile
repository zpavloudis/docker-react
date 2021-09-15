# Build phase.
# No need for volume system as this is production build,
# it follows that no changes to code will occur in production
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase.
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
# nginx automatically starts-up at this point





