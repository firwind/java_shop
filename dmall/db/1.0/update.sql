#增加凌凯短信组件
INSERT INTO `b2c`.`es_component` (`id`, `componentid`, `name`, `install_state`, `enable_state`, `version`, `author`, `dmall_version`, `description`, `error_message`, `sort_order`) VALUES ('22', 'smsLkComponent', '凌凯短信组件', '0', '1', '1.0', 'dmall', '3.0.0', NULL, NULL, NULL);

#增加短信平台模板数据
INSERT INTO `b2c`.`es_sms_platform` (`id`, `platform_name`, `is_open`, `config`, `code`) VALUES ('1', '助通短信网关', '0', '{\"xh\":\"4\",\"password\":\"2\",\"productid\":\"3\",\"username\":\"1\"}', 'smsZtPlugin');
INSERT INTO `b2c`.`es_sms_platform` (`id`, `platform_name`, `is_open`, `config`, `code`) VALUES ('2', '凌凯短信平台', '1', '{\"corpId\":\"CDJS001477\",\"pwd\":\"zm0513\"}', 'smsLkPlugin');

#代加工订单表增加收款单id字段
ALTER TABLE oem_order ADD COLUMN(payee_id int(11));
#代加工 收款单表
DROP TABLE IF EXISTS `oem_payee`;
CREATE TABLE `oem_payee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `payeeno` varchar(50) NOT NULL,
  `freight` decimal(10,2) NOT NULL COMMENT '收款单邮费',
  `amount` decimal(10,2) NOT NULL COMMENT '收款单商品价格',
  `total` decimal(10,2) NOT NULL COMMENT '邮费+商品价格合计',
  `received` int(2) NOT NULL COMMENT '收款状态，10.未收款，20.已收款',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


