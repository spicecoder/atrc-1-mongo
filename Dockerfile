FROM alpine:edge
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb yaml-cpp=0.6.2-r2
WORKDIR /temp
RUN mkdir data
RUN cd data
RUN mkdir db
WORKDIR /temp
EXPOSE 27017 
RUN  apk add nodejs
RUN  apk add npm
RUN mongo -version
RUN npm install mongo
COPY app.js .
COPY startmongo.sh . 
RUN chmod +x startmongo.sh 
RUN echo $PATH
CMD ["/bin/sh","startmongo.sh",";node", "app.js"]
