package com.fighting.cqw.evt;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author kufeigg
 * @Classname UserEvt
 * @Description TODO
 * @Date 2021/10/11 3:11 下午
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserEvt {
    private Long id;
    private String maccount;
    private String mpwd;
    private String npwd;
    private String verifyCode;
    private String mphone;
    private String msgCode;
    private String status;
    private String loginType;
}