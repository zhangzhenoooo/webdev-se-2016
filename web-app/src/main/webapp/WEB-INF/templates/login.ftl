<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/style/semantic.min.css">
    <title>登录</title>
</head>
<body>
<div class="ui container grid">
    <div class="ui six wide centered column" style="margin-top: 50px;">
        <div class="ui center aligned header">登录</div>
        <form class="ui fluid form segment" id="login-form">
            <div class="field">
                <div class="ui left icon input">
                    <i class="user icon"></i>
                    <input type="text" name="username" id="username"
                           placeholder="请输入用户名" autocomplete="off">
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="password" id="password"
                           placeholder="请输入密码">
                </div>
            </div>
            <div class="two fields">
                <div class="eleven wide column field">
                    <div class="ui left icon input">
                        <i class="yin yang icon"></i>
                        <input type="text" name="captcha" id="captcha" placeholder="请输入验证码" autocomplete="off">
                    </div>
                </div>
                <div class="five wide column field">
                    <img src="/captcha" alt="验证码" id="captcha-img">
                </div>
            </div>
            <input type="hidden" name="redirectUrl" value="${redirectUrl!'/'}">
            <div class="ui error message" id="errorMessage"></div>
            <div class="ui fluid primary submit button">登录</div>
            <div class="">没有账号？<a href="/register">去注册</a> </div>
        </form>
    </div>

</div>
</body>
<script>
    $(document).ready(function () {


        function refreshCaptcha() {
            $('#captcha-img').attr('src', '/captcha?_=' + Math.random());
        }

        $('#captcha-img').click(function () {
            refreshCaptcha();
        });
        var loginForm = $('#login-form').form({
            on: 'blur',
            fields: {
                username: {
                    identifier: 'username',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '用户名不能为空'
                        }
                    ]
                },
                password: {
                    identifier: 'password',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '密码不能为空'
                        }
                    ]
                }
            }
        });
        loginForm.api({
            url: '/loginCheck',
            serializeForm: true,
            method: 'post',
            successTest: function (response) {
                return response.success || false;
            },
            onSuccess: function (response) {
                if (response.redirectUrl) {
                    //FIXME: 可能有潜在的安全风险
                    window.location.href = response.redirectUrl;
                }
            }, onFailure: function (response) {
                $('#errorMessage').html(response.message);
                $('#login-form').transition('jiggle');
                loginForm.form('reset');
                refreshCaptcha();
                $('#username').focus();
            }
        });
    });

</script>
</html>