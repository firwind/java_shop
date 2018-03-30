package com.baigu.app.shop.component.payment.plugin.paypal.util;

import com.baigu.app.shop.component.payment.plugin.paypal.base.rest.OAuthTokenCredential;
import com.baigu.app.shop.component.payment.plugin.paypal.base.ConfigManager;
import com.baigu.app.shop.component.payment.plugin.paypal.base.Constants;
import com.baigu.app.shop.component.payment.plugin.paypal.base.rest.PayPalRESTException;

public class GenerateAccessToken { 

	public static String getAccessToken() throws PayPalRESTException {

		// ###AccessToken
		// Retrieve the access token from
		// OAuthTokenCredential by passing in
		// ClientID and ClientSecret
		String clientID = ConfigManager.getInstance().getValue(Constants.CLIENT_ID);
		String clientSecret = ConfigManager.getInstance().getValue(
				Constants.CLIENT_SECRET);

		return new OAuthTokenCredential(clientID, clientSecret)
				.getAccessToken();
	}
}
