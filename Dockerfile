FROM ubuntu

# Mettre à jour la liste des paquets puis installer les dépendances de CloudNet
RUN apt-get update -y && apt-get install -y default-jre screen sudo curl unzip

# Préparer l'emplacement et l'utilisateur de CloudNet
RUN mkdir -p /srv/cloudnet && cd /srv/cloudnet

# Télécharger la version 3.3.0 (Hurricane) de CloudNet
RUN curl -O https://github.com/CloudNetService/CloudNet-v3/releases/download/v3.3.0/CloudNet.zip && unzip CloudNet.zip && chmod +x start.sh

# Exposer les ports
EXPOSE 1410
EXPOSE 2812
EXPOSE 25565

# Définir la commande de démarrage
ENTRYPOINT [ "/bin/bash /srv/cloudnet/start.sh" ]
