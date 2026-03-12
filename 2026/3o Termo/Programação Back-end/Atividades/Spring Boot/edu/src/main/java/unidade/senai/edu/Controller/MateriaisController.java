package unidade.senai.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MateriaisController {
    @GetMapping("/materiais")
    public String getMateriais() {
        return "app/sections/materiais";
    }
}
