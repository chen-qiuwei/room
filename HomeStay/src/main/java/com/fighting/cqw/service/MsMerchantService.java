package com.fighting.cqw.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.bean.MsMerchant;
import com.fighting.cqw.mapper.MsMerchantMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Classname MsMerchantService
 *@Description TODO
 *@Date 2021/10/11 2:56 下午
 *@author  kufeigg
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MsMerchantService{

    @Resource
    private MsMerchantMapper msMerchantMapper;



    public List<MsMerchant> getList(){return msMerchantMapper.getList();};
    
    public int deleteByPrimaryKey(Long id) {
        return msMerchantMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsMerchant record) {
        return msMerchantMapper.insert(record);
    }

    
    public int insertSelective(MsMerchant record) {
        return msMerchantMapper.insertSelective(record);
    }

    
    public MsMerchant selectByPrimaryKey(Long id) {
        return msMerchantMapper.selectByPrimaryKey(id);
    }

    public MsMerchant selectByAccount(String maccount) {
        return msMerchantMapper.selectByAccount(maccount);
    }

    
    public int updateByPrimaryKeySelective(MsMerchant record) {
        return msMerchantMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsMerchant record) {
        return msMerchantMapper.updateByPrimaryKey(record);
    }

}
