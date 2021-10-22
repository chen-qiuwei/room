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
 * @Classname MsNews
 *@Description TODO
 *@Date 2021/10/22 5:02 下午
 *@author  kufeigg
 */
@ApiModel(value="ms_news")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MsNews implements Serializable {
    /**
    * 主键ID
    */
    @ApiModelProperty(value="主键ID")
    private Long id;

    /**
    * 发布人ID
    */
    @ApiModelProperty(value="发布人ID")
    private Long publishId;

    /**
    * 文章标题
    */
    @ApiModelProperty(value="文章标题")
    private String title;

    /**
    * 文章摘要
    */
    @ApiModelProperty(value="文章摘要")
    private String summary;

    /**
    * 文章内容
    */
    @ApiModelProperty(value="文章内容")
    private String content;

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
    * 开始展示时间
    */
    @ApiModelProperty(value="开始展示时间")
    private Date beginTime;

    /**
    * 结束展示时间
    */
    @ApiModelProperty(value="结束展示时间")
    private Date endTime;

    /**
    * 审核状态   WA：待审核   SA：审核通过   FA：审核不通过
    */
    @ApiModelProperty(value="审核状态   WA：待审核   SA：审核通过   FA：审核不通过")
    private String auditStatus;

    /**
    * 状态    E：生效中   D：已失效
    */
    @ApiModelProperty(value="状态    E：生效中   D：已失效")
    private String status;

    private static final long serialVersionUID = 1L;
}