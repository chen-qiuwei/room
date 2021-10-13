package com.fighting.cqw.commonenum;

/**
 * @author kufeigg
 * @Classname OriginEnum
 * @Description TODO
 * @Date 2021/10/11 2:44 下午
 */
public enum OriginEnum {
    /**
     *  房间图片
     */
    ROOM("ROOM"),
    /**
     *  资讯图片
     */
    NEWS("NEWS"),
    /**
     *  用户头像
     */
    USER("USER"),
    /**
     *  商户营业执照
     */
    LICENSE("LICENSE");

    private String value;
    OriginEnum(String value){
        this.value = value;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
