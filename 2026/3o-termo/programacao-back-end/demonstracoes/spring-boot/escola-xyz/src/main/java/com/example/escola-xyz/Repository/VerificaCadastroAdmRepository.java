package com.example.escola_xyz.Repository;  

import org.springframework.data.repository.CrudRepository;
import com.example.escola_xyz.Model.VerificaCadastroAdmin;

public interface VerificaCadastroAdmRepository extends CrudRepository<VerificaCadastroAdmin, String> {
    VerificaCadastroAdmin findByCpf(String cpf);
}
