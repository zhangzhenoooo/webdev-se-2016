<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课的章节</title>
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
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="row">
                   <#--top-->
                       <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 " >
                           <div class="row no-gutters">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                   <img  height="200px" src="/upload/class/${(course.HEAD)!}" class="card-img" alt="...">
                               <#--//保存课程章节的id-->
                                   <input type="hidden" id="classId" value="${(catalogue. CATALOUGEID)!''}">
                               </div>
                               <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                   <div class="card-body">
                                       <#--课程名称-->
                                       <h5 class="card-title">${(catalogue.TITLE)!'还没想好题目'}</h5>
                                       <p>简介：</p>
                                       <p class="card-text">${(catalogue.DESCRIPTION)!'老师还没有更新题目'}</p>
                                           <#assign dlong = (catalogue.GMT_CTRATED)!0?number * 1000 />
                                       <p class="card-text"><small class="text-muted">更新时间：<span>${(catalogue.GMT_CREATED?number?number_to_datetime?string("yyyy-MM-dd"))!}</span></small></p>
                                   </div>
                               </div>
                           </div>
                       </div>
               </div>
            <br>
            <div class="row pl-5 pr-5" >
                <#--bottom-->
                    <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 "  >
                        <div class="card-header">
                            <a class="float-right ml-5" href="/test/test?id=${(catalogue.CATALOUGEID)!'/'}">课后测试</a>
                            <a class="float-right ml-5"  href="/class/downLoadFile?id=${(catalogue.CATALOUGEID)!'/'}" >课件下载</a>
                            <a href="#" class="float-right ml-5" data-toggle="modal" data-target="#exampleModal" >浏览课件</a>

                        </div>
                        <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12 "  >
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <#--<li class="nav-item">-->
                                    <#--<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">测试</a>-->
                                <#--</li>-->
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">评论</a>
                                </li>

                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <#--<div class="tab-pane fade show active row" id="home" role="tabpanel" aria-labelledby="home-tab">-->
                                    <#--&lt;#&ndash;测试&ndash;&gt;-->
                                        <#--<div class="row">-->
                                            <#--&lt;#&ndash;left&ndash;&gt;-->
                                            <#--<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">-->

                                            <#--&lt;#&ndash;选择题&ndash;&gt;-->
                                                <#--<div class="card">-->
                                                    <#--<div class="card-header">-->
                                                        <#--选择题-->
                                                    <#--</div>-->
                                                    <#--<div class="card-body">-->
                    <#--<#assign  string = "ABCDEFGH">-->
                     <#--<#assign  x=1>-->
                    <#--<#if singleChoices?? && (singleChoices?size >0)>-->
                        <#--<#list  singleChoices as singleChoice>-->
                        <#--&lt;#&ndash;题目描述&ndash;&gt;-->
                             <#--<h5 class="card-title"><span>${(x)}.</span>${(singleChoice.DESCRPTION)!''}<span class="float-right">(5分)</span></h5>-->
                            <#--<#if singleChoicelines?? &&(singleChoicelines?size >0) >-->
                                <#--<#assign  i = 0>-->
                                <#--<#list singleChoicelines as singleChoiceline>-->
                                    <#--<#if singleChoice.TESTID == singleChoiceline.TESTID  >-->
                                    <#--&lt;#&ndash;选项：&ndash;&gt;-->
                                  <#--<p class="card-text ml-3">-->
                                      <#--<input  type="radio" class="form-check-input" onclick="answerSingleChoice(this)"  name="testline-${(singleChoice.TESTID)!}" data-id="${(singleChoice.TESTID)!}" id="testline-${(singleChoice.TESTID)!}" value="${(string[i])}">-->
                                      <#--<span> ${(string[i])}.&nbsp;&nbsp;</span>${(singleChoiceline.DESCRIPTION)!''}</p>-->
                                        <#--<#assign  i = i+1>-->
                                    <#--</#if>-->
                                <#--</#list>-->
                            <#--</#if>-->
                            <#--<#assign x = x +1>-->
                             <#--<a class="btn btn-outline-info float-right" onclick="getSinglChoice(this)" data-id="${(singleChoice.TESTID)!''}" id="bottom-delete-${(singleChoice.TESTID)!''}">删除</a>-->
                             <#--<a class="btn btn-outline-info float-right" onclick="getSinglChoice(this)" data-id="${(singleChoice.TESTID)!''}" id="bottom-modify-${(singleChoice.TESTID)!''}">修改</a>-->

                           <#--<hr>-->
                        <#--</#list>-->
                    <#--</#if>-->
                                                    <#--</div>-->
                                                <#--</div>-->
                                            <#--&lt;#&ndash;填空题&ndash;&gt;-->
                                            <#--&lt;#&ndash;<div class="card">&ndash;&gt;-->
                                            <#--&lt;#&ndash;<div class="card-header">&ndash;&gt;-->
                                            <#--&lt;#&ndash;填空题&ndash;&gt;-->
                                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                                            <#--&lt;#&ndash;<div class="card-body">&ndash;&gt;-->
                                            <#--&lt;#&ndash;<h5 class="card-title">！富文本实现</h5>&ndash;&gt;-->
                                            <#--&lt;#&ndash;<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>&ndash;&gt;-->
                                            <#--&lt;#&ndash;<a href="#" class="btn btn-primary">Go somewhere</a>&ndash;&gt;-->
                                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                                            <#--&lt;#&ndash;判断题&ndash;&gt;-->
                                                <#--<div class="card">-->
                                                    <#--<div class="card-header">-->
                                                        <#--判断题-->
                                                    <#--</div>-->
                                                    <#--<div class="card-body">-->
                                                        <#--<table class="table">-->
                                                            <#--<thead>-->
                                                            <#--<tr>-->
                                                                <#--<th scope="col" width="15%">（100分）</th>-->
                                                                <#--<th scope="col" width="65%">请选择对错</th>-->
                                                                <#--<th scope="col" width="20%">每题/5分</th>-->

                                                            <#--</tr>-->
                                                            <#--</thead>-->
                                                            <#--<tbody>-->
                        <#--<#if trueOrFalses??>-->
                        <#--<#assign i = 0>-->
                            <#--<#list trueOrFalses as trueOrFalse>-->
                                <#--<#assign i = i+1>-->
                                 <#--<tr>-->
                                     <#--<th scope="row">${i}</th>-->
                                     <#--<td>${(trueOrFalse.DESCRPTION)!''}</td>-->
                                     <#--<td>-->

                                         <#--<div class="form-check form-check-inline">-->
                                             <#--<input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" onclick="answerTuerOrFalse(this)" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="1">-->
                                             <#--<label class="form-check-label" for="inlineRadio1">对</label>-->
                                         <#--</div>-->
                                         <#--<div class="form-check form-check-inline">-->
                                             <#--<input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" onclick="answerTuerOrFalse(this)" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="0">-->
                                             <#--<label class="form-check-label" for="inlineRadio2">错</label>-->
                                         <#--</div>-->
                                         <#--<a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-delete-${(trueOrFalse.TESTID)!''}">删除</a>-->
                                         <#--<a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-modify-${(trueOrFalse.TESTID)!''}">修改</a>-->

                                     <#--</td>-->
                                 <#--</tr>-->


                            <#--</#list>-->
                        <#--</#if>-->

                                                            <#--</tbody>-->
                                                        <#--</table>-->
                                                    <#--</div>-->
                                                <#--</div>-->
                                            <#--&lt;#&ndash;主观题&ndash;&gt;-->
                                                <#--<div class="card">-->
                                                    <#--<div class="card-header">-->
                                                        <#--主观题-->
                                                    <#--</div>-->
                                                    <#--<div class="card-body">-->
                                                        <#--<form>-->
                        <#--<#assign i=0>-->
                        <#--<#if subjectives??>-->
                            <#--<#list subjectives as subjective >-->
                                <#--<#assign i=i+1>-->
                                <#--<div class="form-group">-->
                                    <#--<label for="exampleInputEmail1" style="font-size: 20px;"><span>${i}.</span>${(subjective.DESCRPTION)!''}</label>-->
                                    <#--<textarea type="text" class="form-control" onblur="answerSubjective(this)" data-id="${(subjective.TESTID)!}"  id="test-${(subjective.TESTID)!}" >${(subjective.ANSWER)!''}</textarea>-->
                                    <#--<a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-delete-${(subjective.TESTID)!''}">删除</a>-->
                                    <#--<a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-modify-${(subjective.TESTID)!''}">修改</a>-->

                                <#--</div>-->
                            <#--</#list>-->
                        <#--</#if>-->
                                                            <#--<br>-->
                                                        <#--</form>-->
                                                    <#--</div>-->
                                                <#--</div>-->

                                            <#--</div>-->
                                            <#--&lt;#&ndash;right&ndash;&gt;-->
                                                <#--<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 p-5">-->
                                                    <#--选择题：-->
                                                    <#--<br>-->
                                                    <#--<div class="btn-group" role="group">-->
                <#--<#if singleChoices?? &&(singleChoices?size >0) >-->
                    <#--<#assign i=   1>-->
                    <#--<#list singleChoices as singleChoice>-->
                        <#--<button onclick="getFocus(this)" id="btn-${(singleChoice.TESTID)!}" data-id="${(singleChoice.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i}</span></button>-->
                        <#--<#assign i= i+  1>-->
                    <#--</#list>-->
                <#--</#if>-->

                                                    <#--</div>-->
                                                    <#--<br>判断题：-->
                                                    <#--<br>-->
                                                    <#--<div class="btn-group" role="group" aria-label="First group">-->
                  <#--<#if trueOrFalses?? && (trueOrFalses?size >0)>-->
                         <#--<#assign i=  1>-->
                    <#--<#list trueOrFalses as trueOrFalse>-->
                        <#--<button onclick="getFocus(this)" id="btn-${(trueOrFalse.TESTID)!}" data-id="${(trueOrFalse.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i}</span></button>-->
                        <#--<#assign i= i+  1>-->
                    <#--</#list>-->
                  <#--</#if>-->
                                                    <#--</div>-->
                                                    <#--<br>主观题：-->
                                                    <#--<br>-->
                                                    <#--<div class="btn-group" role="group" aria-label="First group">-->
              <#--<#if subjectives?? && (subjectives?size >0) >-->
                       <#--<#assign i=   1>-->
                    <#--<#list subjectives as subjective>-->
                        <#--<button onclick="getFocus(this)" id="btn-${(subjective.TESTID)!}" data-id="${(subjective.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i} </span></button>-->
                        <#--<#assign i= i+  1>-->
                    <#--</#list>-->
              <#--</#if>-->
                                                    <#--</div>-->
                                                <#--</div>-->
                                        <#--</div>-->

                                <#--</div>-->
                                <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                   <#--评论区-->
                                    <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">

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
                                                             <button type="button" class="btn btn-success btn-comment" onclick="post2()">回复</button>
                                                         </div>
                                                     </div>
                                                 </div>

                                             </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

        </div>

    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../footer.ftl">
