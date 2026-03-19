package unidade.senai.edu.Repository;

import java.util.Optional;
import unidade.senai.edu.Model.CadastroFuncionario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FuncionarioCadastradoRepository extends JpaRepository<CadastroFuncionario, Long> {
    Optional<CadastroFuncionario> findByNifAndAtivoTrue(String nif);
    boolean existsByNifAndAtivoTrue(String nif);
}
