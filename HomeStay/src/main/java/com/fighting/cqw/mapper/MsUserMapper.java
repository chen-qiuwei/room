package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsUser;

/**
 * @Classname MsUserMapper
 *@Description TODO
 *@Date 2021/10/11 2:54 下午
 *@author  kufeigg
 */
public interface MsUserMapper {
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
    int insert(MsUser record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsUser record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsUser selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsUser record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsUser record);
}