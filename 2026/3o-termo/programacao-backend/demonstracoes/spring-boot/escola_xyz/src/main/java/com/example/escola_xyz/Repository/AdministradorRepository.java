package com.example.escola_xyz.Repository;

import org.springframework.data.repository.CrudRepository;

import com.example.escola_xyz.Model.Administrador;

public interface AdministradorRepository extends CrudRepository<Administrador, String> {
    // Se precisar criar algum método específico de busca no banco de dados eu crio aqui
    Administrador findByCpf(String cpf); // Busco pelo CPF no banco
}
