FROM node:18.16.1 AS build

#/usr/src로 이동
WORKDIR /app

# package 복사
COPY /package*.json ./
RUN npm install
#파일전체복사
COPY / .

ADD test.sh ./
RUN chmod +x ./test.sh
CMD ["./test.sh"]