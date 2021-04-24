FROM ubuntu

# Mettre à jour la liste des paquets puis installer les dépendances de CloudNet
RUN apt-get update -y && apt-get install -y default-jre screen wget curl unzip

# Ajouter CloudNet dans le container
ADD . /usr/local/

# Corriger les permissions
RUN chmod +x /usr/local/start.sh

# Exposer les ports
EXPOSE 1410
EXPOSE 2812
EXPOSE 25565

# Définir la commande de démarrage
CMD [ "/usr/local/start.sh" ]
