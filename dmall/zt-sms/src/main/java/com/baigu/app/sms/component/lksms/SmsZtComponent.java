package com.baigu.app.sms.component.lksms;

import com.baigu.app.base.core.model.SmsPlatform;
import com.baigu.app.base.core.plugin.sms.AbstractSmsComponent;
import com.baigu.app.base.core.service.ISmsManager;
import com.baigu.framework.component.IComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 助通短信网关插件
 *
 * @author Sylow
 * @version v1.0, 2017-02-13
 * @since 6.2.1
 */
@Component
public class SmsZtComponent extends AbstractSmsComponent implements IComponent {

    @Autowired
    private ISmsManager smsManager;

    @Override
    public void install() {
        SmsPlatform platform = new SmsPlatform();
        platform.setPlatform_name("助通短信网关");
        platform.setCode("smsZtPlugin");
        addSms(platform);
        smsManager.addSmsPlatform(platform);
    }

    @Override
    public void unInstall() {

    }


}
