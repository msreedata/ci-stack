FROM node:alpine

MAINTAINER inSreeMan@gmail.com

# Copy app to /src.
COPY . /src

RUN npm install @angular/cli -g
RUN apk update && apk add --no-cache git
# Install app and dependencies into /src
RUN cd /src && npm install

EXPOSE 80:4000

CMD ng serve --host $(hostname) --disable-host-check