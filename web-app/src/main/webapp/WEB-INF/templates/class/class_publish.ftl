<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>在线学习</title>
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
                <div class="col">
                    <div class="card card-body ">
                    <#--第一部分-->
                        <form action="doPublishClass" id="form-class" method="post" enctype="multipart/form-data">
                        <div class="row shadow p-3 mb-5 bg-white rounded">

                            <div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" style="margin:10px">
                                <div class="card card-body">
                                    <h3>添加课程内容:</h3>

                                        <div class="form-group">
                                            <#--<label for="course.CLASSID" class="title">课程编号:</label>-->
                                            <input type="hidden"  class="form-control" id="course.CLASSID"  name="course.CLASSID" value="${(course.CLASSID)!''}" aria-describedby="emailHelp">
                                        <#--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="course.TITLE">课程名称:</label>
                                            <input type="text"  class="form-control" id="course.TITLE"  name="course.TITLE" value="${(course.TITLE)!''}" aria-describedby="emailHelp">
                                        <#--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                        </div>
                                        <div class="form-group">
                                            <label for="course.DESCRIPTION">课程描述:</label>
                                            <textarea class="form-control" id="course.DESCRIPTION" name="course.DESCRIPTION"  rows="3">${(course.DESCRIPTION)!''}</textarea>
                                        </div>
                                        <h3><label class="alert-danger">${(message)!''}</label></h3>
                                        <button type="submit" class="btn btn-primary" style="width: 100px;">提交</button>

                                </div>
                            </div>
                            <div class="col">

                                    <div class="form-group">
                                        <label for="class_head" class="title">选择封面</label>
                                        <input type="file" class="form-control-file" id="class_head" name="class.HEAD" SRC="${(course.HEAD)!''}">
                                    </div>

                                <br>
                                <img src="" class="img-fluid"  alt="Responsive image">
                            </div>

                        </div>
                        </form>
                    <#--第二部分-->
                        <div class="row">
                            <div class="col">
                                <div class="card card-body">
                                    <button type="button"  id="btn-addCatalogue" style="width: 200px" class="btn btn-success">添加章节内容</button><br>
                                <#--添加章节-->
                                    <div id="addCatalogue">
                                    <#--章节表格-->
                                        <table class="table table-bordered text-center" id="table-catalogue">
                                            <thead>
                                            <tr>
                                                <th scope="col" width="5%">#</th>
                                                <th scope="col" width="50%">标题</th>
                                                <th scope="col" width="30%">教学资源</th>
                                                <th scope="col" width="15%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <#--<#assign  i = 0>-->
                                            <#--<#list catalogues as catalogue>-->
                                                <#--<#assign  i = i+1>-->
                                             <tr>
                                                <th scope="row">${(i)!''}</th>
                                                <td>${(catalogue.TITLE)!''}</td>
                                                <td>${(catalogue.HEAD)!''}</td>
                                                <td>
                                                    <button type="button" class="btn btn-info">修改</button>
                                                    <button type="button" class="btn btn-danger">删除</button>
                                                </td>
                                             </tr>
                                            <#--</#list>-->
                                            </tbody>
                                        </table>
                                        <div class="float-right">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新建行</button>

                                        </div>
                                        <br>
                                    <#--添加章节卡片-->
                                        <div class="row "  id="add-catalouge-card">
                                            <div class="col">
                                            <#--<h3>添加章节内容:</h3>-->
                                                <br>

                                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">添加章节标题：</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form id="text" enctype="multipart/form-data" method="post">
                                                                    <div class="form-group">
                                                                        <input type="hidden" id="classId" name="classId" VALUE="${(course.getCLASSID())!''}" >
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="catalogueTitle" class="col-form-label">添加标题</label>
                                                                        <input type="text" class="form-control" name="catalogueTitle" id="catalogueTitle">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="catalogueUrl" class="col-form-label">添加教学资源：</label>
                                                                        <input  type="file" class="form-control-file" name="catalogueUrl" id="catalogueUrl">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                                <button type="button"  id="btn-addRow" class="btn btn-primary">添加</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<script>

    $(document).ready(function (){

        //显示/隐藏添加章节卡片
        $("#newRow").click(function () {
            $("#add-catalouge-card").toggle();
        });
        // 显示/隐藏新建行卡片
        $("#btn-addCatalogue").click(function () {
            $("#addCatalogue").toggle();
        });

        function  addRow(table,row,title,url) {

            var table_row ='';
            table_row = table_row + "<tr>" ;
            table_row = table_row+ ' <th scope="row">'+ row +' </th> <td>';
            table_row=table_row       +title+'  </td> <td>'+url+'</td>  <td>';
            table_row = table_row + ' <button type="button" onclick=modifiyRow('+row;
            table_row =table_row + ' ) class="btn btn-info">修改</button>';
            table_row = table_row + '<button type="button" onclick=deleteRow('+row;
            table_row = table_row + '  ) class="btn btn-danger">删除</button>';
            table_row = table_row + '        </td> </tr>';
            table.append(table_row)
        }


        /**
         *   获取文件名称带后缀的
          */
        function  getFileName(file){
            var fileName=file.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件
            var FileExt=file.replace(/.+\./,"");   //正则表达式获取后缀
            var url = fileName +FileExt;
            return url;
        }

        $("#btn-addRow").click(function () {
            var table = $("#table-catalogue");
             row = table.find("tr").length;
            var  classId = $("#classId");
            var  title = $("#catalogueTitle").val();
            var file = $("#catalogueUrl").val();
            var  url = getFileName(file);
            var data = new FormData($( "#text" )[0]);
            $(function () {
                $.
                ajax({
                    type:"post",
                    url:"/class/addCatalogue",
                    processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
                    contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
                    data:data,
                    dataType:"json",
                    success:function(data){
                        // alert("success");
                       addRow(table,row,title,url);
                       var  myModel = $("#exampleModal");
                       myModel.modal("toggle");
                       $("#text")[0].reset();



                    }
                });
            });
        });



        // $('#text').on('show.bs.modal', function (event) {
        //     var button = $(event.relatedTarget) // Button that triggered the modal
        //     var modal = $(this)
        //     var table = $("#table-catalogue");
        //     var row = table.find("tr").length;
        //     var  classId = $("#classId");
        //     var  title = $("#catalogueTitle");
        //     var  url = $("#catalogueUrl");
        //     var data = new FormData($( "#text" )[0]);
        //     $(function () {
        //         $.
        //         ajax({
        //             type:"post",
        //             url:"/class/addCatalogue",
        //             processData: false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
        //             contentType: false, //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
        //             data:data,
        //             dataType:"json",
        //             success:function(data){
        //              // var message = data.message;
        //                 addRow(table,row,title,url);
        //                 alert("success");
        //
        //                 $("#catalogueTitle").val(message);
        //                 modal.reset();
        //                 // $('#myModal').modal('toggle')
        //                 // alert(data.message);
        //             },
        //             error:function (data) {
        //                 alert("filed");
        //             }
        //         });
        //     });
        //     // modal.find('.modal-title').text('New message to ' + recipient)
        //     // modal.find('.modal-body input').val(recipient)
        // });




        function modifiyRow(i) {

        }
        function deleteRow(i) {

        }



    });
</script>
</body>
</html>