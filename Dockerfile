FROM node:lts as builder

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM node:lts-slim

ENV NODE_ENV production
USER node

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm ci --production

COPY --from=builder /usr/src/app/dist ./dist

RUN ls -lhtr

EXPOSE 3000

LABEL org.opencontainers.image.source=https://github.com/guilhermelange/node-api-deploy

CMD [ "node", "dist/src/index.js" ]