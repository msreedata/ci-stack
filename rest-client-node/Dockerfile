FROM node:alpine

MAINTAINER inSreeMan@gmail.com

# 1. Setup runtime environment
RUN npm install @angular/cli -g
RUN apk update && apk add --no-cache git

# 2. Install project dependencies
COPY --no-cache ./package.json /src
RUN cd /src && npm install

# 3. Update source code
COPY . /src

# 4. Prelaunch actions
EXPOSE 80:4000

# 5. Defult launch action : May be overriden in stackfile
CMD ng serve --host $(hostname) --disable-host-check