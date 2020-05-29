# get ip address of virtual machine to view app
# $ docker-machine ip default

FROM node:12

WORKDIR /opt/node_app
COPY ./package*.json ./
RUN npm i --no-optional && npm cache clean --force
ENV PATH /opt/node_app/node_modules/.bin:$PATH
WORKDIR /opt/node_app/app
COPY ./ ./ 
ENV PORT=8080
EXPOSE 8080
CMD npm run dev-server
