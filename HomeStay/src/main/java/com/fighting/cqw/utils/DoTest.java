package com.fighting.cqw.utils;

import cn.hutool.crypto.SecureUtil;

/**
 * @author kufeigg
 * @Classname DoTest
 * @Description TODO
 * @Date 2021/10/11 3:27 下午
 */
public class DoTest {
    public static void main(String[] args) {
        System.out.println(SecureUtil.md5("admin"));
    }
}