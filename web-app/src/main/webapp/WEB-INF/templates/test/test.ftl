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
                                     <td>${(trueOrFalse.DESCRPTION)!''}</td>
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
                                    <textarea type="text" class="form-control" onblur="answerSubjective(this)" data-id="${(subjective.TESTID)!}"  id="test-${(subjective.TESTID)!}" >${(subjective.ANSWER)!''}</textarea>
                                    <a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-delete-${(subjective.TESTID)!''}">删除</a>
                                    <a class="btn btn-outline-info float-right" onclick="getSubjective(this)" data-id="${(subjective.TESTID)!''}" id="bottom-modify-${(subjective.TESTID)!''}">修改</a>

                                </div>
                            </#list>
                        </#if>
                        <br>
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
<#--//弹出框-->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">修改考题</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <#--选择题-->
                    <form id="form_single_choice" method="post" action="updateTest">
                        <div class="form-group">
                            <label for="CATALOGUEID2"></label>
                            <input type="text" class="form-control" name="CATALOGUEID" id="CATALOGUEID2"  value="${(id)!''}">
                        </div>
                        <div class="form-group">
                            <label for="TESTID2"></label>
                            <input type="text" class="form-control" name="TESTID" id="TESTID2"  >
                        </div>
                        <div class="form-group">
                            <label for="TYPE"></label>
                            <input type="text" class="form-control" name="TYPE" id="TYPE"  value="2">
                        </div>
                        <div class="form-group">
                            <label for="2_DESCRIPTION">请输入问题描述：</label>
                            <input type="text" class="form-control" id="2_DESCRIPTION" name="2_DESCRIPTION" >
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="a">选项A:</label>
                            <input type="text" class="form-control" id="a" name="a">
                        </div>
                        <div class="form-group">
                            <label for="b">选项B:</label>
                            <input type="text" class="form-control" id="b" name="b">
                        </div>
                        <div class="form-group">
                            <label for="c">选项C:</label>
                            <input type="text" class="form-control" id="c" name="c">
                        </div>
                        <div class="form-group">
                            <label for="d">选项D:</label>
                            <input type="text" class="form-control" id="d" name="d">
                        </div>
                        <div class="form-group">
                            <label for="2_ANSWER">答案(大写):</label>
                            <input type="text" class="form-control" id="2_ANSWER" name="2_ANSWER">
                        </div>
                        <button type="submit" class="btn btn-primary">保存</button>
                        <button type="reset" class="btn btn-primary">重置</button>
                    </form>
                <#--判断题-->
                    <form id="form_true_or_false" method="post" action="updateTest">
                        <div class="form-group">
                            <label for="CATALOGUEID3"></label>
                            <input type="text" class="form-control" name="CATALOGUEID" id="CATALOGUEID3"  value="${(id)!''}">
                        </div>
                        <div class="form-group">
                            <label for="TESTID3"></label>
                            <input type="text" class="form-control" name="TESTID" id="TESTID3"  >
                        </div>
                        <div class="form-group">
                            <label for="TYPE"></label>
                            <input type="text" class="form-control" name="TYPE" id="TYPE"  value="3">
                        </div>
                        <div class="form-group">
                            <label for="3_DESCRIPTION">请将你的问题填入下列区域中：</label>
                            <textarea class="form-control" id="3_DESCRIPTION" name="3_DESCRIPTION" ></textarea>
                        </div>
                        <p>请选择正确答案：</p>
                        <div class="form-check form-check-inline  ml-5">
                            <input class="form-check-input " type="radio" name="3_ANSWER" id="inlineRadio1_true" value="1">
                            <label class="form-check-label" for="inlineRadio1_true">对</label>
                        </div>
                        <div class="form-check form-check-inline ">
                            <input class="form-check-input" type="radio" name="3_ANSWER" id="inlineRadio_false" value="0">
                            <label class="form-check-label" for="inlineRadio_false">错</label>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-primary float-right mr-3">保存</button>
                        <button type="reset" class="btn btn-primary float-right mr-3">重置</button>
                    </form>
                <#--主观题-->
                    <form id="form_subjective">
                        <div class="form-group">
                            <label for="CATALOGUEID1"></label>
                            <input type="text" class="form-control" name="CATALOGUEID" id="CATALOGUEID1"  value="${(id)!''}">
                        </div>
                        <div class="form-group">
                            <label for="TESTID"></label>
                            <input type="text" class="form-control" name="TESTID" id="TESTID1"  >
                        </div>
                        <div class="form-group">
                            <label for="TYPE"></label>
                            <input type="text" class="form-control" name="TYPE" id="TYPE"  value="1">
                        </div>
                        <div class="form-group">
                            <label for="1_DESCRIPTION">请将你的问题填入下列区域中：</label>
                            <textarea class="form-control" id="1_DESCRIPTION" name="1_DESCRIPTION" ></textarea>
                        </div>
                        <div class="form-group">
                            <label for="1_ANSWER">请将你的参考答案填入下列区域中：</label>
                            <textarea class="form-control" id="1_ANSWER" name="1_ANSWER" ></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">保存</button>
                        <button type="reset" class="btn btn-primary">重置</button>
                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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


                  } else if (type ==1) {
                      // 主观题
                      var description = $("#1_DESCRIPTION");
                      var answer = $("#1_ANSWER");
                      description.val(data.description);
                      answer.val(data.answer);
                      $("#TESTID1").val(data.testId);
                      $("#CATALOGUEID1").val(data.catalogueId);

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