package com.baigu.eop.sdk.context;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baigu.eop.SystemSetting;
import com.baigu.eop.processor.SafeHttpRequestWrapper;
import com.baigu.eop.processor.core.freemarker.FreeMarkerPaser;
import com.baigu.eop.processor.session.ISessionFactory;
import com.baigu.eop.processor.session.RequestEventSubject;
import com.baigu.eop.resource.model.EopSite;
import com.baigu.framework.context.webcontext.ThreadContextHolder;

/**
 * Eop上下文初始化
 * @author kingapex
 *
 */
public class EopContextIniter {

	public static void init(HttpServletRequest httpRequest, HttpServletResponse httpResponse, RequestEventSubject requestEventSubject) {
		FreeMarkerPaser.set(new FreeMarkerPaser());
		FreeMarkerPaser fmp = FreeMarkerPaser.getInstance();

		SafeHttpRequestWrapper safeHttpRequest = new SafeHttpRequestWrapper(httpRequest, httpResponse, requestEventSubject);

		/**
		 * 将requst response及静态资源域名加入到上下文
		 */

		HttpSession session= ISessionFactory.getSession(safeHttpRequest,httpRequest, httpResponse, requestEventSubject);
		//ISessionManager sessionManager = safeHttpRequest.getSessionManager();
		/*if (sessionManager != null) {

			session = sessionManager.createSession(safeHttpRequest, httpResponse, requestEventSubject, true);
		}*/

		ThreadContextHolder.setSession(session);
		ThreadContextHolder.setHttpRequest(safeHttpRequest);
		ThreadContextHolder.setHttpResponse(httpResponse);
		httpRequest.setAttribute("staticserver", SystemSetting.getStatic_server_domain());
		EopContext context = new EopContext();

		String servletPath = httpRequest.getServletPath();

		if (servletPath.startsWith("/statics"))
			return;

		if( servletPath.startsWith("/install") ){

		}else{

			fmp.putData("site", EopSite.getInstance() );
		}
		EopContext.setContext(context);

		/**
		 * 设置freemarker的相关常量
		 */
		fmp.putData("ctx", httpRequest.getContextPath());
	}


}
