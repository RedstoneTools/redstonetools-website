# syntax=docker/dockerfile:1
   
FROM node:18-alpine
WORKDIR /app
COPY ./package.json ./package.json
RUN npm install
CMD pnpm install --production
CMD pnpm build
COPY ./dist ./dist
ENTRYPOINT HOST=0.0.0.0 node ./dist/server/entry.mjs
EXPOSE 3000