</div>
<#--//弹出框-->

<#--//弹出框-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <iframe src="/upload/class/${(catalogue.URL)!''}" style="width: 120%;height: 600px;"></iframe>
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

<script type="text/javascript">


    function getSinglChoice(e) {
        var  testId = e.getAttribute("data-id");
        $("#form_true_or_false").hide();
        $("#form_subjective").hide();
        $("#form_single_choice").show();
        getTest(testId,2);
    }

    function getTrueOrFalse(e) {
        var  testId = e.getAttribute("data-id");
        $("#form_single_choice").hide();
        $("#form_subjective").hide();
        $("#form_true_or_false").show();

        getTest(testId,3);

    }
    function getSubjective(e) {
        var  testId = e.getAttribute("data-id");
        $("#form_single_choice").hide();
        $("#form_subjective").show();
        $("#form_true_or_false").hide();
        getTest(testId,1);
    }

    function  getTest(testId,type) {
        $('#exampleModal').modal("toggle");
        $.ajax({
            type: 'post',
            url: '/test/getTest',
            data:{
                'testId':testId,
                'type':type
            },
            success:function (data) {
                var success = data.success;
                if (success){
                    if (type == 2){
                        // 选择
                        var description = $("#2_DESCRIPTION");
                        var answer = $("#2_ANSWER");
                        var a = $("#a");
                        var b = $("#b");
                        var c = $("#c");
                        var d = $("#d");
                        a.attr("value",data.a);
                        b.attr("value",data.b);
                        c.attr("value",data.c);
                        d.attr("value",data.d);
                        description.attr("value",data.description);
                        answer.attr("value",data.answer);
                        $("#TESTID2").val(data.testId);
                        $("#CATALOGUEID2").val(data.catalogueId);
                        $("#2_SCORE").find("option[text=data.SCORE]").attr("selected",true);

                    } else if (type == 3){
                        // 判断
                        var description = $("#3_DESCRIPTION");
                        var answer = $("#3_ANSWER");
                        var a_ture = $("#inlineRadio1_true");
                        var a_false = $("#inlineRadio_false");
                        description.val(data.description);
                        answer.attr("value",data.answer);
                        $("#CATALOGUEID3").val(data.catalogueId);
                        if (data.answer) {
                            a_ture.prop("checked",'checked');
                        }else {
                            a_false.prop("checked",'checked');
                        }
                        $("#TESTID3").val(data.testId);
                        $("#3_SCORE").find("option[text=data.SCORE]").attr("selected",true);


                    } else if (type ==1) {
                        // 主观题
                        var description = $("#1_DESCRIPTION");
                        var answer = $("#1_ANSWER");
                        description.val(data.description);
                        answer.val(data.answer);
                        $("#TESTID1").val(data.testId);
                        $("#CATALOGUEID1").val(data.catalogueId);
                        $("#1_SCORE").find("option[text=data.SCORE]").attr("selected",true);

                    }
                }else {
                    alert(data.message);
                }

            }

        });

    }

    // // 选择题
    // function  answerSingleChoice(e) {
    //     var testId = e.getAttribute("data-id");
    //     var answer = $("#testline-" + testId).val();
    //     doAnswer(testId,2,answer);
    // }
    // // 判断题
    // function  answerTuerOrFalse(e) {
    //     var testId = e.getAttribute("data-id");
    //     var answer = $("#test-" + testId).val();
    //     doAnswer(testId,3,answer);
    // }
    // // 主观题
    // function  answerSubjective(e) {
    //     var testId = e.getAttribute("data-id");
    //     var answer = $("#test-" + testId).val();
    //     doAnswer(testId,1,answer);
    // }
    //
    //
    // function doAnswer(testId, type, answer) {
    //
    //     $.ajax({
    //         url:"/test/doAnswer",
    //         type:"post",
    //         data:{
    //             "testId":testId,
    //             "type": type,
    //             "answer": answer
    //         },
    //         success:function (data) {
    //             //将右边的答题卡改变颜色
    //             var btn = $("#btn-"+testId);
    //             if (data.success){
    //                 // btn.removeClass();
    //                 btn.addClass("btn-primary");
    //             }
    //         }
    //
    //     });
    //
    // }
    // 获取焦点
    function getFocus(e) {

        var testId = e.getAttribute("data-id");
        var dom = $("#test-"+testId);
        // dom.focus();
        // 如果之前当前元素为隐藏或者未被创建，则需要延时。
        if (dom.val() != null || dom.val() !="") {
            setTimeout(function(){
                dom.focus();
            },50)
        }
    }


</script>
</body>
</html>