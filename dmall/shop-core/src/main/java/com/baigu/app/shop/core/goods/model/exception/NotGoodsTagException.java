package com.baigu.app.shop.core.goods.model.exception;

/**
 * create by xt on 2018-08-30 16:16
 */
public class NotGoodsTagException extends RuntimeException {
    public NotGoodsTagException(String message) {
        super(message);
    }

    public NotGoodsTagException(Throwable cause) {
        super(cause);
    }
}
