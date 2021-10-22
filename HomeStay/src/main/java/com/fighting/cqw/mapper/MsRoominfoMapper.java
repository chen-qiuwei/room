package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsRoominfo;

/**
 * @Classname MsRoominfoMapper
 *@Description TODO
 *@Date 2021/10/22 5:01 下午
 *@author  kufeigg
 */
public interface MsRoominfoMapper {
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
    int insert(MsRoominfo record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsRoominfo record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsRoominfo selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsRoominfo record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsRoominfo record);
}