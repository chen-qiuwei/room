package com.fighting.cqw.service;

import com.fighting.cqw.bean.MsMessage;
import com.fighting.cqw.bean.MsNews;
import com.fighting.cqw.bean.MsOrder;
import com.fighting.cqw.bean.MsRoominfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author kufeigg
 * @Classname BaseService
 * @Description TODO
 * @Date 2021/10/22 4:56 下午
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class BaseService {

    @Resource
    private MsMessageService msMessageService;

    @Resource
    private MsMerchantService msMerchantService;

    public Map<String, Object> getTotalData(Long mId) {
        Map<String, Object> dataMap = new HashMap<>();
        MsMessage message = new MsMessage();
        MsRoominfo roomInfo = new MsRoominfo();
        MsNews news = new MsNews();
        MsOrder order = new MsOrder();
        if (mId != null) {
            message.setReceiveId(mId);
            message.setReceiveType("MERCHANT");
            message.setIfMerchant(true);
            roomInfo.setMid(mId);
            news.setPublishId(mId);
            order.setMid(mId);
        }
        int msgTotal = msMessageService.getList().size();
        int merTotal = msMerchantService.getList().size();

        dataMap.put("msgTotal", msgTotal);
        dataMap.put("merTotal", merTotal);

        return dataMap;
    }
}