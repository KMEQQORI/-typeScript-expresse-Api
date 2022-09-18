FROM node:14.15.0-alpine3.11 as builder

ENV YARN_VERSION 1.21.1
RUN yarn policies set-version $YARN_VERSION

WORKDIR /app

COPY ["./package.json", "/app/"]
RUN yarn install

COPY "./" "/app/"

RUN yarn build
# Clean devDependencies
RUN yarn install --production


FROM node:14.15.0-alpine3.11 as runtime

WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder "/app/dist/" "/app/dist/"
COPY --from=builder "/app/resources/" "/app/resources/"
COPY --from=builder "/app/node_modules/" "/app/node_modules/"
COPY --from=builder "/app/package.json" "/app/package.json"
COPY --from=builder "/app/.sequelizerc" "/app/.sequelizerc"

CMD ["yarn","start:prod"]
