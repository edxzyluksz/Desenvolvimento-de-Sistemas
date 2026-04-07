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
import unidade.senai.edu.Repository.FuncionarioRepository;

@Controller
public class AuthController {

    @Autowired
    private FuncionarioRepository funcionarioRepository; // Repositório que registra somente NIF e Nome

    @Autowired
    private FuncionarioCadastradoRepository funcionarioCadastrado; // Repositório para gerenciar funcionários cadastrados

    @GetMapping("/login")
    public String loginPage() {
        return "auth/login";
    }

    @PostMapping("/login")
    public String loginAttempt(@RequestParam String nif,
            @RequestParam String senha,
            HttpSession session,
            Model model) {

        Optional<CadastroFuncionario> funcionarioLogado = funcionarioCadastrado.findByNifAndAtivoTrue(nif);

        if (funcionarioLogado.isEmpty() ||
            !funcionarioLogado.get().getSenha().equals(senha)) {
            
            if (funcionarioRepository.existsByNif(nif)){
                model.addAttribute("sucesso", "NIF encontrado! Acesse a página de cadastro para criar sua conta.");
                return "auth/login";
            }

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

        boolean autorizado = funcionarioRepository.existsByNif(nif);

        if (!autorizado) {
            model.addAttribute("erro", "Funcionário não autorizado.");
            return "auth/cadastro";
        }

        if (funcionarioCadastrado.existsByNifAndAtivoTrue(nif)) {
            model.addAttribute("erro", "Funcionário já cadastrado.");
            return "auth/cadastro";
        }

        CadastroFuncionario funcionario = new CadastroFuncionario();
        funcionario.setNome(nome);
        funcionario.setNif(nif);
        funcionario.setSenha(senha);
        funcionario.setAtivo(true);

        funcionarioCadastrado.save(funcionario);

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}
