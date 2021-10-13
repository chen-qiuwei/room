package com.fighting.cqw.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Classname MsMerchant
 *@Description TODO
 *@Date 2021/10/11 2:56 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_merchant")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsMerchant implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 申请表ID
    */
    @ApiModelProperty(value="申请表ID")
    private Long auditId;

    /**
    * 商家名称
    */
    @ApiModelProperty(value="商家名称")
    private String mname;

    /**
    * 商家联系电话
    */
    @ApiModelProperty(value="商家联系电话")
    private String mphone;

    /**
    * 商家账号
    */
    @ApiModelProperty(value="商家账号")
    private String maccount;

    /**
    * 商家密码
    */
    @ApiModelProperty(value="商家密码")
    private String mpwd;

    /**
    * 商家等级    ADMIN: 超级管理员  GOLD：金牌商家   SLIVER：银牌商家   COPPER：铜牌商家    NORMAL：普通商家
    */
    @ApiModelProperty(value="商家等级    ADMIN: 超级管理员  GOLD：金牌商家   SLIVER：银牌商家   COPPER：铜牌商家    NORMAL：普通商家")
    private String mlevel;

    /**
    * 房东介绍
    */
    @ApiModelProperty(value="房东介绍")
    private String mdesc;

    /**
    * 头像地址
    */
    @ApiModelProperty(value="头像地址")
    private String avatarUrl;

    /**
    * 创建时间
    */
    @ApiModelProperty(value="创建时间")
    private Date createTime;

    /**
    * 更新时间
    */
    @ApiModelProperty(value="更新时间")
    private Date updateTime;

    /**
    * 状态      D：已失效   E：生效中
    */
    @ApiModelProperty(value="状态      D：已失效   E：生效中")
    private String status;

    private static final long serialVersionUID = 1L;
}