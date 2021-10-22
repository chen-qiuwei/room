package com.fighting.cqw.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.bean.MsRoominfo;
import com.fighting.cqw.mapper.MsRoominfoMapper;
/**
 * @Classname MsRoominfoService
 *@Description TODO
 *@Date 2021/10/22 5:01 下午
 *@author  kufeigg
 */
@Service
public class MsRoominfoService{

    @Resource
    private MsRoominfoMapper msRoominfoMapper;

    
    public int deleteByPrimaryKey(Long id) {
        return msRoominfoMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsRoominfo record) {
        return msRoominfoMapper.insert(record);
    }

    
    public int insertSelective(MsRoominfo record) {
        return msRoominfoMapper.insertSelective(record);
    }

    
    public MsRoominfo selectByPrimaryKey(Long id) {
        return msRoominfoMapper.selectByPrimaryKey(id);
    }

    
    public int updateByPrimaryKeySelective(MsRoominfo record) {
        return msRoominfoMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsRoominfo record) {
        return msRoominfoMapper.updateByPrimaryKey(record);
    }

}
