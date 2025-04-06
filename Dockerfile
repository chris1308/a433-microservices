# base image node js versi 14
FROM node:14-alpine 

# menentukan working directory menjadi /app
WORKDIR /app

# menyalin isi source code ke workdir di container
COPY . .

# menentukan agar app jalan di prod mode, dan db host ke container item-db
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies untuk prod dan build app
RUN npm install --production --unsafe-perm && npm run build

# expose port 8080
EXPOSE 8080 

# menyalakan server dengan npm start
CMD ["npm", "start"]