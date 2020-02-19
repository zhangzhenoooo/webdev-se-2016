<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <#if courses?? && (courses?size >0)>
                <#assign x = 0>
                <#list courses as course>
                    <#assign x = x+1>
                          <div class="card"    >
                              <div class="card-header" data-id="${(course.CLASSID)!''}" id="course-${(course.CLASSID)!''}"   onclick="collapseComments(this)">
                                  <h3><span>${x}.&nbsp;</span>${(course.TITLE)}</h3>
                              </div>
                              <div class="card-body" data-id="table-${(course.CLASSID)!''}" id="table-${(course.CLASSID)!''}">

                                  <table class="table table-hover">
                                      <thead>
                                      <tr>
                                          <th scope="col">#</th>
                                          <th scope="col">学生姓名</th>
                                          <th scope="col">加入时间</th>
                                          <th scope="col">操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <#if userClasses?? && (userClasses?size >0)>
                                      <#assign i = 0>
                                          <#list  userClasses as userClasse>
                                          <#if course.CLASSID ==userClasse.CLASSID  >
                                              <#assign i = i+1>
                                                <tr>
                                                    <th scope="row">${(1)!''}</th>
                                                    <td>${(userClasse.USERNAME)!''}</td>
                                                    <td>${(userClasse.GMT_CREATED)!''}</td>
                                                    <td>
                                                        <a class="btn btn-primary" href="#" role="button">详情</a>
                                                        <a class="btn btn-primary" href="#" role="button">删除</a>
                                                    </td>
                                                </tr>
                                          </#if>
                                              <#assign i = 0>
                                          </#list>
                                      </#if>
                                      </tbody>
                                  </table>
                                  <hr>
                              </div>
                          </div>
                </#list>
            </#if>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">

        </div>
    </div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script type="text/javascript">

          function  collapseComments(e) {
              var id = e.getAttribute("data-id");
              var table = $("#table-" + id);
              table.toggle();
          }

</script>
</body>
</html>