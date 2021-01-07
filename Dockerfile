# stage 1 build and put it in builder from node:alpine as builder
FROM node:alpine as builder
WORKDIR '/Documents/DockerWorkdir/'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "start"]

# second stage run nginix from builder above nd copy it into a build subdirectory inside WORKDIR and then map it to /usr/share/nginx/html so nginx can run from share\
FROM nginx
COPY --from=builder /Documents/DockerWorkdir/build /usr/share/nginx/html
