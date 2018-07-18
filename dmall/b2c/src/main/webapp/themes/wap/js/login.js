$(function () {
    var module   = new Module();
    var canLogin = { mobile  : false, ordinary: false }
    var loginBtn = $('#login-btn');
    var curForm  = 'ordinary';

    init();

    function init() {
        getImgVal();
        bindEvent();
        checkLogin()
    }

    //  初始化导航栏
    module.navigator.init({
        title          : '登录',
        titleColor     : '#fff',
        backgroundColor: '#ff6700',
        left: {
            style: 'light'
        },
        right: {
            text     : '注册',
            textColor: '#fff',
            click    : function () {
                location.href = 'register.html'
            }
        }
    });

    //  事件绑定
    function bindEvent() {
        //  手机登录、普通登录tab切换
        $('.login-tab').on('click', '.item', function () {
            var $this     = $(this),
                index     = $this.index();
            var loginForm = $('.login-form');
            $this.addClass('selected')
                 .siblings().removeClass('selected');
            loginForm.find('.form').eq(index).addClass('show')
                     .siblings().removeClass('show');
            curForm = $this.is('.mobile') ? 'mobile' : 'ordinary';
            $this.is('.mobile') ? checkLogin('mobile') : checkLogin('ordinary');
        })

        //  获取手机验证码
        $('.get-validcode-mobile').on('click', function () {
            var mobileVal = $('#input-mobile').val();
            if(!module.regExp.mobile.test(mobileVal)){
                module.message.error('请确认手机号是否正确！');
                return false;
            }

            $.ajax({
                url: ctx + '/api/shop/sms/send-sms-code.do?key=check&mobile=' + mobileVal,
                success: function (res) {
                    if(res.result == 1){
                        module.countDown($('.get-validcode-mobile'));
                        module.message.success(res.message);
                    }else {
                        module.message.error(res.message);
                    }
                },
                error: function () {
                    module.message.error('出现错误，请重试！');
                }
            })
        })

        //  登录
        loginBtn.on('click', function () {

            console.log(curForm);

            module.layerLoading.open();
            curForm == 'mobile' ? _loginByMobile() : _loginByOrdinary();

            //  手机登录
            function _loginByMobile() {
                $.ajax({
                    url: ctx + '/api/shop/member/sms-login.do',
                    data: {
                        action   : 'login',
                        mobile   : $('#input-mobile').val(),
                        validcode: $('#validcode-mobile').val()
                    },
                    type: 'POST',
                    success: function (res) {
                        setTimeout(function () {
                            module.layerLoading.close(_resFun(res));
                        }, 500)
                        function _resFun(res) {
                            if (res.result == 1) {
                                if (res.data && res.data.check_type == 'register') {
                                    alert("对不起，该手机号不存在，请注册后再登录");
                                } else {
                                    location.href = forward || 'member.html';
                                }
                            }else {
                                module.message.error(res.message);
                            }
                        }
                    },
                    error: function () {
                        module.layerLoading.close();
                        module.message.error('出现错误，请重试！');
                    }
                })
            }

            //  普通登录
            function _loginByOrdinary() {
                $.ajax({
                    url : ctx + '/api/shop/member/login.do',
                    data: {
                        action   : 'login',
                        username : $('#input-ordinary').val(),
                        password : $('#password-ordinary').val(),
                        validcode: $('#validcode-ordinary').val()
                    },
                    type: 'POST',
                    success: function (res) {
                        setTimeout(function () {
                            module.layerLoading.close(_resFun(res));
                        }, 500)
                        function _resFun(res) {
                            if(res.result == 1){
                                location.href = forward || 'member.html';
                            }else {
                                module.message.error(res.message);
                                getImgVal();
                            }
                        }
                    },
                    error: function () {
                        module.layerLoading.close();
                        module.message.error('出现错误，请重试！');
                        getImgVal();
                    }
                })
            }
        })

        //  密码输入框显示隐藏切换
        module.switchControl.init({
            element: $('.operate'),
            open: function () {
                $('#password-ordinary')[0].type = 'text';
            },
            close: function () {
                $('#password-ordinary')[0].type = 'password';
            }
        })

        //  输入框输入监听
        _mobile();
        _ordinary();
        function _mobile() {
            var __mobile    = false, __validcode = false;
            $('#input-mobile').on('input propertychange', function () {
                __mobile = module.regExp.mobile.test($(this).val());
                __();
            })
            $('#validcode-mobile').on('input propertychange', function () {
                __validcode = ($(this).val().length == 6);
                __()
            })
            function __() {
                canLogin.mobile = (__mobile && __validcode);
                checkLogin('mobile');
            }
        }
        function _ordinary() {
            $('.ordinary-form').on('input propertychange', function () {
                canLogin.ordinary = $('#input-ordinary').val() && $('#password-ordinary').val() && $('#validcode-ordinary').val()
                checkLogin('ordinary');
            })
        }

        //  打开用户协议
        $('.show-user-agreement').on('tap', function () {
            module.userAgreement.open();
            return false
        })
    }

    //  获取图片验证码
    function getImgVal() {
        $('.validcode-img').attr('src', ctx + '/validcode.do?vtype=memberlogin&r='+new Date().getTime());
        $('.validcode-img').on('click', function () {
            getImgVal()
        })
    }

    //  是否禁用登录按钮
    function checkLogin(str) {
        var str = str || 'mobile';
        canLogin[str] ? loginBtn[0].disabled = false : loginBtn[0].disabled = true;
        if(str == 'mobile'){
            $('.other').removeClass('show');
        }else {
            $('.other').addClass('show');
        }
    }
})