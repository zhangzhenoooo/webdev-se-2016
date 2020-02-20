<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>测试</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
        <#--选择题-->
            <div class="card">
                <div class="card-header">
                    选择题
                </div>
                <div class="card-body">
                    <#assign  string = "ABCDEFGH">
                     <#assign  x=1>
                    <#if singleChoices?? && (singleChoices?size >0)>
                        <#list  singleChoices as singleChoice>
                        <#--题目描述-->
                             <h5 class="card-title"><span>${(x)}.</span>${(singleChoice.DESCRPTION)!''}<span class="float-right">(5分)</span></h5>
                            <#if singleChoicelines?? &&(singleChoicelines?size >0) >
                                <#assign  i = 0>
                                <#list singleChoicelines as singleChoiceline>
                                    <#if singleChoice.TESTID == singleChoiceline.TESTID  >
                                    <#--选项：-->
                                  <p class="card-text ml-3">
                                      <input  type="radio" class="form-check-input" onclick="answerSingleChoice(this)"  name="testline-${(singleChoice.TESTID)!}" data-id="${(singleChoice.TESTID)!}" id="testline-${(singleChoice.TESTID)!}" value="${(string[i])}">
                                      <span> ${(string[i])}.&nbsp;&nbsp;</span>${(singleChoiceline.DESCRIPTION)!''}</p>
                                        <#assign  i = i+1>
                                    </#if>
                                </#list>
                            </#if>
                            <#assign x = x +1>
                             <a class="btn btn-outline-info float-right" onclick="getSinglChoice(this)" data-id="${(singleChoice.TESTID)!''}" id="bottom-delete-${(singleChoice.TESTID)!''}">删除</a>
                             <a class="btn btn-outline-info float-right" onclick="getSinglChoice(this)" data-id="${(singleChoice.TESTID)!''}" id="bottom-modify-${(singleChoice.TESTID)!''}">修改</a>

                           <hr>
                        </#list>
                    </#if>
                </div>
            </div>
        <#--填空题-->
        <#--<div class="card">-->
        <#--<div class="card-header">-->
        <#--填空题-->
        <#--</div>-->
        <#--<div class="card-body">-->
        <#--<h5 class="card-title">！富文本实现</h5>-->
        <#--<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>-->
        <#--<a href="#" class="btn btn-primary">Go somewhere</a>-->
        <#--</div>-->
        <#--</div>-->
        <#--判断题-->
            <div class="card">
                <div class="card-header">
                    判断题
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" width="10%">（100分）</th>
                            <th scope="col" width="70%">请选择对错</th>
                            <th scope="col" width="20%">每题/5分</th>

                        </tr>
                        </thead>
                        <tbody>
                        <#if trueOrFalses??>
                        <#assign i = 0>
                            <#list trueOrFalses as trueOrFalse>
                                <#assign i = i+1>
                                 <tr>
                                     <th scope="row">${i}</th>
                                     <td>${(trueOrFalse.DESCRIPTOPN)!''}</td>
                                     <td>

                                         <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" onclick="answerTuerOrFalse(this)" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="1">
                                             <label class="form-check-label" for="inlineRadio1">对</label>
                                         </div>
                                         <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" onclick="answerTuerOrFalse(this)" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="0">
                                             <label class="form-check-label" for="inlineRadio2">错</label>
                                         </div>
                                         <a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-delete-${(trueOrFalse.TESTID)!''}">删除</a>
                                         <a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-modify-${(trueOrFalse.TESTID)!''}">修改</a>

                                     </td>
                               </tr>


                            </#list>
                        </#if>

                        </tbody>
                    </table>
                </div>
            </div>
        <#--主观题-->
            <div class="card">
                <div class="card-header">
                    主观题
                </div>
                <div class="card-body">
                    <form>
                        <#assign i=0>
                        <#if subjectives??>
                            <#list subjectives as subjective >
                                <#assign i=i+1>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" style="font-size: 20px;"><span>${i}.</span>${(subjective.DESCRPTION)!''}</label>
                                    <textarea type="text" class="form-control" onblur="answerSubjective(this)" data-id="${(subjective.TESTID)!}"  id="test-${(subjective.TESTID)!}" ></textarea>
                                    <a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-delete-${(subjective.TESTID)!''}">删除</a>
                                    <a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-modify-${(subjective.TESTID)!''}">修改</a>

                                </div>
                            </#list>
                        </#if>
                        <br>
                        <button type="submit" class="btn btn-primary float-right mt-5">交卷</button>
                    </form>
                </div>
            </div>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 p-5">
            选择题：
            <br>
            <div class="btn-group" role="group">
                <#if singleChoices?? &&(singleChoices?size >0) >
                    <#assign i=   1>
                    <#list singleChoices as singleChoice>
                        <button onclick="getFocus(this)" id="btn-${(singleChoice.TESTID)!}" data-id="${(singleChoice.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i}</span></button>
                        <#assign i= i+  1>
                    </#list>
                </#if>

            </div>
            <br>判断题：
            <br>
            <div class="btn-group" role="group" aria-label="First group">
                  <#if trueOrFalses?? && (trueOrFalses?size >0)>
                         <#assign i=  1>
                    <#list trueOrFalses as trueOrFalse>
                        <button onclick="getFocus(this)" id="btn-${(trueOrFalse.TESTID)!}" data-id="${(trueOrFalse.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i}</span></button>
                        <#assign i= i+  1>
                    </#list>
                  </#if>
            </div>
            <br>主观题：
            <br>
            <div class="btn-group" role="group" aria-label="First group">
              <#if subjectives?? && (subjectives?size >0) >
                       <#assign i=   1>
                    <#list subjectives as subjective>
                        <button onclick="getFocus(this)" id="btn-${(subjective.TESTID)!}" data-id="${(subjective.TESTID)!}" type="button" class="btn btn-outline-info "><span>${i} </span></button>
                        <#assign i= i+  1>
                    </#list>
              </#if>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../footer.ftl">
</div>

<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script type="text/javascript">

    // 选择题
    function  answerSingleChoice(e) {
        var testId = e.getAttribute("data-id");
        var answer = $("#testline-" + testId).val();
        doAnswer(testId,2,answer);
    }
    // 判断题
    function  answerTuerOrFalse(e) {
        var testId = e.getAttribute("data-id");
        var answer = $("#test-" + testId).val();
        doAnswer(testId,3,answer);
    }
    // 主观题
    function  answerSubjective(e) {
        var testId = e.getAttribute("data-id");
        var answer = $("#test-" + testId).val();
        doAnswer(testId,1,answer);
    }


    function doAnswer(testId, type, answer) {

        $.ajax({
            url:"/test/doAnswer",
            type:"post",
            data:{
                "testId":testId,
                "type": type,
                "answer": answer
            },
            success:function (data) {
                //将右边的答题卡改变颜色
                var btn = $("#btn-"+testId);
                if (data.success){
                    // btn.removeClass();
                    btn.addClass("btn-primary");
                }
            }

        });

    }
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