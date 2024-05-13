# Gunakan image Node.js versi 16
FROM node:16

# Buat direktori kerja di dalam container
WORKDIR /testing

RUN npm init -y

# Salin package.json dan package-lock.json ke direktori kerja
COPY ./package*.json ./

# Install dependensi menggunakan npm
RUN npm install

# Install nodemon secara lokal di dalam proyek (development dependencies)
RUN npm install express

RUN npm install --save-dev nodemon

# Salin seluruh sumber kode ke direktori kerja
COPY ./src ./src

# Port yang akan digunakan oleh aplikasi
EXPOSE 3000

# Perintah untuk menjalankan aplikasi menggunakan nodemon ketika container dimulai
CMD ["npx", "nodemon", "src/index.js"]
