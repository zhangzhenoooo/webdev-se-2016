<#-- @ftlvariable name="page" type="com.jfinal.plugin.activerecord.Page<cn.edu.nxu.it.model.Cast>" -->
<#-- @ftlvariable name="cast" type="java.util.List<cn.edu.nxu.it.model.Cast>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>演员分页列表</title>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <style>
        td{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="ui menu inverted">
    <div class="item">MyDouban!</div>
    <div class="item"><a href="#">首页 </a> </div>
    <div class="item"><a href="#">电影</a> </div>
    <div class="item"><a href="#">个人中心 </a> </div>
    <div class="floating right item">
        <div class="item"><a href="/login">登录</a> </div>
        <div class="item"><a href="/register">注册</a> </div>
        <div class="item"><a href="/logout">退出</a> </div>
    </div>
</div>

<div class="ui grid container">
    <div class="nine center wide column">
        <br>
<#--        <a class="ui tiny green button" href="/movie/page">电影信息表</a>-->
<#--        <br>-->
        <table class="ui tiny celled stackable table" border="1" cellspacing="0" cellpadding="10">
            <tr>
                <th>编号</th>
                <th>中文名</th>
                <th>英文名</th>
                <th>性别</th>
                <th>头像</th>
                <th>出生年月</th>
                <th>国籍</th>
                <th>豆瓣ID</th>
            </tr>
            <#list page.list as cast>
                <tr>
                    <td>${(cast.id)!""}</td>
                    <td>${(cast.chineseName)!""}</td>
                    <td>${(cast.englishName)!""}</td>
                    <td>${(cast.gender)!"不详"}</td>
                    <td><img src="${(cast.avatarUrl)!""}" height="100" width="100"></td>
                    <td>${(cast.birthday)!""}</td>
                    <td>${(cast.region)!""}</td>
                    <td>${(cast.doubanId)!""}</td>
                </tr>
            </#list>
        </table><br>
        <div class="ui grid container">
            <#if !page.firstPage>
                <a class="ui tiny blue button" href="?p=${page.pageNumber - 1}">上一页</a>
            </#if>
            第${page.pageNumber}页，共${page.totalPage}页
            <#if !page.lastPage>
                <a class="ui tiny blue button" href="?p=${page.pageNumber + 1}">下一页</a><br>
            </#if>
<#--            <#list 1..page.totalPage as index>-->
<#--                <a class="ui tiny blue button" href="?p=${index}">第${index}页</a>&nbsp;&nbsp;-->
<#--            </#list>-->
        </div>
    </div>
</div>
    <ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.
    </ul>
</body>
</html>