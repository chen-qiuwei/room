package com.fighting.cqw.controller;

import com.fighting.cqw.bean.MsMerchant;
import com.fighting.cqw.bean.MsMessage;
import com.fighting.cqw.commonenum.LevelEnum;
import com.fighting.cqw.service.MsMessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author kufeigg
 * @Classname PageController
 * @Description TODO
 * @Date 2021/10/12 2:22 下午
 */
@Slf4j
@Controller
@Api(value = "页面跳转控制器", description = "页面跳转")
public class PageController {

    @Resource
    private MsMessageService msMessageService;

    @ApiOperation("跳转到登录页")
    @GetMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @ApiOperation("跳转到管理主页")
    @GetMapping("/home/{mlevel}")
    public String toIndex(@PathVariable("mlevel") String mlevel, HttpSession session, Model model) {
        MsMerchant login_merchant = (MsMerchant) session.getAttribute("LOGIN_MERCHANT");
        String receiveType = login_merchant.getMlevel().equals(LevelEnum.ADMIN.getValue()) ? LevelEnum.ADMIN.getValue() : "MERCHANT";
        MsMessage message = MsMessage.builder().ifMerchant(true).receiveId(login_merchant.getId()).receiveType(receiveType).readStatus("WR").build();
        int msgNum = msMessageService.getList().size();
        model.addAttribute("msgNum", msgNum);
        model.addAttribute("LOGIN_MERCHANT", login_merchant);
        model.addAttribute("MLEVEL", mlevel);
        return "home";
    }
}