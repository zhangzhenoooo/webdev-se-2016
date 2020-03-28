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
                            <img src="/upload/class/${(course.HEAD)!'/upload/class/default_class_picture.jpg'}" class="card-img" alt="">
                            <#--//保存课程的id-->
                            <input type="hidden" id="classId" value="${(course. CLASSID)!''}">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                            <div class="card-body">
                            <#--课程名称-->
                                <h5 class="card-title">${(course.TITLE)!'还没想好题目'}</h5>
                                <p>简介：</p>
                                <p class="card-text">${(course.DESCRIPTION)!'老师还没有更新题目'}</p>
                                <p class="card-text"><small class="text-muted">开始时间：<span> ${(course.GMT_CREATED?number?number_to_datetime?string("yyyy-MM-dd"))!}</span></small></p>

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
                            <a class="btn-publish" href="/class/addcatalogue?id=${(course.CLASSID)!}">更新课件</a>
                    </div>
                    <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                        <blockquote class="blockquote mb-0">
                        <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                        <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                            <ul class="list-group list-group-flush overflow-hidden" >
                                <#assign  x=1>
                                        <#list catalogueDTOS as catalogueDTO>
                                            <li class="list-group-item" style="font-size: 16px;"  >
                                                <p >第<span>${(catalogueDTO.PARENTID)!''}</span>章：${(catalogueDTO.TITLE)!'未命名'}
                                                    <a href="modifyCatalogue?id=${(catalogueDTO. CATALOUGEID)!''}">编辑</a>
                                                    <a  style="color: red;" href="#" data-id="${(catalogueDTO. CATALOUGEID)!''}"  onclick="deleteCatalogue(this)" >删除</a>
                                                </p>
                                            </li>
                                            <#assign  y=1>
                                             <#list catalogueDTO.catalogueList as catalogue>
                                                      <p class="list pl-5" >
                                                          <a style="font-size: 16px; color: gray"  href="catalogue?id=${(catalogue. CATALOUGEID)!''}">第<span>${(catalogue.NODE)!''}</span>节：${(catalogue.TITLE)!'未命名'}</a>
                                                          &nbsp;<a style="font-size: 16px;" href="modifyCatalogue?id=${(catalogue. CATALOUGEID)!''}">编辑</a>
                                                          <a style="color: red;font-size: 16px;" href="#" data-id="${(catalogue. CATALOUGEID)!''}"  onclick="deleteCatalogue(this)" >删除</a>
                                                    </p>
                                                 <#assign  y=y+1>
                                                </#list>
                                            <#assign  x=x+1>
                                        </#list>

                            </ul>
                        </blockquote>
                    </div>
                    <div class="card" >
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
                                                        <#assign dlong = (comment.GMT_CTRATED)!0?number * 1000 />
                                                        <span class="float-right"> &nbsp;评论日期:${dlong?number_to_datetime}  </span>
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
                                                    <img class="media-object img-rounded" src="/upload/user/head/${(session.user.HEAD)!'default-avatar.png'}">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="media-heading">
                                                    <span >${(session.user.NAME)!'匿名用户'}</span>
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
        <#--<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">-->
            <#--&lt;#&ndash;<div class="row p-2">&ndash;&gt;-->
            <#--&lt;#&ndash;&lt;#&ndash;最新动态&ndash;&gt;&ndash;&gt;-->
                <#--&lt;#&ndash;<h3>最新动态</h3>&ndash;&gt;-->
                <#--&lt;#&ndash;<div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">&ndash;&gt;-->
                    <#--&lt;#&ndash;<blockquote class="blockquote mb-0">&ndash;&gt;-->
                    <#--&lt;#&ndash;&lt;#&ndash;<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>&ndash;&gt;&ndash;&gt;-->
                    <#--&lt;#&ndash;&lt;#&ndash;<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>&ndash;&gt;&ndash;&gt;-->
                        <#--&lt;#&ndash;<ul class="list-group list-group-flush ">&ndash;&gt;-->
                        <#--&lt;#&ndash;&lt;#&ndash;10 pis&ndash;&gt;&ndash;&gt;-->
                            <#--&lt;#&ndash;<li class="list-group-item">第一章 ：Cras justo odio</li>&ndash;&gt;-->
                            <#--&lt;#&ndash;<li class="list-group-item">第二章：Dapibus ac facilisis in</li>&ndash;&gt;-->
                            <#--&lt;#&ndash;<li class="list-group-item">第三章：Morbi leo risus</li>&ndash;&gt;-->
                            <#--&lt;#&ndash;<li class="list-group-item">第四章：Porta ac consectetur ac</li>&ndash;&gt;-->
                            <#--&lt;#&ndash;<li class="list-group-item">第五章：Vestibulum at eros</li>&ndash;&gt;-->
                        <#--&lt;#&ndash;</ul>&ndash;&gt;-->
                    <#--&lt;#&ndash;</blockquote>&ndash;&gt;-->
                <#--&lt;#&ndash;</div>&ndash;&gt;-->
            <#--&lt;#&ndash;</div>&ndash;&gt;-->
            <#--<div class="row ">-->
                <#--<div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12" style="max-height: 600px;min-height: 400px;">-->
                    <#--<div class="card-header">-->
                        <#--课后习题-->
                    <#--</div>-->
                    <#--<div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
                        <#--<blockquote class="blockquote mb-0">-->
                        <#--&lt;#&ndash;<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>&ndash;&gt;-->
                        <#--&lt;#&ndash;<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>&ndash;&gt;-->
                            <#--<ul class="list-group list-group-flush">-->
                                <#--<#list CataloguetTests as CataloguetTest>-->
                                    <#--<a href="/test/test?id=${(CataloguetTest.CATALOUGEID)!''}">  <li class="list-group-item">${(CataloguetTest.TITLE)!''}&nbsp;章节测试</li></a>-->
                                <#--</#list>-->

                            <#--</ul>-->
                            <#--&lt;#&ndash;<nav aria-label="Page navigation example">&ndash;&gt;-->
                                <#--&lt;#&ndash;<ul class="pagination justify-content-end">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<li class="page-item disabled">&ndash;&gt;-->
                                        <#--&lt;#&ndash;<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>&ndash;&gt;-->
                                    <#--&lt;#&ndash;</li>&ndash;&gt;-->
                                    <#--&lt;#&ndash;<li class="page-item"><a class="page-link" href="#">1</a></li>&ndash;&gt;-->
                                    <#--&lt;#&ndash;<li class="page-item"><a class="page-link" href="#">2</a></li>&ndash;&gt;-->
                                    <#--&lt;#&ndash;<li class="page-item"><a class="page-link" href="#">3</a></li>&ndash;&gt;-->
                                    <#--&lt;#&ndash;<li class="page-item">&ndash;&gt;-->
                                        <#--&lt;#&ndash;<a class="page-link" href="#">Next</a>&ndash;&gt;-->
                                    <#--&lt;#&ndash;</li>&ndash;&gt;-->
                                <#--&lt;#&ndash;</ul>&ndash;&gt;-->
                            <#--&lt;#&ndash;</nav>&ndash;&gt;-->
                        <#--</blockquote>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->

        <#--</div>-->
    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../footer.ftl">
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
<script>
    function  deleteCatalogue(e) {
        var id = e.getAttribute("data-id");
        $.ajax({
            url:'/class/deleteCatalogue',
            type:'post',
            data:{id:id},
            success:function (respose) {
                if (respose.success){
                    window.location.reload();
                }else {
                    alert("删除失败");
                }

            },
            error:function (error) {

            }

        })

    }
</script>
</body>
</html>