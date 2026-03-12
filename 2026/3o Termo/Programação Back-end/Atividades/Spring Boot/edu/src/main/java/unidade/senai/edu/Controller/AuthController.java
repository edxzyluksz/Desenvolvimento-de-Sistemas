package unidade.senai.edu.Controller;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import unidade.senai.edu.Model.CadastroFuncionario;
import unidade.senai.edu.Repository.FuncionarioCadastradoRepository;

@Controller
public class AuthController {

    @Autowired
    private FuncionarioCadastradoRepository repository;

    @GetMapping("/login")
    public String loginPage() {
        return "auth/login";
    }

    @PostMapping("/login")
    public String loginAttempt(@RequestParam String nif,
            @RequestParam String senha,
            HttpSession session,
            Model model) {

        Optional<CadastroFuncionario> funcionario = repository.findByNifAndAtivoTrue(nif);

        if (funcionario.isEmpty() ||
                !funcionario.get().getSenha().equals(senha)) {

            model.addAttribute("erro", "NIF ou senha inválidos");
            return "auth/login";
        }

        session.setAttribute("usuarioLogado", true);
        session.setAttribute("nif", nif);

        return "redirect:/app";
    }

    @GetMapping("/cadastro")
    public String cadastroPage() {
        return "auth/cadastro";
    }

    @PostMapping("/cadastro")
    public String cadastro(@RequestParam String nome,
            @RequestParam String nif,
            @RequestParam String senha,
            Model model) {

        boolean autorizado = repository.existsByNifAndNomeAndAtivoTrue(nif, nome);

        if (!autorizado) {
            model.addAttribute("erro", "Funcionário não autorizado.");
            return "auth/cadastro";
        }

        if (repository.existsByNif(nif)) {
            model.addAttribute("erro", "Funcionário já cadastrado.");
            return "auth/cadastro";
        }

        CadastroFuncionario funcionario = new CadastroFuncionario();
        funcionario.setNome(nome);
        funcionario.setNif(nif);
        funcionario.setSenha(senha);

        repository.save(funcionario);

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
