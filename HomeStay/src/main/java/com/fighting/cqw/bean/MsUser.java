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
 * @Classname MsUser
 *@Description TODO
 *@Date 2021/10/11 2:54 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_user")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsUser implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 用户OPEN_ID
    */
    @ApiModelProperty(value="用户OPEN_ID")
    private String openId;

    /**
    * 用户名称
    */
    @ApiModelProperty(value="用户名称")
    private String uname;

    /**
    * 用户号码
    */
    @ApiModelProperty(value="用户号码")
    private String uphone;

    /**
    * 用户头像
    */
    @ApiModelProperty(value="用户头像")
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
    * 状态    E：生效中    D：已失效
    */
    @ApiModelProperty(value="状态    E：生效中    D：已失效")
    private String status;

    private static final long serialVersionUID = 1L;
}