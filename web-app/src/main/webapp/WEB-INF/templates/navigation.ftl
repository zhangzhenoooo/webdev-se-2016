<#-- @ftlvariable name="user" type="cn.edu.nxu.it.model.User" -->
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>988888</title>
    <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">-->

</head>
<body >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">在线学习</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#--<#if (seeeion.user)??>-->

                    <#if ((session.user.TYPE)!3)==1 >
                <#--//老师-->
                           <#--<li class="nav-item dropdown">-->
                               <#--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                                   <#--课程管理-->
                               <#--</a>-->
                               <#--<div class="dropdown-menu" aria-labelledby="navbarDropdown">-->
                                   <#--<a class="dropdown-item" href="/class/publishClass">发布课程</a>-->
                                   <a class="nav-link" href="/" aria-disabled="true">我的课程</a>
                                   <#--<a href="addcatalogue?id=${(course.CLASSID)!}" style="color: white;">更新课件</a>-->
                                   <#--<div class="dropdown-divider"></div>-->
                                   <#--<a class="dropdown-item" href="#">我的测试</a>-->
                               <#--</div>-->
                           <#--</li>-->

                         <a class="nav-link " href="/studentManagement"  aria-disabled="true">学生管理</a>

                    </#if>
                    <#if ((session.user.TYPE)!3)==0>
                            <#--学生-->
                            <#--<li class="nav-item dropdown">-->
                               <#--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                                   <#--课程管理-->
                               <#--</a>-->
                               <#--<div class="dropdown-menu" aria-labelledby="navbarDropdown">-->

                                   <a class="nav-link" href="/" aria-disabled="true">我的课程</a>

                                   <#--<div class="dropdown-divider"></div>-->
                                   <#--<a class="dropdown-item" href="#">我的任务(选做)</a>-->
                               <#--</div>-->
                            <#--</li>-->
                    </#if>

            <#--</#if>-->
        </ul>
    <#--<form class="form-inline my-2 my-lg-0">-->
    <#--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
    <#--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查询</button>-->
    <#--</form>-->
        <ul class="navbar navbar-right" >

            <li class="nav-item" style="list-style-type:none;">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#myMessage" aria-disabled="true">我的消息 <span id="notification_count" class="badge badge-primary badge-pill">${(session.notifications?size)!0}</span></a>
            </li>
            <#if (session.user)??>
                 <li class="nav-item dropdown" style="list-style-type:none;">

                     <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         ${(session.user.NAME)!'未登录'}
                     </a>

                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                         <a class="dropdown-item" href="/myMes">个人主页</a>
                         <a class="dropdown-item" href="/updatePassword">更改密码</a>
                         <a class="dropdown-item" href="/logout">退出登录</a>
                         <a class="dropdown-item" href="/register">注册</a>
                     </div>
                 </li>
            <#else >
             <a class="nav-link " href="/login"  >
                 ${(session.user.NAME)!'去登录'}
             </a>
            </#if>

        </ul>
    </div>
</nav>

<div class="modal fade overflow-auto" id="myMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-left: 30%;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">我的消息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="list-group list-group-flush">
                    <#if session??>
                         <#if session.notifications?? && (session.notifications?size > 0)>
                             <#list session.notifications as notification>
                               <li class="list-group-item">
                                   <span>${(notification.NOTIFER_NAME)!}</span>
                                   <span><#if notification.TYPE == 1>   发起了提问: <#else > 回复了:</#if></span>
                                   <span>${(notification.OUTER_TITLE)!''}</span>
                                   <button type="button" onclick="markRead(this)" data-id="${(notification.NOTIFICATIONID)!}" id="${(notification.NOTIFICATIONID)!}" class="btn  btn-primary float-right">已读</button>
                                   <br>
                                   回复日期：<span class="text-right">${(notification.GMT_CREATED)!''}</span>
                               </li>
                             </#list>
                         </#if>
                    </#if>



                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="markRead(this)" data-id="0"  data-dismiss="modal">全部已读</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>-->
<script>
    function markRead(e) {
        var notificationId = e.getAttribute("data-id");
        $.ajax({
            type:'post',
            url:'/user/markRead',
            data: {
                'NOTIFICATIONID':notificationId
            },
            success:function f(data) {
                if (data.success){
                    $("#notification_count").val(data.count);
                }
        }

    });
    }
</script>
</body>

</html>
