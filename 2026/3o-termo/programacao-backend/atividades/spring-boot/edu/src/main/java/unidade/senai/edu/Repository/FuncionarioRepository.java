package unidade.senai.edu.Repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import unidade.senai.edu.Model.Funcionario;

public interface FuncionarioRepository extends JpaRepository<Funcionario, Long> {
    Optional<Funcionario> findByNif(String nif);
    boolean existsByNif(String nif);
}
