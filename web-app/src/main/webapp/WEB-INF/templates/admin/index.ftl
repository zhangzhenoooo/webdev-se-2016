<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台主页</title>
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

<div class="ui sidebar inverted vertical menu " id="sidebar">
<#--    <a class="item" data-href="/movie/list" onclick="loadUrl(this)" href="javascript:void(0);">-->
<#--        电影信息列表-->
<#--    </a>-->
<#--    <a class="item" data-href="/cast/list" onclick="loadUrl(this)" href="javascript:void(0);">-->
<#--        影人信息列表-->
<#--    </a>-->

    <div class="ui inverted segment">
        <div class="ui inverted accordion">

                <div class="title">
                    <i class="dropdown icon"></i>
                    电影信息管理
                </div>

                <div class="content">

                    <p class="transition hidden"><a class="item" data-href="/movie/page" onclick="loadUrl(this)" href="javascript:void(0);">&nbsp;&nbsp;&nbsp;查看/编辑电影信息</a></p>
                    <p class="transition hidden">  <a class="item" data-href="/movie/add" onclick="loadUrl(this)" href="javascript:void(0);">&nbsp;&nbsp;&nbsp;添加电影信息</a></p>
                </div>

            <div class="title">
                <i class="dropdown icon"></i>
                影人信息管理
            </div>

            <div class="content">
                <p class="transition hidden">  <a class="item" data-href="/cast/list" onclick="loadUrl(this)" href="javascript:void(0);">&nbsp;&nbsp;&nbsp;查看/编辑影人信息</a></p>
                <p class="transition hidden">  <a class="item" data-href="/cast/add" onclick="loadUrl(this)" href="javascript:void(0);">&nbsp;&nbsp;&nbsp;增加影人信息</a></p>
            </div>
        </div>
    </div>
</div>


<div class="pusher">

    <div class="ui menu inverted ">
        <div class="item">MyDouban!</div>
        <div class="item" id="sidebar-toggle"><i class="sidebar icon"></i></div>
        <div class="item"><a href="/admin">首页 </a> </div>
        <div class="item"><a href="#">电影</a> </div>
        <div class="item"><a href="#">个人中心 </a> </div>
        <div class="floating right item"><a href="/login">登录</a></div>
        <ul class="layui-nav">
            <li class="layui-nav-item">
                <a href="">个人中心<span class="layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item">
<#--                //t.cn/RCzsdCq   -->
                <a href=""><img src="/images/user/user1.jpg" class="layui-nav-img floating right "  >我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="javascript:;">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="ui grid container" id="">

        <div class="sixteen wide column" style="height: 600px;" >

            <iframe id ="myFrame" src="" frameborder="0" style="width:100%;height: 100%;" >
            </iframe>

        </div>
    </div>
</div>
<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.
</ul>
</body>

<script>
    window.onload = function () {
        var frame = $('#myFrame');
        if (frame.src == null) {
            frame.attr('src','/admin/frame');

        }

    };
    function loadUrl(obj) {
        //  $(obj).attr("data-href");
        //  alert($(obj).data("href"));
        var href = $(obj).data("href");

        var myFrame = $('#myFrame').attr('src',href);
    }
    $('#sidebar-toggle').click(function () {
        $('#sidebar').sidebar('toggle');
    });
    $('.ui.accordion')
        .accordion();
</script>
</html>