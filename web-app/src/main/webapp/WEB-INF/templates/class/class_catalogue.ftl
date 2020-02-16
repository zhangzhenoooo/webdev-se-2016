<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课的章节</title>
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
               <div class="row">
                   <#--top-->
                       <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 " style="max-height: 300px;min-height: 250px;">
                           <div class="row no-gutters">
                               <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                   <img src="/upload/class/lol英雄联盟银白审判凯尔4k壁纸_彼岸图网.jpg" class="card-img" alt="...">
                               </div>
                               <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                   <div class="card-body">
                                       <#--课程名称-->
                                       <h5 class="card-title">${(course.TITLE)!'还没想好题目'}</h5>
                                       <p>简介：</p>
                                       <p class="card-text">${(course.DESCRIPTION)!'老师还没有更新题目'}</p>
                                       <p class="card-text"><small class="text-muted">开始时间：<span>${(course.GMT_CREATED)!''}</span></small></p>
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
                            第几章：第一小节：<svg class="bi bi-list-stark text-success" width="32" height="32" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"></svg>
                        </div>
                        <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12 " >
                            <blockquote class="blockquote mb-0">
                                <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                                <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                                    <ul class="list-group list-group-flush overflow-hidden" style="max-height: 600px;min-height: 400px;">
                                        <#list catalogues as catalogue>
                                                   <li class="list-group-item">${(catalogue.TITLE)!'为命名'}</li>
                                        </#list>

                                        <#--<li class="list-group-item">第二章：Dapibus ac facilisis in</li>-->
                                        <#--<li class="list-group-item">第三章：Morbi leo risus</li>-->
                                        <#--<li class="list-group-item">第四章：Porta ac consectetur ac</li>-->
                                        <#--<li class="list-group-item">第五章：Vestibulum at eros</li>-->
                                    </ul>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">Next</a>
                                            </li>
                                        </ul>
                                    </nav>
                            </blockquote>
                        </div>
                    </div>
            </div>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">
            <div class="row p-2">
            <#--最新动态-->
                <h3>最新动态</h3>
                <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <blockquote class="blockquote mb-0">
                    <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                    <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                        <ul class="list-group list-group-flush ">
                        <#--10 pis-->
                            <li class="list-group-item">第一章 ：Cras justo odio</li>
                            <li class="list-group-item">第二章：Dapibus ac facilisis in</li>
                            <li class="list-group-item">第三章：Morbi leo risus</li>
                            <li class="list-group-item">第四章：Porta ac consectetur ac</li>
                            <li class="list-group-item">第五章：Vestibulum at eros</li>
                        </ul>
                    </blockquote>
                </div>
            </div>
            <div class="row mt-5">
                <div class="card col-lg-12 col-md-12 col-sm-12 col-xs-12" style="max-height: 600px;min-height: 400px;">
                    <div class="card-header">
                        课后习题
                    </div>
                    <div class="card-body col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <blockquote class="blockquote mb-0">
                        <#--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>-->
                        <#--<footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>-->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">第一章 ：Cras justo odio</li>
                                <li class="list-group-item">第二章：Dapibus ac facilisis in</li>
                                <li class="list-group-item">第三章：Morbi leo risus</li>
                                <li class="list-group-item">第四章：Porta ac consectetur ac</li>
                                <li class="list-group-item">第五章：Vestibulum at eros</li>
                            </ul>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </blockquote>
                    </div>
                </div>
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