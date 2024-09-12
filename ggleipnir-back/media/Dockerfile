FROM mirror.gcr.io/library/node:21

# создание директории приложения
WORKDIR /media
COPY package*.json ./

RUN npm install
COPY . .

EXPOSE 8090
CMD [ "node", "src/main.js" ]