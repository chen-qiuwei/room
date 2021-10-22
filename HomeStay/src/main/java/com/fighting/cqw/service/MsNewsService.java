package com.fighting.cqw.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.mapper.MsNewsMapper;
import com.fighting.cqw.bean.MsNews;
/**
 * @Classname MsNewsService
 *@Description TODO
 *@Date 2021/10/22 5:02 下午
 *@author  kufeigg
 */
@Service
public class MsNewsService{

    @Resource
    private MsNewsMapper msNewsMapper;

    
    public int deleteByPrimaryKey(Long id) {
        return msNewsMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsNews record) {
        return msNewsMapper.insert(record);
    }

    
    public int insertSelective(MsNews record) {
        return msNewsMapper.insertSelective(record);
    }

    
    public MsNews selectByPrimaryKey(Long id) {
        return msNewsMapper.selectByPrimaryKey(id);
    }

    
    public int updateByPrimaryKeySelective(MsNews record) {
        return msNewsMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsNews record) {
        return msNewsMapper.updateByPrimaryKey(record);
    }

}
