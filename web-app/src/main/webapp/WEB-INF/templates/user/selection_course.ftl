<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>选课</title>
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
            <table class="table">
                <h3 style="color: red;">${(message)!''}</h3>
                <thead>
                <tr>
                    <th scope="col" width="5%">#</th>
                    <th scope="col" width="20%">课程名称</th>
                    <th scope="col" width="60%">课程描述</th>
                    <th scope="col" width="10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <#assign  i=0>
                <#list paginate.list! as course>
                    <#assign  i=i+1>
                <tr>
                    <th scope="row">${(i)!}</th>
                    <td>
                        <a href="/class/courseMes?id=${(course.CLASSID)!''}">${(course.TITLE)!''}</a>
                    </td>
                    <td>
                        <span style=" display :inline-block ;width: 100%;height: 20px;overflow: hidden;textOverflow: ellipsis;whiteSpace: nowrap" title=${(course.DESCRIPTION)!''} >${(course.DESCRIPTION)!''}</span>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="doSelect?id=${(course.CLASSID)!} ">选课</a>
                    </td>
                </tr>
                </#list>
                </tbody>

            </table>
            <hr>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="card-header">
                    已选课程
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <#if selectedUserClasses?? && (selectedUserClasses?size >0)>
                                <#list selectedUserClasses as selectedUserClasse>
                                     <li class="list-group-item">
                                        <a href="classMes?id=${(selectedUserClasse.CLASSID)!''}">${(selectedUserClasse.CLASSNAME)!''}</a>
                                         <button type="button" class="btn btn-danger float-right"><a href="/user/deleteSelectedClass?id=${(course.CLASSID)!}" style="color: white;">移除</a> </button>

                                     </li>
                                </#list>
                        </#if>
                    </ul>
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