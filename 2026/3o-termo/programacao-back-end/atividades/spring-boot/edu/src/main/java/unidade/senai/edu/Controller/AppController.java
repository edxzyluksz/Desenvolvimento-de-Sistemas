package unidade.senai.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;


@Controller
public class AppController {
    @GetMapping("/app")
    public String appHome(HttpSession session, Model model) {
        Object usuarioLogado = session.getAttribute("usuarioLogado");
        if (usuarioLogado == null || !(Boolean) usuarioLogado){
            return "redirect:/login";
        }
        model.addAttribute("nif", session.getAttribute("nif"));
        return "app/index";
    }
    
}
