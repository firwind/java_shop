package com.baigu.app.shop.front.api.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.agent.service.impl.MemberSaleManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.action.GridController;
import com.baigu.framework.database.Page;
import com.baigu.framework.util.DateUtil;
import com.baigu.framework.util.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * create by xt on 2018-07-23 16:39
 */
@Controller
@RequestMapping("/api/shop/sale")
public class SaleApiController extends GridController {
    @Autowired
    private MemberSaleManager memberSaleManager;

    @ResponseBody
    @RequestMapping(value = "/myteam", method = RequestMethod.POST)
    public Object myteam(Integer page, Integer memberId) {
        try {
            if (memberId == null) {
                Member member = UserConext.getCurrentMember();
                memberId = member.getMember_id();
            }
            Page teamSalePage = memberSaleManager.getTeamSaleList(page, this.getPageSize(), DateUtil.getCurrentMonthString(), memberId);
            return JsonResultUtil.getObjectMessageJson(teamSalePage.getResult(), "操作成功");
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
            return JsonResultUtil.getErrorJson("操作失败");
        }
    }
}
