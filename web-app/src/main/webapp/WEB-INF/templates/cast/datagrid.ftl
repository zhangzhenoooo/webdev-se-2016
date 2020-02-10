<#-- @ftlvariable name="page" type="com.jfinal.plugin.activerecord.Page<cn.edu.nxu.it.model.Movie
>" -->
<#-- @ftlvariable name="movies" type="java.util.List<cn.edu.nxu.it.model.Movie
>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="referrer" content="never">
    <script src="/js/jquery-1.11.0.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    <!--semantic引入的文件-->
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <!--layui引入的文件-->
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <script src="/js/layui/layui.all.js"></script>
    <#--bootstrap引入的文件-->
    <link rel="stylesheet" href="/js/bootstrap/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css">
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <title>演员列表</title>
    <style>
        td{
            text-align: center;
        }
    </style>
    <style type="text/css">
        td div.layui-table-cell{
            height: 100px;
            line-height: 100px;
            position: relative;
            text-overflow: ellipsis;
            white-space: nowrap;
            box-sizing: border-box;
            padding: 0px 15px;
            overflow: hidden;
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
        <div class="item"><a href="/logout">退出</a> </div>
    </div>
</div>
<div class="ui grid container" >


<a href="/cast/add" class="ui tiny green button">添加演员信息</a>
    <table id="cast-list" style="text-align: center"></table>
</div>

<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.
</ul>
</body>

<script>
    var table=layui.table;
    table.render({
        elem:'#cast-list',
        url:'/cast/data',
        page:true,
        cols:[[
            {
                field:'id',
                title:'编号',
                width:60,
                fixed:'center'
            },
            {
                field:'avatar',
                title:'海报',
                templet:'<div><img src="{{d.avatar_url}}" style="height: 100px"> </div>',
                style:'height:120px;white-space:0;',
                width:105,
                fixed:'center'
            },
            {
                field:'english_name',
                title:'英文名',
                width:180,
                fixed:'center'
            },
            {
                field:'chinese_name',
                title:'中文名',
                width:150,
                fixed:'center'
            },
            {
                field:'gender',
                title:'性别',
                width:80,
                fixed:'center'
            },
            {
                field:'region',
                title:'地区',
                width:100,
                fixed:'center'
            },
            {
                field:'birthday',
                title:'出生日期',
                width:180,
                fixed:'center'
            },
            {
                field:'douban_id',
                title:'豆瓣编号',
                width:100,
                fixed:'center'
            },
            {
                title:'操作',
                templet:'<div><a href="/cast/edit?id={{d.id}}" class="ui tiny blue icon button"><i class="edit icon"></i></a>' +
                    '<a href="/cast/delete?id={{d.id}}" class="ui tiny red icon button"><i class="delete icon"></i></a> </div>',
                width:150,
                fixed:'center'
            },
        ]]
    });
</script>

</html>


