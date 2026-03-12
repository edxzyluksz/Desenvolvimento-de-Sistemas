package unidade.senai.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CategoriasController {
    @GetMapping("/categorias")
    public String getCategorias() {
        return "app/sections/categorias";
    }
}
