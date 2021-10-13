package com.fighting.cqw.controller;

import cn.hutool.crypto.SecureUtil;
import com.fighting.cqw.base.Result;
import com.fighting.cqw.bean.MsMerchant;
import com.fighting.cqw.evt.UserEvt;
import com.fighting.cqw.service.MsMerchantService;
import com.fighting.cqw.utils.CacheUtil;
import com.google.code.kaptcha.Constants;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * @author kufeigg
 * @Classname LoginController
 * @Description TODO
 * @Date 2021/10/11 3:08 下午
 */
@Slf4j
@RestController
@Api(value = "登录操作控制器", description = "处理登录相关操作")
public class LoginController {

    @Resource
    private CacheUtil cacheUtil;

    @Resource
    private MsMerchantService msMerchantService;

    @ApiOperation("登录操作")
    @PostMapping("/doLogin")
    public Object doLogin(UserEvt userEvt, HttpSession session) {
        System.out.println(userEvt);
        try {                                               //小程序登录
            if ("wxapp".equals(userEvt.getLoginType())) {
                MsMerchant merchant = msMerchantService.selectByAccount(userEvt.getMaccount());
                if (Objects.isNull(merchant)){
                    return Result.error(512,"账户不存在");
                }else {
                    if (SecureUtil.md5(merchant.getMpwd()).equals(userEvt.getMpwd())){
                        session.setAttribute("LOGIN_MERCHANT", merchant);
                        session.setMaxInactiveInterval(30 * 60);
                        return Result.success(merchant);
                    }else{
                        return Result.error(513,"用户密码错误");
                    }
                }
            } else {                                                  //网页端登录
                //获取登录失败次数
                Integer error_count = cacheUtil.get("login_error_count");
                MsMerchant merchant = msMerchantService.selectByAccount(userEvt.getMaccount());
                System.out.println(merchant);
                if (error_count != null && error_count > 3) {
                    return Result.error(500, "您输入密码已经错误超过3次，请1分钟后尝试!");
                } else if (StringUtils.isBlank(userEvt.getMaccount())
                        || StringUtils.isBlank(userEvt.getMpwd())) {
                    return Result.error(511, "请输入必填字段！");
                } else if (Objects.isNull(merchant)||!merchant.getMpwd().equals(SecureUtil.md5(userEvt.getMpwd()))) {
                    error_count = null == error_count ? 1 : error_count + 1;
                    cacheUtil.set("login_error_count", error_count, 60);
                    return Result.error(513, "用户名或密码错误");
                } else {
                    session.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
                    session.setAttribute("LOGIN_MERCHANT", merchant);
                    session.setMaxInactiveInterval(30 * 60);
                    return Result.success(merchant);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("登录功能异常！");
            return Result.error("登录功能异常！");
        }
    }


}