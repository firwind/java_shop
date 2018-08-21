#增加凌凯短信组件
INSERT INTO `b2c`.`es_component` (`id`, `componentid`, `name`, `install_state`, `enable_state`, `version`, `author`, `dmall_version`, `description`, `error_message`, `sort_order`) VALUES ('22', 'smsLkComponent', '凌凯短信组件', '0', '1', '1.0', 'dmall', '3.0.0', NULL, NULL, NULL);

#增加短信平台模板数据
INSERT INTO `b2c`.`es_sms_platform` (`id`, `platform_name`, `is_open`, `config`, `code`) VALUES ('1', '助通短信网关', '0', '{\"xh\":\"4\",\"password\":\"2\",\"productid\":\"3\",\"username\":\"1\"}', 'smsZtPlugin');
INSERT INTO `b2c`.`es_sms_platform` (`id`, `platform_name`, `is_open`, `config`, `code`) VALUES ('2', '凌凯短信平台', '1', '{\"corpId\":\"CDJS001477\",\"pwd\":\"zm0513\"}', 'smsLkPlugin');
