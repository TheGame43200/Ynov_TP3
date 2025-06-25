# Étape 1 : Construction de l'application React
FROM node:18-alpine as build

WORKDIR /app

# Copie les fichiers package.json et package-lock.json du dossier my-react-app
COPY my-react-app/package*.json ./
RUN npm install

# Copie le reste des fichiers de l'application React
COPY my-react-app/. .
RUN npm run build

# Étape 2 : Serveur web pour l'application
FROM nginx:alpine

# Copie les fichiers construits de l'étape de build vers le répertoire de service de Nginx
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]