FROM alpine:latest

LABEL maintainer="NaveenKumar Namachivayam" \
      website="https://qainsights.com"

# install prerequisites
RUN  apk --no-cache add openjdk11 git

# clone repo and pack
RUN \ 
    git clone https://github.com/QAInsights/jpetstore && \
    cd jpetstore && \
    ./mvnw clean package

# set work dir
WORKDIR /jpetstore

# instruction
CMD ["./mvnw","cargo:run","-P tomcat90"]

# port expose
EXPOSE 8080
