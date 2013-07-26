package br.com.caelum.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.UsuarioDAO;
import br.com.caelum.contas.modelo.Usuario;

@Controller
public class LoginController {

	  @RequestMapping("/loginForm")
	  public String loginForm() {
	    return "usuario/telaLogin";
	  }
	 
	  @RequestMapping("/efetuaLogin")
	  public String efetuaLogin(Usuario usuario, HttpSession session) {
	    if(new UsuarioDAO().existeUsuario(usuario)) {
	      // usuario existe, guardaremos ele na session
	      session.setAttribute("usuarioLogado", usuario);
	      return "redirect:listaContas";
	    }
	    // ele errou a senha, voltou para o formulario
	    return "redirect:loginForm";
	  }
}