package com.baigu.app.shop.core.member.plugin;

import com.baigu.app.shop.core.member.model.MemberComment;

public interface IMemberCommentEvent {
	public void onMemberComment(MemberComment comment);
}
