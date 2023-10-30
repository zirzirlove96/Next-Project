FROM node:18.16.1 AS build

#/usr/src로 이동
WORKDIR /app

# package 복사
COPY /my-app/package*.json ./
RUN npm install
#파일전체복사
COPY /my-app .
RUN npm build

FROM node:18.16.1  AS runner
WORKDIR /app

COPY --from=build /app/package*.json ./
COPY --from=build /app/public ./public
COPY --from=build  /app/.next/static ./.next/static

# 운영환경 Install
RUN npm install --production 

EXPOSE 7878
CMD ["npm", "start"]