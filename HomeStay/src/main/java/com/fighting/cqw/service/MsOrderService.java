package com.fighting.cqw.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.mapper.MsOrderMapper;
import com.fighting.cqw.bean.MsOrder;
/**
 * @Classname MsOrderService
 *@Description TODO
 *@Date 2021/10/22 4:59 下午
 *@author  kufeigg
 */
@Service
public class MsOrderService{

    @Resource
    private MsOrderMapper msOrderMapper;

    
    public int deleteByPrimaryKey(Long id) {
        return msOrderMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsOrder record) {
        return msOrderMapper.insert(record);
    }

    
    public int insertSelective(MsOrder record) {
        return msOrderMapper.insertSelective(record);
    }

    
    public MsOrder selectByPrimaryKey(Long id) {
        return msOrderMapper.selectByPrimaryKey(id);
    }

    
    public int updateByPrimaryKeySelective(MsOrder record) {
        return msOrderMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsOrder record) {
        return msOrderMapper.updateByPrimaryKey(record);
    }

}
