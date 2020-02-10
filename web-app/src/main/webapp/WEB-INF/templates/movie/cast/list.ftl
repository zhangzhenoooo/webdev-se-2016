<#-- @ftlvariable name="movie" type="cn.edu.nxu.it.model.Movie" -->
<#-- @ftlvariable name="movieCastList" type="java.util.List<cn.edu.nxu.it.model.MovieCast>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta  name="referrer" content="never">
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

    <title>演员信息</title>
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
<#--        <div class="item"><a href="/login1">退出</a> </div>-->
<#--    </div>-->
<#--</div>-->
<div class="ui grid container">
    <div class="nine center wide column">
        <br>
        <a href="/movie/cast/add?movieId=${movie.id}" class="ui green button">+添加演职员信息</a>
        <table class="ui celled stackable table ">
            <thead>
            <tr>
                <th>岗位</th>
                <th>中文名</th>
                <th>英文名</th>
                <th>饰演角色</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list movieCastList as movieCast>
                <tr>
                    <td>${movieCast.role_name!""}</td>
                    <td>${movieCast.chinese_name!""}</td>
                    <td>${movieCast.english_name!""}</td>
                    <td>${movieCast.actAs!""}</td>
                    <td>
                        <a href="/movie/cast/edit?id=${movieCast.id}" class="ui tiny blue icon button">
                            <i class="edit icon"></i>
                        </a>
                        <a href="/movie/cast/delete?id=${movieCast.id}" class="ui tiny red icon button">
                            <i class="delete icon"></i>
                        </a>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>
<script>

</script>
</html>