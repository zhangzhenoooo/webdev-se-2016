<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<#--    <script src="/js/layui/layui.all.js"></script>-->
<#--    <link rel="stylesheet" href="/js/layui/css/layui.css">-->
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
    <title>电影信息</title>
</head>
<body>
<div class="ui twelve centered column" >
<#--    <div class="ui menu inverted">-->
<#--        <div class="item">MyDouban!</div>-->
<#--        <div class="item"><a href="#">首页 </a> </div>-->
<#--        <div class="item"><a href="#">电影</a> </div>-->
<#--        <div class="item"><a href="#">个人中心 </a> </div>-->
<#--        <div class="floating right item">-->
<#--            <div class="item"><a href="/login">登录</a> </div>-->
<#--            <div class="item"><a href="/login1">退出</a> </div>-->
<#--        </div>-->
<#--    </div>-->
<table id="movie-list" lay-filter="test"></table>
<#--    <ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--    </ul>-->
</body>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#movie-list'
            ,height: 500
            ,url: '/movie/data' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: '编号', width:80, sort: true, fixed: 'left'}
                ,{field: 'original_title', title: '原片名', width:180}
                ,{field: 'chinese_title', title: '中文名', width:180}
                ,{field: 'region', title: '地区', width:180}
                ,{field: 'pub_date', title: '上映时间', width:180, sort: true}
                ,{field: 'duration', title: '片长', width:180}
                ,{field: 'language', title: '语言', width:180}
            ]]
        });
    });
</script>
</html>