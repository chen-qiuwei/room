package com.fighting.cqw.controller.dataCenter;

import com.fighting.cqw.service.BaseService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author kufeigg
 * @Classname AdminDataController
 * @Description TODO
 * @Date 2021/10/22 4:53 下午
 */
@Slf4j
@Controller
@RequestMapping("/admin")
@Api(value = "管理员之数据中心控制器", description = "管理数据统计相关内容")
public class AdminDataController {

    @Resource
    private BaseService baseService;


}