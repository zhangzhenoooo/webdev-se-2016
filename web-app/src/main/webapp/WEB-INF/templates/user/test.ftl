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
<input type="hidden" id="catalogueId" value="${(id)!''}">
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
        <#assign  isAnswed = 0>   <#--//用来判断是否已经回答过问题-->
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
                        <br>
                             <h5 class="card-title"><span>${(x)}.</span>${(singleChoice.DESCRPTION)!''}<span class="float-right">(<span>${(singleChoice.SCORE)!''}</span>分)</span></h5>
                            <#if singleChoicelines?? &&(singleChoicelines?size >0) >
                                <#assign  i = 0>
                                <#list singleChoicelines as singleChoiceline>
                                    <#if singleChoice.TESTID == singleChoiceline.TESTID  >
                                    <#--选项：-->
                                  <p class="card-text ml-3">
                                      <input  type="radio" class="form-check-input"  name="testline-${(singleChoice.TESTID)!}" data-id="${(singleChoiceline.TESTLINEID)!}" id="testline-${(singleChoiceline.TESTLINEID)!}" value="${(string[i])}"
                                        <#if  (((singleChoice.answer.SIGN)!0) != 1) >
                                              onclick="answerSingleChoice(this)"
                                            <#else >disabled
                                            <#if string[i] == singleChoice.answer.ANSWER >checked</#if>

                                        </#if> >
                                      <span> ${(string[i])}.&nbsp;&nbsp;</span>${(singleChoiceline.DESCRIPTION)!''}
                                  </p>
                                        <#assign  i = i+1>
                                    </#if>
                                </#list>
                            <#if  (((singleChoice.answer.SIGN)!0) == 1) >
                                  <p class="card-text ml-3 " style="color:red;">
                                       <#assign  isAnswed = 1>
                                          <#if singleChoice.ANSWER == singleChoice.answer.ANSWER ><span style="color: green">回答正确</span>
                                          <#else >
                                          <span style="columns: red;">
                                              正确答案是： <span>${(singleChoice.ANSWER)!''}</span>
                                          </span>
                                          </#if>

                                  </p>
                            </#if>
                            </#if>
                            <#assign x = x +1>
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

                        <#if trueOrFalses?? && (trueOrFalses?size >0)>
                        <#assign i = 0>
                          <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" width="15%">（<span>${trueOrFalses?size}</span>分）</th>
                            <th scope="col" width="65%">请选择对错</th>
                            <th scope="col" width="20%">每题/分</th>

                        </tr>
                        </thead>
                        <tbody>
                            <#list trueOrFalses as trueOrFalse>
                                <#assign i = i+1>
                                 <tr>
                                     <th scope="row">${i}</th>
                                     <td><span>${(trueOrFalse.SCORE)!''}</span>&nbsp;${(trueOrFalse.DESCRPTION)!''}</td>
                                     <td>

                                         <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="1"
                                               <#if  (((trueOrFalse.answer.SIGN)!0) != 1) >
                                              onclick="answerTuerOrFalse(this)"
                                               <#else >
                                               disabled
                                                    <#if '1' == trueOrFalse.answer.ANSWER >checked</#if>
                                               </#if> >
                                             <label class="form-check-label" for="inlineRadio1">对</label>
                                         </div>
                                         <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="test-${(trueOrFalse.TESTID)!}" data-id="${(trueOrFalse.TESTID)!}" id="test-${(trueOrFalse.TESTID)!}" value="0"
                                               <#if  (((trueOrFalse.answer.SIGN)!0) != 1) >
                                              onclick="answerTuerOrFalse(this)"
                                               <#else >
                                               disabled
                                                    <#if '0' == trueOrFalse.answer.ANSWER >checked</#if>
                                               </#if>>
                                             <label class="form-check-label" for="inlineRadio2">错</label>
                                         </div>
                                         <#--//显示答案-->
                                            <#if  (((trueOrFalse.answer.SIGN)!0) == 1) >
                                              <p class="card-text ml-3" style="color:red;">
                                                    <#assign  isAnswed = 1>
                                                     <#if ((trueOrFalse.ANSWER)!'0')== ((trueOrFalse.answer.ANSWER)!'1')>
                                                     <span style="color: green">回答正确</span>
                                                     <#else >
                                                     <span style="color: red;">
                                                         正确答案： <span>
                                                                        ${(((trueOrFalse.ANSWER)!'0') == '1')?string('对','错')}
                                                                    </span>
                                                     </span>
                                                     </#if>

                                              </p>
                                            </#if>
                                         <#--<a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-delete-${(trueOrFalse.TESTID)!''}">删除</a>-->
                                         <#--<a class="btn btn-outline-info float-right" onclick="getTrueOrFalse(this)" data-id="${(trueOrFalse.TESTID)!''}" id="bottom-modify-${(trueOrFalse.TESTID)!''}">修改</a>-->

                                     </td>
                               </tr>

                            </#list>
                        </tbody>
                          </table>
                        </#if>
                </div>
            </div>
        <#if isAnswed == 0 >
        <button  type="button" class="btn btn-primary float-right mt-5" id="btn-test-submit" onclick="submitTest()">交卷</button>
        </#if>
        <#--主观题-->
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
                                    <#--<label for="exampleInputEmail1" style="font-size: 20px;"><span>${i}.</span><span>${(subjective.SCORE)!''}</span>${(subjective.DESCRPTION)!''}</label>-->
                                    <#--<textarea type="text" class="form-control" rows="3"  data-id="${(subjective.TESTID)!}"  id="test-${(subjective.TESTID)!}"-->
                                      <#--<#if  (((subjective.answer.SIGN)!0) != 1) >-->
                                              <#--onclick="answerSubjective(this)"-->
                                      <#--<#else >disabled-->
                                      <#--</#if> >-->
                                        <#--<#if (((subjective.answer.SIGN)!0) == 1)>-->
                                             <#--${subjective.answer.ANSWER}-->
                                        <#--</#if>-->
                                    <#--</textarea>-->
                                    <#--&lt;#&ndash;显示答案&ndash;&gt;-->
                                     <#--<#if  ((subjective.answer.SIGN)!0) == 1  >-->
                                              <#--<p class="card-text ml-3" style="color:red;">-->
                                                    <#--<#assign  isAnswed = 1>-->
                                                  <#--参考答案： <span>${(subjective.ANSWER)!''}</span>-->
                                              <#--</p>-->
                                     <#--</#if>-->
                                <#--&lt;#&ndash;<a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-delete-${(subjective.TESTID)!''}">删除</a>&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-modify-${(subjective.TESTID)!''}">修改</a>&ndash;&gt;-->

                                <#--</div>-->
                            <#--</#list>-->
                        <#--</#if>-->
                        <#--<br>-->
                                <#--<#if isAnswed == 0 >-->
                                                <#--<button  type="button" class="btn btn-primary float-right mt-5" id="btn-test-submit" onclick="submitTest()">交卷</button>-->
                                <#--</#if>-->
                    <#--</form>-->
                <#--</div>-->
            <#--</div>-->

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
            <hr>
            <p> 总分数：<span>${(resoultOfTest.totalPoint)!0}</span> </p>
            <#if isAnswed == 1 >
                <#assign  point = (resoultOfTest.totalPoint * 0.6 )>
                <p>你的得分：<span <#if ( point > ((resoultOfTest.myScore)!0))> style="color: red" <#else > style="color: green" </#if> >
                    ${(resoultOfTest.myScore)!0}</span></p>
            </#if>

        </div>
    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../footer.ftl">
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script type="text/javascript">


    // 选择题
    function  answerSingleChoice(e) {
        var testId = e.getAttribute("data-id");
        var answer = $("#testline-" + testId).val();
        alert(answer);
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
                var btn = $("#btn-"+data.testId);
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

    //提交测试
    function submitTest(){
        var catalogueId = $("#catalogueId").val();
        alert("确认提交吗？要不要再检查一下？");
        $.ajax({
            url:'/test/testSubmit?catalogueId='+catalogueId,
            type:'get',
            data:{},
            success:function (data) {
                window.location.reload();
            }
        });
    }



</script>
</body>
</html>