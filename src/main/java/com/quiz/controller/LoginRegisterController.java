package com.quiz.controller;

import com.quiz.controller.service.interfaces.LoginRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.NoSuchAlgorithmException;

@Controller
public class LoginRegisterController {
    @Autowired
    LoginRegisterService loginRegisterService;

    @RequestMapping("/login")
    public ModelAndView loginControl(@RequestParam("username") String userName,
                                     @RequestParam("password") String password) throws NoSuchAlgorithmException {
        return loginRegisterService.loginService(userName, password);
    }

    @RequestMapping("/logout")
    public ModelAndView logoutControl(){
        return loginRegisterService.logoutService();
    }

    @RequestMapping("/createAccount")
    public ModelAndView createAccountControl(){
        return loginRegisterService.createAccountService();
    }

    @RequestMapping("/proceedAccountCreation")
    public ModelAndView proceedAccountCreationControl(@RequestParam("username") String userName,
                                                      @RequestParam("password") String password,
                                                      @RequestParam("firstname") String firstName,
                                                      @RequestParam("lastname") String lastName) throws NoSuchAlgorithmException {
        return loginRegisterService.proceedAccountCreationControl(userName, password, firstName, lastName);
    }
}
