package com.fighting.cqw.service;

import com.fighting.cqw.commonenum.StatusEnum;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.fighting.cqw.bean.MsMessage;
import com.fighting.cqw.mapper.MsMessageMapper;

import java.util.Collection;
import java.util.List;

/**
 * @Classname MsMessageService
 *@Description TODO
 *@Date 2021/10/11 2:59 下午
 *@author  kufeigg
 */
@Service
public class MsMessageService{

    @Resource
    private MsMessageMapper msMessageMapper;



    public int deleteByPrimaryKey(Long id) {
        return msMessageMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(MsMessage record) {
        return msMessageMapper.insert(record);
    }

    
    public int insertSelective(MsMessage record) {
        return msMessageMapper.insertSelective(record);
    }

    
    public MsMessage selectByPrimaryKey(Long id) {
        return msMessageMapper.selectByPrimaryKey(id);
    }

    
    public int updateByPrimaryKeySelective(MsMessage record) {
        return msMessageMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(MsMessage record) {
        return msMessageMapper.updateByPrimaryKey(record);
    }

    public  int doSendMsg(MsMessage message, Long originId) {
        if (originId != null) {
            msMessageMapper.updateByPrimaryKeySelective(MsMessage.builder().id(originId).readStatus(StatusEnum.YR.getValue()).build());
        }
        return msMessageMapper.insertSelective(message);
    }

    public List<MsMessage> getList(){
        return msMessageMapper.getList();
    }

}
