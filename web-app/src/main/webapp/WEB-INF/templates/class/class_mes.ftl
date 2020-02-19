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
                            <img src="/upload/class/${(course.HEAD)!'/upload/user/default-avatar.png'}" class="card-img" alt="...">
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
                        章节目录<svg class="bi bi-list-stark text-success" width="32" height="32" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"></svg>
                    </div>
                    <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                        <blockquote class="blockquote mb-0">
                        <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                        <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                            <ul class="list-group list-group-flush overflow-hidden" style="max-height: 600px;min-height: 400px;">
                                        <#list catalogues as catalogue>
                                            <li class="list-group-item">
                                                <a href="catalogue?id=${(catalogue. CATALOUGEID)!''}">${(catalogue.TITLE)!'为命名'}</a>
                                                &nbsp; <button type="button" class="btn btn-primary float-right">
                                                <a href="/test/test?id=${(catalogue.CLASSID)!'/'}" style="color: white;">课后测试</a>
                                            </button>
                                                &nbsp;<button type="button" class="btn btn-primary float-right">课件下载</button>
                                                &nbsp;   <button type="button" class="btn btn-primary float-right">
                                                <a href="/test/addTest?id=${(catalogue. CATALOUGEID)!''}" style="color: white;">添加课后测试</a>
                                            </button>&nbsp;
                                            </li>
                                        </#list>

                            </ul>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </blockquote>
                    </div>
                    <div class="card">
                    <#--//评论区-->
                        <div class="card-header">
                            评论区
                        </div>
                        <div class="card-body">
                            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                <!--回复-->
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h4>
                                        <span >${(comments?size)!0}</span> 个回复
                                    </h4>
                                    <hr class="col-lg-12 col-md-12 col-sm-12 col-xs-12 comment-sp">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 comments" >
                                        <#list comments as comment>
                                            <div class="media">
                                                <div class="media-left">
                                                    <a href="#">
                                                        <img class="media-object img-rounded" src="/upload/user/head/${(comment.user.HEAD)!'/upload/user/head/default-avatar.png'}">
                                                    </a>
                                                </div>
                                                <div class="media-body" id="${'comment-body-'+comment.user.USERID}" >
                                                    <h5 class="media-heading">
                                                        <span >${(comment.user.NAME)!''}</span>
                                                    </h5>
                                                    <div >
                                                        ${(comment.CONTENT)!''}
                                                    </div>
                                                    <div class="menu">
                                                        <span class="glyphicon glyphicon-thumbs-up icon">点赞
                                                        </span>
                                                        <span  class="comment-icon">
                                                            <img data-id="${comment.COMMENTID}"   onclick="collapseComments(this)" src="/images/icon/chat24.png" alt="" width="32" height="32" title="点击查看回复">
                                                        </span>
                                                        <span class="glyphicon glyphicon-comment"></span>
                                                        <span >${(comment.COMMENT_COUNT)!0}</span>
                                                  </span>
                                                        <span class="float-right"> &nbsp;评论日期:2020-02-02   </span>
                                                    </div>
                                                    <!--二级评论-->
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  collapse sub-comments"
                                                         id="${'comment-'+(comment.COMMENTID)!}">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <input type="text" class="form-control" placeholder="评论一下……"
                                                                   id="${'input-'+comment.COMMENTID}">
                                                            <button type="button" class="btn btn-success pull-right" onclick="comment(this)"
                                                            data-id="${(comment.COMMENTID)!}">评论</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </#list>

                                    </div>
                                </div>

                                <!--回复输入框-->
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h4>
                                        提交回复
                                    </h4>
                                    <hr class="col-lg-12 col-md-12 col-sm-12 col-xs-12 comment-sp">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="comment_section">
                                        <div class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object img-rounded" src="/upload/user/${(user.HEAD)!'default-avatar.png'}">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="media-heading">
                                                    <span >${(user.NAME)!'匿名用户'}</span>
                                                </h5>
                                            </div>
                                        </div>
                                        <input type="hidden" id="question_id" value="${(course. CLASSID)!''}" >
                                        <textarea class="form-control comment" rows="6" id="comment_content"></textarea>
                                        <button type="button" class="btn btn-success btn-comment" onclick="post()">回复</button>
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
            <div class="row p-2">
            <#--最新动态-->
                <h3>最新动态</h3>
                <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <blockquote class="blockquote mb-0">
                    <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                    <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                        <ul class="list-group list-group-flush ">
                        <#--10 pis-->
                            <li class="list-group-item">第一章 ：Cras justo odio</li>
                            <li class="list-group-item">第二章：Dapibus ac facilisis in</li>
                            <li class="list-group-item">第三章：Morbi leo risus</li>
                            <li class="list-group-item">第四章：Porta ac consectetur ac</li>
                            <li class="list-group-item">第五章：Vestibulum at eros</li>
                        </ul>
                    </blockquote>
                </div>
            </div>
            <div class="row mt-5">
                <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12" style="max-height: 600px;min-height: 400px;">
                    <div class="card-header">
                        课后习题
                    </div>
                    <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <blockquote class="blockquote mb-0">
                        <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                        <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                            <ul class="list-group list-group-flush">
                                <#list tests as test>
                                    <a href="#">  <li class="list-group-item">${(test.DESCRPTION)!''}</li></a>
                                </#list>

                            </ul>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </blockquote>
                    </div>
                </div>
            </div>

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