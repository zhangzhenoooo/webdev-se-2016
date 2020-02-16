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
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col">
                    <div class="card card-body ">
                    <#--第一部分-->
                        <div class="row shadow p-3 mb-5 bg-white rounded">
                            <div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" style="margin:10px">
                                <div class="card card-body">
                                    <h3>添加课程内容:</h3>
                                    <form action="doPublishClass" id="form-class">

                                        <div class="form-group">
                                            <label for="title" class="title">课程名称:</label>
                                            <input type="text"  class="form-control" id="title"  name="course.TITLE" value="${(course.CLASSID)!''}" aria-describedby="emailHelp">
                                        <#--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                        </div>
                                        <div class="form-group">
                                            <label for="description">课程描述:</label>
                                            <textarea class="form-control" id="description" name="course.DESCRIPTION"  rows="3">${(course.DESCRIPTION)!''}</textarea>
                                        </div>
                                        <h3><label class="alert-danger">${(message)!''}</label></h3>
                                        <button type="submit" class="btn btn-primary">提交</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col">
                                <form>
                                    <div class="form-group">
                                        <label for="class_head" class="title">选择封面</label>
                                        <input type="file" class="form-control-file" id="class_head" name="class.HEAD">
                                    </div>
                                </form>
                                <br>
                                <img src="/images/head.jpg" class="img-fluid"  alt="Responsive image">
                            </div>
                        </div>
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
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Java基础</td>
                                                <td>123.pdf</td>
                                                <td>
                                                    <button type="button" class="btn btn-info">修改</button>
                                                    <button type="button" class="btn btn-danger">删除</button>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="float-right">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新建行</button>

                                        <#--<button type="button" style="width: 100px;" id="newRow"  class="btn btn-info right">新建行</button>-->
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
                                                                        <input type="text" id="classId" name="classId" VALUE="${(course.getCLASSID())!''}" >
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


        $("#btn-addRow").click(function () {
            var  classId = $("#classId");
            var  title = $("#catalogueTitle");
            var  url = $("#catalogueUrl");
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
                        alert("success");
                        alert(response.message);
                    }
                });
            });
        });

        // $('#exampleModal').on('show.bs.modal', function (event) {
        //     var button = $(event.relatedTarget) // Button that triggered the modal
        //     var modal = $(this)
        //     alert("sss");
        //     // modal.find('.modal-title').text('New message to ' + recipient)
        //     modal.find('.modal-body input').val(recipient)
        // })

        // var   loginForm = $("#form-catalogue").form({
        //     on: 'blur',
        //     fields: {
        //         classId: {
        //             identifier: 'classId',
        //             rules: [
        //                 {
        //                     type: 'empty',
        //                     prompt: 'title不能为空'
        //                 }
        //             ]
        //         },
        //         catalogueTitle: {
        //             identifier: 'catalogueTitle',
        //             rules: [
        //                 {
        //                     type: 'empty',
        //                     prompt: 'title不能为空'
        //                 }
        //             ]
        //         },
        //         catalogueUrl: {
        //             identifier: 'catalogueUrl',
        //             rules: [
        //                 {
        //                     type: 'empty',
        //                     prompt: '资源不能为空'
        //                 }
        //             ]
        //         }
        //     }
        // });
        //       loginForm.api({
        //           url: '/class/addCatalogue',
        //           serializeForm: true,
        //           method: 'post',
        //           enctype:'multipart/form-data',
        //           successTest: function (response) {
        //               return response.success || false;
        //           },
        //           onSuccess: function (response) {
        //               if (response.success) {
        //                   //FIXME: 可能有潜在的安全风险
        //                   // window.location.href = response.redirectUrl;
        //                   alert("success");
        //               }
        //               alert("sess");
        //           }, onFailure: function (response) {
        //               // $('#errorMessage').html(response.message);
        //               // $('#login-form').transition('jiggle');
        //               // loginForm.form('reset');
        //               // refreshCaptcha();
        //               // $('#username').focus();
        //               alert("ttttttt"+response.message);
        //           }
        //       });

        //
        // function  addRow(table,row,title,url) {
        //
        //     var table_row ='';
        //     table_row = table_row + "<tr>" ;
        //     table_row = table_row+ ' <th scope="row">'+ title +' </th> <td>';
        //     table_row=table_row       +url+'  </td> <td>123.pdf</td>  <td>';
        //     table_row = table_row + ' <button type="button" onclick=modifiyRow('+row;
        //     table_row =table_row + ' ) class="btn btn-info">修改</button>';
        //     table_row = table_row + '<button type="button" onclick=deleteRow('+row;
        //     table_row = table_row + '  ) class="btn btn-danger">删除</button>';
        //     table_row = table_row + '        </td> </tr>';
        //     table.apend(table_row)
        // }
        //
        // function modifiyRow(i) {
        //
        // }
        // function deleteRow(i) {
        //
        // }



    });
</script>
</body>
</html>