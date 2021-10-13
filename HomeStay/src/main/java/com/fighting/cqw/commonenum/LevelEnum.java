package com.fighting.cqw.commonenum;

/**
 * @author kufeigg
 * @Classname LevelEnum
 * @Description TODO
 * @Date 2021/10/11 2:42 下午
 */
public enum LevelEnum {
    /**
     * 超级管理员
     */
    ADMIN("ADMIN"),
    /**
     * 金牌商家
     */
    GOLD("GOLD"),
    /**
     * 银牌商家
     */
    SLIVER("SLIVER"),
    /**
     * 铜牌商家
     */
    COPPER("COPPER"),
    /**
     * 普通商家
     */
    NORMAL("NORMAL"),
    /**
     * 商家
     */
    MERCHANT("MERCHANT"),
    /***
     * 用户
     */
    USER("USER");
    private String value;

    LevelEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}