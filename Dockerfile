# Primera etapa: Compilación de la aplicación
FROM node:lts AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Segunda etapa: Ejecución de la aplicación
FROM node:lts-alpine
WORKDIR /app
COPY --from=build /app/build ./build
COPY package*.json ./
RUN npm install --only=production
CMD ["node", "build/main.js"]
