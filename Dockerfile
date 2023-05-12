# syntax=docker/dockerfile:1
   
FROM node:18-alpine
WORKDIR /app
RUN npm install @astrojs/node
CMD pnpm install --production
CMD pnpm build
COPY ./dist ./dist
ENTRYPOINT HOST=0.0.0.0 node ./dist/server/entry.mjs
EXPOSE 3000