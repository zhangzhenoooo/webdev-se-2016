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
               <div class="row pl-5 pr-5">
                   <#--top-->
                       <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 ">
                           <div class="row no-gutters">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                   <img  style="height: 80%;width: 80%;" src="/upload/class/${(course.HEAD)!}" class="card-img" alt="...">
                               <#--//保存课程章节的id-->
                                   <input type="hidden" id="classId" value="${(catalogue. CATALOUGEID)!''}">
                               </div>
                               <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                   <div class="card-body">
                                       <#--课程名称-->
                                       <h5 class="card-title">${(catalogue.TITLE)!'还没想好题目'}</h5>
                                       <p>简介：</p>
                                       <p class="card-text">${(catalogue.DESCRIPTION)!''}</p>
                                       <p class="card-text"><small class="text-muted">更新时间：<span>   ${(course.catalogue.GMT_CTRATED?number?number_to_datetime?string("yyyy-MM-dd"))!}</span></small></p>
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
                            <a class="float-right ml-5" href="/user/test?id=${(catalogue.CATALOUGEID)!'/'}">课后测试</a>
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