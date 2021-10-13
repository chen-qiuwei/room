package com.fighting.cqw.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.mapper.MsUserMapper;
import com.fighting.cqw.bean.MsUser;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Classname MsUserService
 *@Description TODO
 *@Date 2021/10/11 2:54 下午
 *@author  kufeigg
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MsUserService{

    @Resource
    private MsUserMapper msUserMapper;

    
    public int deleteByPrimaryKey(Long id) {
        return msUserMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsUser record) {
        return msUserMapper.insert(record);
    }

    
    public int insertSelective(MsUser record) {
        return msUserMapper.insertSelective(record);
    }

    
    public MsUser selectByPrimaryKey(Long id) {
        return msUserMapper.selectByPrimaryKey(id);
    }

    
    public int updateByPrimaryKeySelective(MsUser record) {
        return msUserMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsUser record) {
        return msUserMapper.updateByPrimaryKey(record);
    }

}
