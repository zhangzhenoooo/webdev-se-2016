<#-- @ftlvariable name="user" type="cn.edu.nxu.it.model.User" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息维护</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <h3 class="shadow-sm p-3 mb-5 bg-white rounded">个人主页</h3>
            <hr >
            <form class="shadow p-3 mb-5 bg-white rounded" method="post" action="/updateMyMes" >
                <div class="form-group">
                    <input type="hidden" class="form-control" name="user.USERID" id="user.USERID" value="${(user.getUSERID())!''}" >
                </div>
                <div class="form-group">
                    <label for="user.EMAIL">绑定的邮箱:</label>
                    <input type="email" class="form-control" name="user.EMAIL" id="user.EMAIL" value="${(user.EMAIL)!''}" aria-describedby="emailHelp" >
                </div>
                <div class="form-group">
                    <label for="user.NAME">名字:</label>
                    <input type="text" class="form-control" name="user.NAME" id="user.NAME" value="${(user.getNAME())!''}">
                </div>
                <div class="form-group">
                    <label for="user.PHONE">联系方式:</label>
                    <input type="tel" class="form-control" name="user.PHONE" id="user.PHONE" value="${(user.getPHONE())!''}">
                </div>
                <div class="form-group">
                <label for="user.INTRODUCTION">个人介绍:</label>
                <input type="text" class="form-control"name="user.INTRODUCTION" id="user.INTRODUCTION" value="${(user.INTRODUCTION)!'这个人很懒，还没有留下个性签名'}">
            </div>
                <button type="submit" class="btn btn-primary ">修改</button>
                <button type="reset" class="btn btn-primary">取消</button>

            </form>
            <h3>我的课程</h3>
            <hr>
            <#if courses??>
                <div class="row">
                        <#assign  i = 1>
                    <#list courses as course>

                                  <div class="col-sm-3">
                                      <div class="card" style="width: 18rem;">
                                          <img src="/upload/class/${(course.HEAD)!''}" class="card-img-top" height="150px" alt="${(course.TITLE)!''}">
                                          <div class="card-body"  style="height: 150px;">
                                              <p class="card-text"><span></span>
                                                  <a href="/user/classMes?id=${(course.CLASSID)!''}">${(course.TITLE)!''}</a>
                                              </p>
                                              <p class="card-text"><span>课程简介：</span>
                                                  <span style=" display :inline-block ;width: 100%;height: 20px;overflow: hidden;textOverflow: ellipsis;whiteSpace: nowrap" title=${(course.DESCRIPTION)!''} >${(course.DESCRIPTION)!''}</span>
                                              </p>
                                          </div>
                                      </div>
                                  </div>
                        <#if i%4 == 0>
                            <hr class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        </#if>
                        <#assign  i = i+1>

                    </#list>
                </div>
            </#if>



        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <div class="card" style="width: 18rem;">
                <#if (((user.HEAD)!'') == '' )>
                <form enctype="multipart/form-data" method="post" action="addHead">
                    <div class="form-group">

                        <input type="hidden" class="form-control-file" id="USERID" name="USERID" value="${(user.getUSERID())!''}">
                    </div>
                    <div class="form-group">
                        <label for="HEAD">上传头像</label>
                        <input type="file" class="form-control-file" id="HEAD" name="HEAD">
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </form>
                    <#else >
                  <img src="/upload/user/head/${(user.HEAD)!'/upload/user/default-avatar.png'}" style="height: 250px;" class="card-img-top" alt="...">
                </#if>

                <div class="card-body">
                    <h5 class="card-title">${(user.getNAME())!'匿名用户'}</h5>
                    <p class="card-text">${(user.getINTRODUCTION())!''}</p>
                </div>
            </div>
        <#--浏览历史记录-->
            <br>
            <#--<h4>History：</h4>-->
            <#--<ul class="list-group list-group-flush">-->
                <#--<#if histories?? && (histories?size >0)>-->
                    <#--<#list histories as historie>-->
                        <#--<#assign dlong = (historie.GMT_MODIFIED)!0?number * 1000 />-->
                                    <#--<li class="list-group-item" style="font-size: 16px;"><span>${dlong?number_to_datetime} </span>:&nbsp;-->
                                        <#--<#if historie.TYPE == 1>学习了课程章节：</#if>-->
                                        <#--<#if historie.TYPE == 2>参加了课程测试：</#if>-->
                                        <#--<#if historie.TYPE == 3>浏览了课程：</#if>-->
                                        <#--<span><a href="/user/classMes?id=${(historie.THINGID)!}">${(historie.THING_NAME)!}</a> </span></li>-->

                    <#--</#list>-->
                <#--</#if>-->
            <#--</ul>-->
        </div>
    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "footer.ftl">
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>