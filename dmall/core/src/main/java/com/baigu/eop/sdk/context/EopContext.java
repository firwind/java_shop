package com.baigu.eop.sdk.context;

import com.baigu.app.base.core.model.MultiSite;

public class EopContext {
	private static ThreadLocal<EopContext> EopContextHolder = new ThreadLocal<EopContext>();
	
	public static void setContext(EopContext context) {
		EopContextHolder.set(context);
	}

	public static void remove() {
		EopContextHolder.remove();
	}

	public static EopContext getContext() {
		EopContext context = EopContextHolder.get();
		return context;
	}

 

	// 当前子站
	private MultiSite currentChildSite;
	

	public MultiSite getCurrentChildSite() {
		return currentChildSite;
	}

	public void setCurrentChildSite(MultiSite currentChildSite) {
		this.currentChildSite = currentChildSite;
	}

 

	 

	 
}
