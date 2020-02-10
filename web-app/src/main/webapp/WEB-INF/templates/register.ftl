<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新用户注册</title>
    <script src="/js/jquery-1.11.0.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    <!--semantic引入的文件-->
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <!--layui引入的文件-->
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <#--bootstrap引入的文件-->
    <link rel="stylesheet" href="/js/bootstrap/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css">
    <script src="/js/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div class="ui container grid">

    <div class="ui six wide centered column" style="margin-top: 50px;">
        <div class="ui center aligned header">注册</div>

        <form class="ui fluid form segment" id="register-form">
            <div class="field">
                <div class="ui left icon input">
                    <i class="user icon"></i>
                    <input type="text" name="username" id="username"
                           placeholder="请输入用户名" autocomplete="off" required="required">
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="password" id="password" autocomplete="off"
                           placeholder="请输入密码" required="required">
                </div>
            </div>

            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="repassword" id="repassword" autocomplete="off"
                           placeholder="请再次输入密码" required="required">
                </div>
            </div>

            <div class="field">
                <div class="ui left icon input">
                    <i class="at icon"></i>
                    <input type="text" name="email" id="email" autocomplete="off"
                           placeholder="请输入邮箱地址" required="required">
                </div>
            </div>

            <div class="field">
                性别：
                <input type="radio" name="gender" value="0" checked=”default” />男
                <input type="radio" name="gender" value="1" />女
            </div>

            <div class="two fields">
                <div class="eleven wide column field">
                    <div class="ui left icon input">
                        <i class="yin yang icon"></i>
                        <input type="text" name="captcha" id="captcha" placeholder="请输入验证码" autocomplete="off" required="required">
                    </div>
                </div>
                <div class="five wide column field">
                    <img src="/captcha" alt="验证码" id="captcha-img" >
                </div>
            </div>
            <div class="ui error message" id="errorMessage"></div>
            <div class="inline field">
                <div class="ui checkbox">
                    <input type="checkbox" id="terms">
                    <label for="terms">I agree to the terms and conditions</label>
                </div>
            </div>
            <div class="ui fluid primary submit button" onclick="register()">注册</div>
            <div class="">已有账号？<a href="/login">去登录</a></div>
        </form>
    </div>
</body>
<script>
    function register() {

        $.ajax({
            url: '/registerCheck',
            data: $('#register-form').serialize(),
            type: 'POST',
            success: function (response) {
                if (response.success) {
                    alert('注册成功,现在去登录！');
                    window.location.href = '/login';
                } else {
                    alert('注册失败,原因：' + response.message);
                }

            }
        });
    }

    $(document).ready(function () {
        function refreshCaptcha() {
            $('#captcha-img').attr('src', '/captcha?_=' + Math.random());
        }

        $('#captcha-img').click(function () {
            refreshCaptcha();
        });
        var registerForm = $('#register-form').form({
            on: 'blur',
            fields: {
                username: {
                    identifier: 'name',
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
                },
                email: {
                    identifier: 'email',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '邮箱不能为空'
                        }
                    ]
                },
                captcha: {
                    identifier: 'captcha',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '验证码不能为空'
                        }
                    ]
                }
            }
        });
        // registerForm.api({
        //     url: '/registerCheck',
        //     serializeForm: true,
        //     method: 'post',
        //     successTest: function (response) {
        //         return response.success || false;
        //     },
        //     onSuccess: function (response) {
        //         if (response.redirectUrl) {
        //             //FIXME: 可能有潜在的安全风险
        //             window.location.href = response.redirectUrl;
        //         }
        //     }, onFailure: function (response) {
        //         $('#errorMessage').html(response.message);
        //         $('#login-form').transition('jiggle');
        //         registerForm.form('reset');
        //         refreshCaptcha();
        //         $('#username').focus();
        //     }
        // });

    });


</script>

</html>
