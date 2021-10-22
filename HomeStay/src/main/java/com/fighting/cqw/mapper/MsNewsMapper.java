package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsNews;

/**
 * @Classname MsNewsMapper
 *@Description TODO
 *@Date 2021/10/22 5:02 下午
 *@author  kufeigg
 */
public interface MsNewsMapper {
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
    int insert(MsNews record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsNews record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsNews selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsNews record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsNews record);
}