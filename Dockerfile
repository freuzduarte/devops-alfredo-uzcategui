# Primera etapa: Compilación de la aplicación
#En esta estapa instalamos las dependencias necesarias para la aplicacion y luego la construimos
#Para luego el resultado se copia a nginx
FROM node:lts AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Segunda etapa: Ejecución de la aplicación
# la construccion de la app anterior viene con el nombre de build
FROM nginx:1.25.3-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]