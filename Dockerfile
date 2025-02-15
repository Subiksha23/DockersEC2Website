FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Squadfree/Squadfree.zip .
RUN unzip Squadfree.zip
RUN mv Squadfree/* .
RUN rm -rf Squadfree Squadfree.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
