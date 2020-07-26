package com.quiz.controller;

import com.quiz.controller.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("sendFriendRequest")
    public ModelAndView sendRequestControl(@RequestParam("username") String fromUser){
        return userService.sendRequest(fromUser);
    }

    @RequestMapping("proceedSendFriendRequest")
    public ModelAndView proceedSendFriendRequestControl(@RequestParam("username") String fromUser,
                                                        @RequestParam("touser") String toUser){
        return userService.addFriendService(fromUser, toUser);
    }

    @RequestMapping("homepage")
    public ModelAndView homepageControl(@RequestParam("username") String userName){
        return userService.homepageService(userName);
    }

}
