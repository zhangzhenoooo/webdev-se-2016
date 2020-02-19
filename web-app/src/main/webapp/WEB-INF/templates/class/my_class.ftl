<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的课程</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
    <style>
        .myfigure-img{
            height: 400px;
            /*width: 80%;*/
            /*margin-left: 2%;*/
            /*margin-right: 2%;*/
        }
        .mycarousel{
            padding-left: 10%;
            padding-right: 10%;
            /*padding-top:5%;*/
            /*padding-bottom:5%;*/
            /*background-color: lightgray;*/
        }
    </style>
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mycarousel">
            <br>
        <#--轮播-->
            <div id="carouselExampleCaptions" class="carousel slide " data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/upload/class/404少女前线4k动漫壁纸_彼岸图网.jpg" class="d-block w-100 myfigure-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>今日热门：java基础</h5>
                            <p>Java 是世界上最好的语言.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/upload/class/lol英雄联盟银白审判凯尔4k壁纸_彼岸图网.jpg" class="d-block w-100 myfigure-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>今日热门：PHP基础</h5>
                            <p>PHP 是世界上最好的语言.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/upload/class/2020新年%20女孩子%20和服%20黑发%20.jpg" class="d-block w-100 myfigure-img" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>今日热门：C语言 基础</h5>
                            <p>C  是世界上最好的语言.</p>
                        </div>
                    </div>
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

        <#--下半部分-->
            <hr >
            <div class="row" >
                <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                    <h3>我的课程：</h3>
                    <table class="table table-striped" id="myClassTable">
                        <thead>
                        <tr>
                            <th scope="col" width="5%">#</th>
                            <th scope="col" width="20%">课程名称</th>
                            <th scope="col" width="50%">课程描述</th>
                            <th scope="col" width="25%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#assign i=0>
                        <#--序号-->
                        <#list courses! as course >
                            <#assign i=i+1>
                               <tr>
                                   <th scope="row">${i}</th>
                                   <td><a href="classMes?id=${(course.CLASSID)!''}" >${(course.TITLE)!''}</a></td>
                                   <td>${(course.DESCRIPTION)!''}</td>
                                   <td>
                                       <button type="button" class="btn btn-success"><a href="addcatalogue?id=${(course.CLASSID)!}" style="color: white;">更新课件</a> </button>
                                       <#--<button type="button" class="btn btn-danger"><a href="delete">删除</a> </button>-->
                                   </td>
                               </tr>
                        </#list>

                        </tbody>
                    </table>
                    <hr>
                    <div class="card">
                        <div class="card-header">
                           <h3>最新消息:显示那些课程都有那些学生回答了测试：今天的</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                    <h3>热门课程：</h3>
                </div>

            </div>

        </div>
    </div>


</div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "../footer.ftl">
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
/<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>