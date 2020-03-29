
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加测试</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 p-5 card">
            <h2>课程题目：</h2>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">选择题</a>
                </li>
                <#--<li class="nav-item">-->
                    <#--<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">填空题</a>-->
                <#--</li>-->
                <li class="nav-item">
                    <a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages" role="tab" aria-controls="messages" aria-selected="false">判断题</a>
                </li>
                <#--<li class="nav-item">-->
                    <#--<a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">主观题</a>-->
                <#--</li>-->
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
            <#--1-->
                <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="content" role="tabpanel" aria-labelledby="btn_single_choice"  id="single_choice">
                        <form id="form_single_choice" method="post" action="doAddTest">
                            <div class="form-group">
                                <label for="CATALOGUEID"></label>
                                <input type="hidden" class="form-control" name="CATALOGUEID" id="CATALOGUEID"  value="${(id)!''}">
                            </div>
                            <div class="form-group">
                                <label for="TYPE"></label>
                                <input type="hidden" class="form-control" name="TYPE" id="TYPE"  value="2">
                            </div>
                            <div class="form-group ">
                                <label for="2_SCORE">选项分值：</label>
                                <select class="form-control " id="2_SCORE" name="2_SCORE">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option selected>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                </select>
                            </div>
                                <div class="form-group ">
                                    <label for="2_DESCRIPTION">请输入问题描述：</label>
                                    <input type="text" class="form-control" id="2_DESCRIPTION" name="2_DESCRIPTION" >
                                </div>

                            <div class="form-group ">
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
                                <label for="2_ANSWER">选择正确答案:</label>
                                <select class="form-control " id="2_ANSWER" name="2_ANSWER">
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">保存</button>
                            <button type="reset" class="btn btn-primary">重置</button>
                        </form>
                    </div>
                </div>
            <#--2-->
                <#--<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">-->
                    <#--<div class="content"  aria-labelledby="btn_gap-filling" id="gap-filling">-->

                        <#--<form id="form_gap-filling">-->
                            <#--<div class="form-group">-->
                                <#--<label for="CATALOGUEID"></label>-->
                                <#--<input type="hidden" class="form-control" name="CATALOGUEID" id="CATALOGUEID"  value="${(id)!''}">-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="TYPE"></label>-->
                                <#--<input type="hidden" class="form-control" name="TYPE" id="TYPE"  value="0">-->
                            <#--</div>-->

                            <#--<div class="form-group">-->
                                <#--<label for="0_DESCRIPTION">请将你的问题填入下列区域中：</label>-->
                                <#--<textarea class="form-control" id="0_DESCRIPTION" name="0_DESCRIPTION" ></textarea>-->
                            <#--</div>-->
                            <#--<button type="submit" class="btn btn-primary">保存</button>-->
                            <#--<button type="reset" class="btn btn-primary">重置</button>-->
                        <#--</form>-->
                    <#--</div>-->
                <#--</div>-->
            <#--3-->
                <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">
                    <div class="content"  aria-labelledby="btn_gap-filling" id="gap-true_or_false" id="true_or_false">

                        <form id="form_true_or_false" method="post" action="doAddTest">
                            <div class="form-group">
                                <label for="CATALOGUEID"></label>
                                <input type="hidden" class="form-control" name="CATALOGUEID" id="CATALOGUEID"  value="${(id)!''}">
                            </div>
                            <div class="form-group">
                                <label for="TYPE"></label>
                                <input type="hidden" class="form-control" name="TYPE" id="TYPE"  value="3">
                            </div>
                            <div class="form-group ">
                                <label for="3_SCORE">选项分值：</label>
                                <select class="form-control " id="3_SCORE" name="3_SCORE">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option selected>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                </select>
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
                    </div>
                </div>
            <#--&lt;#&ndash;4&ndash;&gt;主观题-->
                <#--<div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">-->
                    <#--<div class="content"  aria-labelledby="btn_gap-filling" id="gap-subjectivee" id="subjective">-->

                        <#--<form id="form_subjective">-->
                            <#--<div class="form-group">-->
                                <#--<label for="CATALOGUEID"></label>-->
                                <#--<input type="hidden" class="form-control" name="CATALOGUEID" id="CATALOGUEID"  value="${(id)!''}">-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="TYPE"></label>-->
                                <#--<input type="hidden" class="form-control" name="TYPE" id="TYPE"  value="1">-->
                            <#--</div>-->
                            <#--<div class="form-group ">-->
                                <#--<label for="1_SCORE">选项分值：</label>-->
                                <#--<select class="form-control " id="1_SCORE" name="1_SCORE">-->
                                    <#--<option>1</option>-->
                                    <#--<option>2</option>-->
                                    <#--<option>3</option>-->
                                    <#--<option>4</option>-->
                                    <#--<option selected>5</option>-->
                                    <#--<option>6</option>-->
                                    <#--<option>7</option>-->
                                    <#--<option>8</option>-->
                                    <#--<option>9</option>-->
                                    <#--<option>10</option>-->
                                <#--</select>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="1_DESCRIPTION">请将你的问题填入下列区域中：</label>-->
                                <#--<textarea class="form-control" id="1_DESCRIPTION" name="1_DESCRIPTION" ></textarea>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="1_ANSWER">请将你的参考答案填入下列区域中：</label>-->
                                <#--<textarea class="form-control" id="1_ANSWER" name="1_ANSWER" ></textarea>-->
                            <#--</div>-->
                            <#--<button type="submit" class="btn btn-primary">保存</button>-->
                            <#--<button type="reset" class="btn btn-primary">重置</button>-->
                        <#--</form>-->
                    <#--</div>-->
                <#--</div>-->
            </div>
        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <h3 class="care-title text-center">已添加</h3>
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                   选择题：
                    <span class="badge badge-primary badge-pill">${(singleChoices?size)!0}</span>
                </li>
                <#--<li class="list-group-item d-flex justify-content-between align-items-center">-->
                    <#--填空题：-->
                    <#--<span class="badge badge-primary badge-pill">${(gapFillings?size)!0}</span>-->
                <#--</li>-->
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  判断题：
                    <span class="badge badge-primary badge-pill">${(trueOrFalses?size)!0}</span>
                </li>
                <#--<li class="list-group-item d-flex justify-content-between align-items-center">-->
                    <#--主观题：-->
                    <#--<span class="badge badge-primary badge-pill">${(trueOrFalses?size)!0}</span>-->
                <#--</li>-->
            </ul>

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
<script>
    $(document).ready(function () {


    });

</script>
</body>
</html>