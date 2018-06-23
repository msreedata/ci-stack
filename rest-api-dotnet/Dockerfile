FROM microsoft/dotnet:2.1-sdk-alpine

MAINTAINER inSreeMan@gmail.com

# Copy app to /src.
COPY . /src

RUN apk update && apk add --no-cache git
# Install app and dependencies into /src
RUN cd /src && dotnet restore

EXPOSE 5001

CMD dotnet run