package com.fighting.cqw.mapper;

import com.fighting.cqw.bean.MsMessage;

import java.util.List;

/**
 * @Classname MsMessageMapper
 *@Description TODO
 *@Date 2021/10/11 2:59 下午
 *@author  kufeigg
 */
public interface MsMessageMapper {
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
    int insert(MsMessage record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(MsMessage record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    MsMessage selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(MsMessage record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(MsMessage record);

    List<MsMessage> getList();
}