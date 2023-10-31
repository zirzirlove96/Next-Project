FROM node:18.15 AS build

#/usr/src로 이동
WORKDIR /app
COPY /package*.json ./

RUN npm install

#파일전체복사
COPY . .
RUN npm run build

EXPOSE 7878
CMD ["npm", "run", "start"]
