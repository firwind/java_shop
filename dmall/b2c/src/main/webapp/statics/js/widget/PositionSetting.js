baigu.eop.WidgetSetting.PositionSetting=$.extend({},
baigu.eop.WidgetSetting.Setting,
{
	init:function(invoker,widget){
		this.operator = invoker;
		this.syncWidgetStyle(widget,"position"); //继承的
	}
});