package com.example.escola_xyz.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.escola_xyz.Model.Administrador;
import com.example.escola_xyz.Repository.AdministradorRepository;
import com.example.escola_xyz.Repository.VerificaCadastroAdmRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AdministradorController {
    
    // Permitea Transformação de um OBJ-Java em Entidade de BD
    // Cada Obj Criado Vira uma Linha do BD
    @Autowired
    AdministradorRepository ar;

    @Autowired
    VerificaCadastroAdmRepository vcar;

    // Verificar acesso e cadastro
    boolean acessoAdm = false;

    // Métodos
    // Para navegar na página de cadastro
    @GetMapping("/cadastro-adm")
    public String acessoCadastroAdmPage() {
        return "sign-in/cadastro-adm";
    }

    @PostMapping("/cadastrar-adm")
    public ModelAndView cadastrarAdmBD(Administrador adm, RedirectAttributes attributes) {
        boolean verificarCpf = vcar.existsById(adm.getCpf()); // Se existir retorna true, caso contrário retorna false
        ModelAndView mv = new ModelAndView("redirect:/login-adm");
        if (verificarCpf){
            // Obj adm -> Pega as informações do formulário e cria um objeto da classe adm
            ar.save(adm); // Salva no BD
            // Criar uma mensagem para o usuário
            String mensagem = "Cadastro Realizado com Sucesso";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem); // Leva a mensagem para a tela de view
            attributes.addFlashAttribute("classe", "verde");
        } else { // Deu errado, pessoa não pode se cadastrar
            String mensagem = "Cadastro não permitido";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }
        return mv;
    }

    @GetMapping("/cadastrar-adm") 
    public String telaCadastroAdm() {
        return "sign-in/cadastro-adm";
    }
    
    // Método para página de login do ADM
    @GetMapping("/login-adm")
    public String acessoLoginPageAdm () {
        return "log-in/login-adm";
    }

    // @GetMapping("/verifica-login-adm")
    // public ModelAndView verificaLogin() {
    //     String redirect;
    //     if (acessoAdm == false){
    //         redirect = "redirect:/";
    //     }
    //     else{
    //         redirect = "redirect:/interna-adm";
    //     }
    //     ModelAndView mv = new ModelAndView(redirect);
    //     return mv;
    // }
    

    // Método para carregar a página interna após o login
    @PostMapping("acesso-adm")
    public ModelAndView acessoAdm (@RequestParam String cpf, @RequestParam String senha, RedirectAttributes attributes) {
        
        ModelAndView mv = new ModelAndView("redirect:/interna-adm");
        boolean verificarCpf = ar.existsById(cpf);
        boolean verificaSenha = ar.findByCpf(cpf).getSenha().equals(senha);           

        if (verificarCpf && verificaSenha){
            acessoAdm = true;
        } else {
            String mensagem = "CPF ou Senha Incorreto(s).";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }
        return mv;
    }

    // Acessar a página interna
    @GetMapping("/interna-adm")
    public ModelAndView acessaInternaPageAdm(RedirectAttributes attributes) {
        String vaiPara = "";
        if (acessoAdm) { // Verifica se o user está logado
            vaiPara = "interna/interna-adm";
        }
        else { // Caso contrário, nega acesso e redireciona para o login
            String mensagem = "Acesso não permitido";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelha");
            vaiPara = "redirect:/login-adm";
        }

        ModelAndView mv = new ModelAndView(vaiPara);
        return mv;
    }

    @PostMapping("/deslogar-adm")
    public ModelAndView deslogarAdm(RedirectAttributes attributes) {
        acessoAdm = false;
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }
}
