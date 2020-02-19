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
                     <#assign  i = 0,x=1>
                    <#if singleChoices?? && (singleChoices?size >0)>
                   <#list  singleChoices as singleChoice>
                             <h5 class="card-title"><span>${x}</span>${(singleChoice.DESCRPTION)}</h5>
                       <#if singleChoicelines??>
                           <#list singleChoicelines as singleChoiceline>
                               <#if singleChoice.TESTID ==singleChoiceline.TESTID  >
                               <#--选项：-->
                                  <p class="card-text">  <input type="text" class="form-control" aria-label="Text input with radio button">
                                      <span> ${(string[i])}.</span>${(singleChoice.DESCRPTION2)}</p>
                               </#if>
                           </#list>
                       </#if>
                    <hr>
                       <#assign  i = i+1,x = x +1>
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
                            <th scope="col" width="75%">请选择对错</th>
                            <th scope="col" width="15%">每题/5分</th>

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
                                             <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                             <label class="form-check-label" for="inlineRadio1">对</label>
                                         </div>
                                         <div class="form-check form-check-inline">
                                             <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                             <label class="form-check-label" for="inlineRadio2">错</label>
                                         </div>
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
                                    <textarea type="text" class="form-control" id="exampleInputEmail1" ></textarea>
                                </div>
                            </#list>
                        </#if>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            计分板;
        </div>
    </div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>