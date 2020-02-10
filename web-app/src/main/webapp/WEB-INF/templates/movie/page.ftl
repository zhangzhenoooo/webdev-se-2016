<#-- @ftlvariable name="page" type="com.jfinal.plugin.activerecord.Page<cn.edu.nxu.it.model.Movie>" -->
<#-- @ftlvariable name="movies" type="java.util.List<cn.edu.nxu.it.model.Movie>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>电影信息</title>
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

    <link rel="stylesheet" href="/js/webuploader/webuploader.css">
    <script src="/js/webuploader/webuploader.min.js"></script>
    <style>
        .center{
            text-align: center;
        }
    </style>
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
<a href="/movie/add" class="ui tiny primary button">添加新电影</a>
<div class="ui twelve grid centered">
<table class="center" cellspacing="0" cellpadding="0" border="1px red solid">
    <tr class="center">
        <th>编号</th>
        <th>海报</th>
        <th>原片名</th>
        <th>中文名</th>
        <th>地区</th>
        <th>上映时间</th>
        <th>片长</th>
        <th>语言</th>
        <th>操作</th>
    </tr>
    <#list page.getList() as movie>
        <tr>
            <td>${movie.id}</td>
            <td style="width: 100px"><img src="${movie.posterUrl !"/images/nophoto.png" }" width="100" height="110"></td>
            <td>${(movie.originalTitle)!""}</td>
            <td>${(movie.getChineseTitle())!""}</td>
            <td>${(movie.region)!"不详"}</td>
            <td>${(movie.pubDate)!"不详"}</td>
            <td>${(movie.duration)!"不详"}</td>
            <td>${(movie.language)!"不详"}</td>

            <td><a  class="ui icon tiny button" href="/movie/edit?id=${movie.id}" data-tooltip="编辑"><i class="edit icon"></i></a>
                <a class="ui icon tiny red button" href="/movie/delete?${movie.id}" data-tooltip="删除"><i class="delete icon"></i></a>
            <a href="/movie/cast/list?movieId=${movie.id}" class="ui tiny teal button" data-tooltip="演职员表"><i class="users icon"></i> </a> </td>
        </tr>
    </#list>
</table>
</div>
<<div align="center">
    <#if !page.firstPage>
        <a href="?p=${page.pageNumber - 1}" class="ui tiny blue button">上一页</a>|
    </#if>
    第${page.pageNumber}页，共${page.totalPage}页
    <#if !page.lastPage>
        <a href="?p=${page.pageNumber + 1}" class="ui tiny blue button">下一页</a>
    </#if>



</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>


<script>
    var movieId=0;
    function deleteCastById(id) {
        var choice = confirm('确认删除该影人信息吗？');
        if(!choice){
            return;
        }
        $.ajax({
            url:'/movie/delete',
            method: 'post',
            data: {'id':id},
            success:function (response) {
                alert(response.message);
                if(response.success) //删除成功
                    window.location.reload(); //刷新页面
            }
        });
    }
    function uploadAvatar(id) {
        $('.webuploader-element-invisible').click();
        movieId = id;
    }
    var uploader = WebUploader.create({
        auto: false,
        swf: '/js/webuploader/Uploader.swf ',
        sever:'/movie/poster/upload',

        //选择文件的按钮。可选
        //内部根据当前运行时创建，可能是input元素，也可能是flash
        pick:'#upload-picker',
        //只允许选择图片文件
        accept:{
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes:'image/*'
        }
    });
    uploader.on('fileQueued',function (file) {
        var originalAvatarUrl = '';
        uploader.makeThumb(file,function (error, src) {
            if(error|| movieId===0){
                return;
            }
            originalAvatarUrl = $('#avatar-'+ movieId).attr('src');
            $('#avatar-'+ movieId).attr('src',src);
        });
        setTimeout(function () {
            var choice = confirm('确定要上传该图片吗？');
            if (choice){
                uploader.option('formData',{
                    'id' :movieId
                });
                uploader.upload(file);
            } else {
                $('#avatar-'+ movieId).attr('src',originalAvatarUrl);
                uploader.removeFile(file,true);
            }
        })
    });
</script>
</html>