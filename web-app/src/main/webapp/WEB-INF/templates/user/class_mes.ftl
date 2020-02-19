<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课程详情页</title>
    <link rel="stylesheet" href="/css/community.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
    <script src="/js/community.js"></script>
    <script src="/js/moment.js"></script>
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
            <#--top-->
                <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 " style="max-height: 300px;min-height: 250px;">
                    <div class="row no-gutters">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <img height="200px" src="/upload/class/${(course.HEAD)!'/upload/user/default-avatar.png'}" class="card-img" alt="...">
                            <#--//保存课程的id-->
                            <input type="hidden" id="classId" value="${(course. CLASSID)!''}">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                            <div class="card-body">
                            <#--课程名称-->
                                <h5 class="card-title">${(course.TITLE)!'还没想好题目'}</h5>
                                <p>简介：</p>
                                <p class="card-text">${(course.DESCRIPTION)!'老师还没有更新题目'}</p>
                                <p class="card-text"><small class="text-muted">开始时间：<span>${(course.GMT_CREATED*1000)?number_to_datetime?string('yyyy-MM-dd ')} </span></small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
            <#--bottom-->
                <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                    <div class="card-header">
                        主讲老师：<span>${(user.NAME)!''}</span><svg class="bi bi-list-stark text-success" width="32" height="32" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"></svg>
                    </div>
                    <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                        <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 " style="max-height: 300px;min-height: 250px;">
                            <div class="row no-gutters">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                    <img src="/upload/user/head/${(user.HEAD)!'/upload/user/default-avatar.png'}" class="card-img" alt="${(user.NAME)!''}">
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                    <div class="card-body">
                                        <h5 class="card-title">${(user.PHONE)!''}</h5>
                                        <p>简介：</p>
                                        <p class="card-text">${(user.EMAIL)!''}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">


        </div>
    </div>
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/editormd.min.css">
<link rel="stylesheet" href="/css/editormd.preview.min.css">
<script src="/js/editormd.min.js" type="application/javascript"></script>
<script src="/js/moment.js" type="application/javascript"></script>
<script src="/js/lib/marked.min.js"></script>
<script src="/js/lib/prettify.min.js"></script>
</body>
</html>