<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "navigation.html">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 " style="padding-left: 10%;padding-right: 10%;padding-top: 10px">
            <h3 class="text-center">注册</h3>
            <br>
            <#--表单的错误提示-->
            <small  style="color: red;" class="form-text text-muted ">${(message)!''}</small>
            <form class="shadow p-3 mb-5 bg-white rounded " id="form-register"  method="post" action="/doRegister">
                <div class="form-group">
                    <label for="user.EMAIL">邮箱地址：</label>
                    <input type="email" class="form-control"  placeholder="@Email" name="user.EMAIL" id="user.EMAIL" aria-describedby="inputGroupPrepend" required>
                    <div class="invalid-feedback">
                       请输入邮箱
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.NAME">姓名：</label>
                    <input type="text" class="form-control" name="user.NAME" id="user.NAME" required>
                    <div class="invalid-feedback">
                       请输入姓名
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.TYPE">请选择你的身份：</label>
                    <select class="form-control" id="user.TYPE" name="user.TYPE" required>
                        <option value="0"> 学生</option>
                        <option value="1"> 老师</option>
                    </select>
                    <div class="invalid-feedback">
                        请选择身份
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.PASSWORD">请输入密码：</label>
                    <input type="password" class="form-control"name="user.PASSWORD" id="user.PASSWORD" required>
                    <div class="invalid-feedback">
                        请输入密码
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.PASSWORD2">请确认密码</label>
                    <input type="password" class="form-control" name="user.PASSWORD2" id="user.PASSWORD2" required>
                    <div class="invalid-feedback">
                        请确认密码
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.PHONE">请输入联系方式：</label>
                    <input type="tel" class="form-control" name="user.PHONE" id="user.PHONE" required>
                    <div class="invalid-feedback">
                        请输入你的联系方式
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.AGE">请输入您的年龄：</label>
                    <input type="number" class="form-control" name="user.AGE" id="user.AGE" required>
                    <div class="invalid-feedback">
                        请输入你的年龄
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.SEX">请选择性别：</label>
                    <select class="form-control" id="user.SEX" name="user.SEX" required>
                        <option value="0"> 女</option>
                        <option value="1"> 男</option>
                    </select>
                    <div class="invalid-feedback">
                        请选择性别
                    </div>
                </div>
                <div class="form-group">
                    <label for="user.HEAD">是否要上传头像？</label>
                    <input type="file" class="form-control" name="user.HEAD" id="user.HEAD" required>
                    <div class="invalid-feedback">
                        请上传头像
                    </div>
                </div>


                <button type="submit" class="btn btn-primary">注册</button>
                <button type="reset" class="btn btn-primary">重置</button>
            </form>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <h3 >推荐课程：</h3>
        </div>
    </div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
    // bootstrap Validation表单验证： Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = $("#form-register");
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                        // event.empty();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>