package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsMerchant;

import java.util.List;

/**
 * @Classname MsMerchantMapper
 *@Description TODO
 *@Date 2021/10/11 2:56 下午
 *@author  kufeigg
 */
public interface MsMerchantMapper {
    /**
     * delete by primary key
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(MsMerchant record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsMerchant record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsMerchant selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsMerchant record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsMerchant record);

    MsMerchant selectByAccount(String maccount);

    List<MsMerchant> getList();
}