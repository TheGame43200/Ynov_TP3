# Étapes pour initialiser un projet React
Pour initialiser un projet React vierge, suivez les étapes ci-dessous :
1.  **Créez le projet React dans un répertoire local.**
    Ouvrir  terminal dans le répertoire local souhaiter et exécutez la commande suivante :
    npx create-react-app my-react-app
    Cette commande va créer un nouveau dossier nommé `my-react-app` contenant une application React de base.
    cd my-react-app
    npm start

    L'application devrait s'ouvrir automatiquement à l'adresse `http://localhost:3000`.

# 3. Création du Dockerfile

Créez un fichier nommé `Dockerfile` à la racine de votre projet (au même niveau que le dossier `my-react-app`). Copiez le contenu suivant dans ce fichier :

```dockerfile
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
```

# 4. Instanciation de l'image Docker

Une fois le Dockerfile créé, vous pouvez construire l'image Docker et lancer un conteneur.

1.  **Construire l'image Docker :**
    Assurez-vous d'être à la racine de votre projet (là où se trouve le `Dockerfile`) et exécutez la commande suivante :
    ```bash
    docker build -t my-react-app-image .
    ```

2.  **Lancer un conteneur à partir de l'image :**
    Une fois l'image construite, vous pouvez lancer un conteneur et mapper un port local au port 80 du conteneur (où Nginx sert l'application) :
    ```bash
    docker run -p 80:80 my-react-app-image
    ```
    Votre application React devrait maintenant être accessible dans votre navigateur à l'adresse `http://localhost:80`.
