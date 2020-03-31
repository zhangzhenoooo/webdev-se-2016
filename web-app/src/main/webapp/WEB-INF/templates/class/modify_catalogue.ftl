<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加章节信息</title>
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
            <h2>课程题目：${(course.TITLE)!''}</h2>
            <div class="card">
                <div class="card-header">
                    添加章节以及教学资源
                </div>
                <div class="card-body">
                    <form id="text" enctype="multipart/form-data" method="post">
                        <div class="form-group">
                            <input type="hidden" id="classId" name="classId" VALUE="${(course.CLASSID)!''}" >
                        </div>
                        <div class="form-group">
                            <input type="hidden" id="catalogueId" name="catalogueId" VALUE="${(catalogue.CATALOUGEID)!''}" >
                        </div>
                        <div class="form-group">
                            <label for="address">章节信息：</label>
                            <div class="row" id="address">
                                <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <select class="form-control" id="PARENT" name="PARENT">
                                        <option  value="">选择章：</option>
                                        <#list 1..30 as i>
                                        <option  value="${i}"
                                                 <#if (((catalogue.PARENTID)!0) == i )>selected="selected"</#if>
                                        >第${i}章</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <select class="form-control" id="NODE" name="NODE">
                                        <option  value="">选择节：</option>
                                        <#list 1..30 as i>
                                        <option  value="${i}"   <#if (((catalogue.NODE)!0) == i ) >selected="selected"</#if>
                                        >第${((catalogue.PARENTID)!1)}.${i}节</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input type="text" class="form-control" id="TITLE" name="TITLE" placeholder="输入章节标题..." value="${((catalogue.TITLE)!'')}" required>
                                </div>
                                <small style="color: red;">如果不选择章节，则为添加章节目录</small>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="DESCRIPTION" class="col-form-label">章节描述：</label>
                            <input type="text" class="form-control" name="DESCRIPTION" id="DESCRIPTION" value="${(catalogue.DESCRIPTION)!''}">
                        </div>
                        <div class="form-group">
                            <label for="catalogueUrl" class="col-form-label">教学资源：
                                <#if (catalogue.URL)??>
                                    <a href="#" class=" " data-toggle="modal" data-target="#exampleModal" >浏览课件:第<span>${(catalogue.TITLE)!''}讲</span></a>
                                </#if>
                            <input  type="file" class="form-control-file" name="catalogueUrl" id="catalogueUrl" >
                        </div>
                        <button type="button"  id="btn-addRow" class="btn btn-primary">保存</button>
                    </form>
                </div>
            </div>

        </div>
        <!--右边-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
            <h3>章节目录</h3>

            <ul class="list-group list-group-flush ">
                                <#assign  x=1>
                                        <#list catalogueDTOS as catalogueDTO>
                                            <li class="list-group-item">
                                                <a href="catalogue?id=${(catalogueDTO. CATALOUGEID)!''}">第<span>${x}</span>章：${(catalogueDTO.TITLE)!'未命名'}</a>
                                            </li>
                                            <#assign  y=1>
                                            <#list catalogueDTO.catalogueList as catalogue>
                                                      <li class="list pl-5" >
                                                          <a href="catalogue?id=${(catalogue. CATALOUGEID)!''}">第<span>${y}</span>节：${(catalogue.TITLE)!'未命名'}</a>
                                                      </li>
                                                <#assign  y=y+1>
                                            </#list>
                                            <#assign  x=x+1>
                                        </#list>

            </ul>
        </div>
    </div>
</div>

<#--//弹出框-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <iframe src="/upload/class/${(catalogue.URL)!''}" style="width: 120%;height: 600px;"></iframe>
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


    function initNode(){
        $("#NODE").empty();
        var parentNode = $("#PARENT").val();
        var top = '<option  value="">选择节：</option>';
        var potionHtml = "";
        for (i=1;i<30;i++){
            potionHtml=potionHtml +'<option value="'+parentNode+'.'+i+'">';
            potionHtml=potionHtml +'第'+parentNode+'.'+i+'节';
            potionHtml=potionHtml +'</option>';
        }
        $("#NODE").append(top+potionHtml);

    }
    $(document).ready(function () {
        $('#PARENT').change(function(){
            initNode();
        })
        $("#btn-addRow").click(function () {
            // var table = $("#table-catalogue");
            // row = table.find("tr").length;
            var  classId = $("#classId");
            // var  title = $("#catalogueTitle").val();
            // var file = $("#catalogueUrl").val();
            // var  url = getFileName(file);
            var data = new FormData($( "#text" )[0]);
            $(function () {
                $.
                ajax({
                    type:"post",
                    url:"/class/doModifyCatalogue",
                    processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
                    contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
                    data:data,
                    dataType:"json",
                    success:function(data){
                        // alert("success");
                        window.location.reload();
                        alert(data.message);
                    }
                });
            });
        });
    })
</script>
</body>
</html>