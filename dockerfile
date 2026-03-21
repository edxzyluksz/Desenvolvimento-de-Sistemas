## Estágio de Compilação
## Uma imagem do linux para compilar o projeto

FROM ubuntu:latest AS build

## Instalar o JAVA
RUN apt-get update
RUN apt-get install -y openjdk-21-jdk 

# A flag -y é para não solicitar confirmação durante a instalação

## Instalar o Maven
RUN apt-get install -y maven

## Copiar o código fonte para dentro do container
COPY . .

RUN mvn clean install -DskipTests

## Execução do Projeto
FROM eclipse-temurin:21-jdk-jammy

## Expor a porta 8080
EXPOSE 8080
# Isso significa que o aplicativo estará disponível na porta 8080 quando o container estiver em execução.

## Copiar o arquivo JAR da compilação para o container (Executável do Java)
COPY --from=build /target/gamestore-0.0.1-SNAPSHOT.jar app.jar
# A pasta target é onde o Maven coloca os arquivos compilados, incluindo o arquivo JAR do projeto.

## Definir o comando de inicialização do container
ENTRYPOINT ["java", "-jar", "app.jar"]
# Isso indica que, quando o container for iniciado, ele executará o comando java -jar

## Dúvida final: Quem executa o dockerfile?

# O Dockerfile é executado pelo Docker, que é uma plataforma de contêinerização. 
# Para construir a imagem a partir do Dockerfile, você usaria o comando `docker build` no terminal, especificando o caminho para o Dockerfile