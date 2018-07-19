package com.baigu.app.shop.front.tag.member;

import com.baigu.app.base.core.model.Member;
import com.baigu.app.shop.component.agent.service.IMemberSaleManager;
import com.baigu.eop.sdk.context.UserConext;
import com.baigu.framework.context.webcontext.ThreadContextHolder;
import com.baigu.framework.database.Page;
import com.baigu.framework.taglib.BaseFreeMarkerTag;
import com.baigu.framework.util.DateUtil;
import freemarker.template.TemplateModelException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 团队成员销量
 * Created by baigu on 2018/4/10.
 */
@Component
@Scope("prototype")
public class TeamSaleListTag extends BaseFreeMarkerTag {

    @Autowired
    private IMemberSaleManager memberSaleManager;

    @Override
    protected Object exec(Map params) throws TemplateModelException {
        HttpServletRequest request = ThreadContextHolder.getHttpRequest();
        Member member = UserConext.getCurrentMember();
        int memberId = 0;
        if (params.get("member_id") != null && StringUtils.isNotBlank(params.get("member_id").toString())) {
            memberId = Integer.parseInt(params.get("member_id").toString());
        } else {
            if (member != null) {
                memberId = member.getMember_id();
            }
        }
        String page = request.getParameter("page");
        page = (page == null || page.equals("")) ? "1" : page;
        int pageSize = 5;
        Map result = new HashMap();

        Page teamSalePage = memberSaleManager.getTeamSaleList(Integer.valueOf(page), pageSize,
                DateUtil.getCurrentMonthString(), memberId);
        Long totalCount = teamSalePage.getTotalCount();

        List<Map> teamSaleList = (List) teamSalePage.getResult();
        teamSaleList = teamSaleList == null ? new ArrayList() : teamSaleList;

        result.put("totalCount", totalCount);
        result.put("pageSize", pageSize);
        result.put("page", page);
        result.put("teamSaleList", teamSaleList);
        return result;
    }
}
