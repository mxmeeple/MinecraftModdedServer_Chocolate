FROM openjdk:17-bullseye
RUN apt update && apt upgrade -y && apt install zip -y
VOLUME /server
WORKDIR /server
RUN curl https://mediafilez.forgecdn.net/files/5256/791/Chocolate_Edition_1.5.6_server_pack.zip --output /server.zip && \
    unzip /server.zip -d /server && \
    chmod +x start.sh && \
    rm /server.zip
RUN echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://aka.ms/MinecraftEULA)." > eula.txt && \
    echo "eula=true" >> eula.txt
EXPOSE 25565
ENTRYPOINT ["./start.sh"]
