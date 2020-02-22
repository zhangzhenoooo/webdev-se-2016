<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学习</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row  p-5">
        <#--轮播：热门课程-->
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shadow-sm p-3 mb-5 bg-white rounded" >
             <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                     <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                     <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                     <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                 </ol>
                 <div class="carousel-inner">
                     <#assign  i = 1>
                     <#if hotCourses?? && (hotCourses?size > 0)>
                     <#list hotCourses as hotCours>
                     <#if i==4 >
                         <#break >
                     </#if>
                              <div class="carousel-item <#if i == 1>active</#if>">
                                  <img height="500px" src="/upload/class/${(hotCours.HEAD)!'default_class_picture.jpg'}" class="d-block w-100" alt="...">
                                  <div class="carousel-caption d-none d-md-block">
                                      <h5>${(hotCours.TITLE)!''}</h5>
                                      <p>
                                          <span style=" display :inline-block ;width: 100%;height: 20px;overflow: hidden;textOverflow: ellipsis;whiteSpace: nowrap" title=${(hotCours.DESCRIPTION)!''} >${(hotCours.DESCRIPTION)!''}</span>
                                      </p>
                                  </div>
                              </div>
                         <#assign  i = i+1>
                     </#list>
                     </#if>
                 </div>
                 <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                 </a>
                 <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                 </a>
             </div>
         </div>
         <#--全部课程-->

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 card pt-2" >
                <h3>全部课程</h3>

                <div class="row">
                    <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                        <#if allCourses ?? && (allCourses?size > 0 ) >
                        <#list  allCourses as  allCourse >
                          <div class="row no-gutters m-3">
                              <div class="col-md-3">
                                  <img src="/upload/class/${(allCourse.HEAD)!'default_class_picture.jpg'}" height="200px;" class="card-img-top" alt="...">
                              </div>
                              <div class="col-md-6">
                                  <div class="card-body">
                                      <h5 class="card-title"><a href="/class/classMes?id=${(allCourse.CLASSID)!''}">${(allCourse.TITLE)!''}</a> </h5>
                                      <p class="card-text">课程介绍：${(allCourse.DESCRIPTION)!''}</p>
                                      <#--<p class="card-text"><small class="text-muted"><span>主讲老师：</span></small></p>-->
                                  </div>
                              </div>
                          </div>
                                    <hr>
                        </#list>
                        </#if>
                    </div>

            </div>

    </div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>