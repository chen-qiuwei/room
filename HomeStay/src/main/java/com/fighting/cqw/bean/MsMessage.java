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
 * @Classname MsMessage
 *@Description TODO
 *@Date 2021/10/11 2:59 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_message")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsMessage implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 发送方
    */
    @ApiModelProperty(value="发送方")
    private Long sendId;

    /**
    * 发送方类型      ADMIN：超级管理员   MERCHANT：商户    USER：用户
    */
    @ApiModelProperty(value="发送方类型      ADMIN：超级管理员   MERCHANT：商户    USER：用户")
    private String sendType;

    /**
    * 通知方
    */
    @ApiModelProperty(value="通知方")
    private Long receiveId;

    /**
    * 接收方类型        ADMIN：超级管理员   MERCHANT：商户    USER：用户
    */
    @ApiModelProperty(value="接收方类型        ADMIN：超级管理员   MERCHANT：商户    USER：用户")
    private String receiveType;

    /**
    * 通知内容
    */
    @ApiModelProperty(value="通知内容")
    private String content;

    /**
    * 读取状态     WR：未读   YR：已读   D：删除
    */
    @ApiModelProperty(value="读取状态     WR：未读   YR：已读   D：删除")
    private String readStatus;

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
    * 状态   E：生效    D：失效
    */
    @ApiModelProperty(value="状态   E：生效    D：失效")
    private String status;

    private static final long serialVersionUID = 1L;

    /**----------非表字段-----------*/
    private String sendName;
    private String receiveName;
    private String isSelf;
    private boolean ifMerchant;
    private String avatarUrl;       //头像
    private Integer unreadCount;    //未读数量
    /**----------------------------*/
}