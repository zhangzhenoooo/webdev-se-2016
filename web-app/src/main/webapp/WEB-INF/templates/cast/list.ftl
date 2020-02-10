
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="referrer" content="never">
    <title>影人信息</title>
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
<div id="upload-picker" style="display: none;"></div>
<a href="/cast/add" class="ui small button primary">添加影人</a>
<table class="center"  width="75%" cellspacing="0"  align="center" border="1" cellpadding="5">
    <tr class="center">
        <th>编号</th>
        <th>照片</th>
        <th>中文名</th>
        <th>英文名</th>
        <th>性别</th>
        <th>生日</th>
        <th>地区</th>
        <th>操作</th>
    </tr>
    <#list page.getList() as cast>
        <tr class="center">
            <td>${cast.id}</td>
            <td style="width: 100px"><img src="${(cast.avatarUrl)!"/images/nophoto.png" }" width="100" height="110"></td>
            <td>${cast.chinese_name}</td>
            <td>${(cast.english_name)!"不详"}</td>
            <td>${(cast.gender)!"不详"}</td>
            <td>${(cast.birthday)!"不详"}</td>
            <td>${(cast.region)!"不详"}</td>

            <td><a href="/cast/edit?id=${cast.id}" class="ui tiny green button">修改</a>
                <a href="/cast/delete?id=${cast.id}" class="ui tiny red button">删除</a>
                <a href="#" class="ui tiny primary button" onclick="uploadAvatar(${cast.id})">上传照片</a>
            </td>

        </tr>
    </#list>
</table>
<div align="center">
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
    var castId=0;
    function deleteCastById(id) {
        var choice = confirm('确认删除该影人信息吗？');
        if(!choice){
            return;
        }

        $.ajax({
            url:'/cast/delete',
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
        castId = id;
    }
    var uploader = WebUploader.create({
        auto: false,
        swf: '/js/webuploader/Uploader.swf ',
        sever:'/cast/avatar/upload',

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
            if(error|| castId===0){
                return;
            }
            originalAvatarUrl = $('#avatar-'+ castId).attr('src');
            $('#avatar-'+ castId).attr('src',src);
        });
  setTimeout(function () {
      var choice = confirm('确定要上传该图片吗？');
      if (choice){
          uploader.option('formData',{
              'id' :castId
          });
          uploader.upload(file);
      } else {
          $('#avatar-'+ castId).attr('src',originalAvatarUrl);
          uploader.removeFile(file,true);
      }
  })
    });
</script>
</html>