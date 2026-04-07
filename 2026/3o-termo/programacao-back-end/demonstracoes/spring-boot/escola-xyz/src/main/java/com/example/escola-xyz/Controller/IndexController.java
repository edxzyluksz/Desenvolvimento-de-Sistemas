package com.example.escola_xyz.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

// Anotação de classe Controller (Interagir View e Model)
@Controller
public class IndexController {

    // Método mais completo de buscar uma página
    @GetMapping("/home")
    public ModelAndView acessoHome() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }

    // Método mais simples de buscar uma página
    @GetMapping("")
    public String acessoHomePage2() {
        return "index";
    }

    @GetMapping("/sobre")
    public ModelAndView acessoSobre() {
        ModelAndView mv = new ModelAndView("sobre");
        return mv;
    }

    @GetMapping("/contato")
    public ModelAndView acessoContato() {
        ModelAndView mv = new ModelAndView("contato");
        return mv;
    }
}
