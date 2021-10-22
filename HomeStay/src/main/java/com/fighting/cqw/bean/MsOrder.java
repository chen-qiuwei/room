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
 * @Classname MsOrder
 *@Description TODO
 *@Date 2021/10/22 4:59 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_order")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsOrder implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 房间ID
    */
    @ApiModelProperty(value="房间ID")
    private Long rid;

    /**
    * 用户标识ID
    */
    @ApiModelProperty(value="用户标识ID")
    private String openId;

    /**
    * 入住用户名称
    */
    @ApiModelProperty(value="入住用户名称")
    private String name;

    /**
    * 用户身份证号
    */
    @ApiModelProperty(value="用户身份证号")
    private String cardno;

    /**
    * 用户号码
    */
    @ApiModelProperty(value="用户号码")
    private String phone;

    /**
    * 订单编号
    */
    @ApiModelProperty(value="订单编号")
    private String orderCode;

    /**
    * 居住时长
    */
    @ApiModelProperty(value="居住时长")
    private String dayCount;

    /**
    * 价格
    */
    @ApiModelProperty(value="价格")
    private Double price;

    /**
    * 订单留言
    */
    @ApiModelProperty(value="订单留言")
    private String comment;

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
    * 付款时间
    */
    @ApiModelProperty(value="付款时间")
    private Date payTime;

    /**
    * 收货时间
    */
    @ApiModelProperty(value="收货时间")
    private Date confirmTime;

    /**
    * 入住时间
    */
    @ApiModelProperty(value="入住时间")
    private Date beginTime;

    /**
    * 退房时间
    */
    @ApiModelProperty(value="退房时间")
    private Date endTime;

    /**
    * 订单状态    WP：待付款   WR：待评价  YR：已评价  WDD：退款中  SDD：退款成功  FDD：退款失败  D：删除
    */
    @ApiModelProperty(value="订单状态    WP：待付款   WR：待评价  YR：已评价  WDD：退款中  SDD：退款成功  FDD：退款失败  D：删除")
    private String status;

    /**
    * 已读状态  Y：已读  N：未读
    */
    @ApiModelProperty(value="已读状态  Y：已读  N：未读")
    private String readStatus;

    /**----------非表字段---------*/
    private String rName;
    private MsRoominfo roomInfo;
    private Long mid;
    private MsUser user;
    /**--------------------------*/

    private static final long serialVersionUID = 1L;
}