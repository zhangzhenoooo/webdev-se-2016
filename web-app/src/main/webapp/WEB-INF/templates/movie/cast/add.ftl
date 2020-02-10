<#-- @ftlvariable name="castList" type="java.util.List<cn.edu.nxu.it.model.Cast>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加演职员信息</title>
    <script src="/js/jquery.min.js"></script>
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
<#--<div class="ui menu inverted">-->
<#--    <div class="item">MyDouban!</div>-->
<#--    <div class="item"><a href="#">首页 </a> </div>-->
<#--    <div class="item"><a href="#">电影</a> </div>-->
<#--    <div class="item"><a href="#">个人中心 </a> </div>-->
<#--    <div class="floating right item">-->
<#--        <div class="item"><a href="/login">登录</a> </div>-->
<#--        <div class="item"><a href="/register">注册</a> </div>-->
<#--        <div class="item"><a href="/logout">退出</a> </div>-->
<#--    </div>-->
<#--</div>-->
<div class="ui grid container">
    <div class="center wide column">
        <form class="ui form"  action="/movie/cast/save" method="post">

            <input type="hidden" name="movie_id" value="${movieId}"><br>
            担任岗位：
            <select id="role_id" name="role_id" required>
                <option value="">---请选择---</option>
                <option value="1">导演</option>
                <option value="2">演员</option>
            </select><br>
            影人：
            <select id="cast_id" name="cast_id" required>
                <#list castList as cast>
                    <option value="${cast.id}">${cast.chineseName!""} ${cast.englishName!""} [${cast.region!"不详"}]</option>
                </#list>
            </select><br>
            饰演角色：
            <input type="text" name="act_as" id="act_as">
            <br><input class="ui tiny blue button" autocomplete="off" type="submit" value="保存">
        </form>
    </div>
</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>

</html>
