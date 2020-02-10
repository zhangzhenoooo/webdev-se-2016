<#-- @ftlvariable name="movieCast" type="cn.edu.nxu.it.model.MovieCast" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    <title></title>

</head>
<body>
<#--<div class="ui menu inverted">-->
<#--    <div class="item">MyDouban!</div>-->
<#--    <div class="item"><a href="#">首页 </a> </div>-->
<#--    <div class="item"><a href="#">电影</a> </div>-->
<#--    <div class="item"><a href="#">个人中心 </a> </div>-->
<#--    <div class="floating right item">-->
<#--        <div class="item"><a href="/login">登录</a> </div>-->
<#--        <div class="item"><a href="/login1">退出</a> </div>-->
<#--    </div>-->
<#--</div>-->
<div class="ui grid container">
    <form class="ui form" action="/movie/cast/update" method="post">
        <input type="text" name="id" id="id" value="${movieCast.id}">${movieCast.id}<br>
        岗位:<input type="text" name="movieCast.role_name" id="movieCast.role_name" autocomplete="off" value="${movieCast.role_name!""}"><br>
        中文名:<input type="text" name="chinese_name" id="chinese_name" autocomplete="off" value="${movieCast.chinese_name!""}"><br>
        英文名:<input type="text" name="english_name" id="english_name" autocomplete="off" value="${movieCast.english_name!""}"><br>
        饰演角色:<input type="text" name="act_as" id="act_as" autocomplete="off" value="${movieCast.actAs!""}"><br>
        <input class="ui blue button" type="submit" value="更新">
    </form>
</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>
</html>