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
 * @Classname MsRoominfo
 *@Description TODO
 *@Date 2021/10/22 5:01 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_roominfo")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsRoominfo implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 商家ID
    */
    @ApiModelProperty(value="商家ID")
    private Long mid;

    /**
    * 房间标题
    */
    @ApiModelProperty(value="房间标题")
    private String title;

    /**
    * 房间描述
    */
    @ApiModelProperty(value="房间描述")
    private String des;

    /**
    * 价格
    */
    @ApiModelProperty(value="价格")
    private Double price;

    /**
    * 是否参加活动     Y：是    N：否
    */
    @ApiModelProperty(value="是否参加活动     Y：是    N：否")
    private String isActive;

    /**
    * 销售数量
    */
    @ApiModelProperty(value="销售数量")
    private Integer sales;

    /**
    * 房间类型    大床房，单人间，双人间，三人间
    */
    @ApiModelProperty(value="房间类型    大床房，单人间，双人间，三人间")
    private String type;

    /**
    * 收藏数
    */
    @ApiModelProperty(value="收藏数")
    private Integer likeCount;

    /**
    * 评论数
    */
    @ApiModelProperty(value="评论数")
    private Integer commentCount;

    /**
    * 开始预订时间
    */
    @ApiModelProperty(value="开始预订时间")
    private Date beginTime;

    /**
    * 结束预订时间
    */
    @ApiModelProperty(value="结束预订时间")
    private Date endTime;

    /**
    * 创建时间
    */
    @ApiModelProperty(value="创建时间")
    private Date createTime;

    /**
    * 修改时间
    */
    @ApiModelProperty(value="修改时间")
    private Date updateTime;

    /**
    * 审核状态  WA：待审核  SA：审核通过 
    */
    @ApiModelProperty(value="审核状态  WA：待审核  SA：审核通过 ")
    private String auditStatus;

    /**
    * 房间状态   D：已下架   FR：空闲中   B：已预订
    */
    @ApiModelProperty(value="房间状态   D：已下架   FR：空闲中   B：已预订")
    private String status;

    private static final long serialVersionUID = 1L;
}