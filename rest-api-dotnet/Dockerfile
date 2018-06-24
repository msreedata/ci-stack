FROM microsoft/dotnet:2.1-sdk-alpine

MAINTAINER inSreeMan@gmail.com

# 1. Setup runtime environment
RUN apk update && apk add --no-cache git

# 2. Install project dependencies
#COPY ./*.csproj /src
COPY ProductAPI.csproj /src/
WORKDIR /src/

#COPY . /src
RUN dotnet restore

# 3. Update source code
COPY . /src

# 4. Prelaunch actions
EXPOSE 5001

# 5. Defult launch action : May be overriden in stackfile
CMD dotnet run