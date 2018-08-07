/**
 *
 */
package com.baigu.app.base.component.plugin;

import com.baigu.app.base.core.plugin.setting.IOnSettingInputShow;
import com.baigu.app.base.core.plugin.setting.IOnSettingSaveEnvent;
import com.baigu.eop.SystemSetting;
import com.baigu.framework.plugin.AutoRegisterPlugin;
import org.springframework.stereotype.Component;

/**
 * 模板引擎设置插件
 */
@Component
public class TempEngineSettingPlugin extends AutoRegisterPlugin implements
        IOnSettingInputShow, IOnSettingSaveEnvent {

    /* (non-Javadoc)
     * @see IOnSettingInputShow#onShow()
     */
    @Override
    public String onShow() {

        return "tempengine-setting";
    }

    /* (non-Javadoc)
     * @see IOnSettingInputShow#getSettingGroupName()
     */
    @Override
    public String getSettingGroupName() {
        return SystemSetting.temp_engine_key;
    }

    /* (non-Javadoc)

     * @see IOnSettingInputShow#getTabName()
     */
    @Override
    public String getTabName() {

        return "模板引擎设置";
    }

    /* (non-Javadoc)
     * @see IOnSettingInputShow#getOrder()
     */
    @Override
    public int getOrder() {

        return 30;
    }

    @Override
    public void onSave() {
        SystemSetting.loadTempEngineSetting();
    }
}
