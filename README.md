# Étapes pour initialiser un projet React

Pour initialiser un projet React vierge, suivez les étapes ci-dessous :

1.  **Assurez-vous que Node.js et npm sont installés.**
    Vous pouvez vérifier leur installation en ouvrant un terminal et en tapant :
    ```bash
    node -v
    npm -v
    ```
    Si ce n'est pas le cas, vous pouvez les télécharger depuis le site officiel de Node.js.

2.  **Créez le projet React dans un répertoire local.**
    Il est important de ne pas utiliser de chemins réseau (UNC) pour cette étape. Ouvrez votre terminal et naviguez vers un répertoire local sur votre machine (par exemple, `C:\Users\VotreNom\Documents` ou `D:\Projets`).

    Une fois dans le répertoire souhaité, exécutez la commande suivante :
    ```bash
    npx create-react-app my-react-app
    ```
    Cette commande va créer un nouveau dossier nommé `my-react-app` contenant une application React de base.

3.  **Naviguez dans le répertoire du projet.**
    ```bash
    cd my-react-app
    ```

4.  **Démarrez l'application en mode développement.**
    ```bash
    npm start
    ```
    Votre application devrait s'ouvrir automatiquement dans votre navigateur par défaut à l'adresse `http://localhost:3000`.
