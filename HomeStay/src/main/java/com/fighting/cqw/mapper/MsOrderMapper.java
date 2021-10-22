package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsOrder;

/**
 * @Classname MsOrderMapper
 *@Description TODO
 *@Date 2021/10/22 4:59 下午
 *@author  kufeigg
 */
public interface MsOrderMapper {
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
    int insert(MsOrder record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsOrder record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsOrder selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsOrder record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsOrder record);
}