package com.edxzyluksz.gamestore;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GamestoreApplication {

    public static void main(String[] args) {
        // Carrega o .env e define as variáveis no Sistema para o Spring achar
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
        dotenv.entries().forEach(entry -> System.setProperty(entry.getKey(), entry.getValue()));

        SpringApplication.run(GamestoreApplication.class, args);
    }
}