package unidade.senai.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AtivosController {
    @GetMapping("/ativos")
    public String getAtivos() {
        return "app/sections/ativos";
    }
}
