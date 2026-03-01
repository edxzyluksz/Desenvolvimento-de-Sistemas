package com.example.rh.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.example.rh.Model.Funcionario;
import java.util.List;

public interface FuncionarioRepository extends CrudRepository<Funcionario, Long> {
    // Métodos para realizar o CRUD do Funcionário
    // Criar uma busca pela chabe primária do Funcionário
    Funcionario findById(long id);

    // Busca pelo nome
    Funcionario findByNome (String nome);

    // Busca para vários Nomes // Não existe no JPA
    @Query(value =  "select u from Funcionario u where u.nome like %?1%")
    List<Funcionario> findByNomes(String nome);
}
