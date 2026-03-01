package com.example.rh.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.rh.Model.Funcionario;
import com.example.rh.Repository.FuncionarioRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FuncionarioController {
    
    // Atributo
    @Autowired
    private FuncionarioRepository fr;

    // Quando o endereço /funcionário for digitado na barra de endereço
    // o site será direcionado para a página de cadastro de funcionários
    @RequestMapping(value="/funcionario", method=RequestMethod.GET)
    public String abrirFuncionario() {
        return "funcionario/funcionario";
    }

    // Requisição para cadastrar funcionário no banco
    @RequestMapping(value = "/funcionario", method = RequestMethod.POST)
    public String gravarFuncionario (Funcionario funcionario){
        fr.save(funcionario);
        return "redirect:/funcionario";
    }

    @RequestMapping(value = "/listar", method=RequestMethod.GET)
    public String listarFuncionario() {
        return "funcionario/listarfuncionarios";
    }
    

}
