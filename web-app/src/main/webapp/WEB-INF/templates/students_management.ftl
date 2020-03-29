<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/bootstrap-table.min.css">
</head>
<body >
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "navigation.ftl">
</div>
<div class="container-fluid main">
    <div class="row">
        <!--左边-->
        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" style="margin-left:10%;">
            <#if courses?? && (courses?size >0)>
                <#assign x = 0>
                <#list courses as course>
                    <#assign x = x+1>
                          <div class="card"    >
                              <div class="card-header" data-id="${(course.CLASSID)!''}" id="course-${(course.CLASSID)!''}"   onclick="collapseComments(this)">
                                  <h3><span>${x}.&nbsp;</span>${(course.TITLE)}</h3>
                              </div>
                              <a type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">添加学生信息</a>

                              <div class="card-body" data-id="table-${(course.CLASSID)!''}" id="table-${(course.CLASSID)!''}">

                                  <table class="table table-hover">
                                      <thead>
                                      <tr>
                                          <th scope="col">#</th>
                                          <th scope="col">学生姓名</th>
                                          <th scope="col">邮箱</th>
                                          <th scope="col">联系电话</th>
                                          <th scope="col">加入时间</th>
                                          <th scope="col">操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <#if userClassDTOs?? && (userClassDTOs?size >0)>
                                      <#assign i = 0>
                                          <#list  userClassDTOs as userClassDTO>
                                              <#if course.CLASSID ==userClassDTO.CLASSID  >
                                                  <#assign i = i+1>
                                                <tr>
                                                    <th scope="row">${(1)!''}</th>
                                                    <td>${(userClassDTO.NAME)!''}</td>
                                                    <td>${(userClassDTO.EMAIL)!''}</td>
                                                    <td>${(userClassDTO.PHONE)!''}</td>
                                                    <td>${(userClassDTO.GMT_CREATED?number?number_to_datetime?string("yyyy-MM-dd"))!}</td>
                                                    <td>
                                                    <#--<a class="btn btn-primary" href="#" role="button">详情</a>-->
                                                        <a class="btn btn-danger" href="deleteStudent?userId=${(userClassDTO.USERID)!}&classId=${(userClassDTO.CLASSID)!}" role="button">移出我的课程</a>
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
    </div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
 <#include "footer.ftl">
</div>
<#--modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">添加学生</h5>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <input type="text" id="searchText" class="form-control" placeholder="请输入学生邮箱或者名称..." aria-label="Recipient's username" aria-describedby="basic-addon2" required>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" onclick="search()" type="button">查询</button>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover" id="studentTable"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" id="btn-submit" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/js/table-export.min.js" ></script>
<script src="/js/bootstrap-table.js"></script>
<script src="/js/bootstrap-table-export.min.js"></script>
<script type="text/javascript">
    function  search() {
        var  searchText = $("#searchText").val();
        if (searchText ==''){
            alert("请输入查询条件");
        }else{
            $.ajax({
                url:'/studentList',
                type:'post',
                data:{searchText:searchText},
                success:function (data) {
                    // alert(data.users.length)
                    initTable(data.users);
                }
            });
        }
    }
    function InitImport(data) {
        $("#studentTable").bootstrapTable('destroy').bootstrapTable({
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                  //是否显示分页（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 20,                     //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,               //是否启用点击选中行
            columns: [{
                field: 'state',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },{
                title: '学生编号',
                field: 'USERID',
                align: 'center'
            }, {
                title: '姓名',
                field:'NAME',
                align: 'center'
            },{
                field: 'EMAIL',
                title: '邮箱',
                sortable: true,
                align: 'center'
            },{
                field: 'PHONE',
                title: '联系方式',
                sortable: true,
                align: 'center'
            }],
            data:data
        });
        // $('#gridImport').bootstrapTable({data: data});
    }
    function initTable(list) {
        InitImport(list);
    }
    function  collapseComments(e) {
        var id = e.getAttribute("data-id");
        var table = $("#table-" + id);
        table.toggle();
    }

    $(function () {
        $("#btn-submit").click(function () {
            var rows = $.map($('#studentTable').bootstrapTable('getSelections'),function (row) {
                return row;
            });
            alert("id"+rows[0].USERID);
            if (rows == null){
                alert("请选择一行");
            } else {
                $.ajax({
                    url:'/addUserForClass',
                    type:'post',
                    data:{USERID:rows[0].USERID},
                success:function f(respose) {
                        if (respose.success){
                            $("#exampleModal").modal('hide');
                            window.location.reload();
                        }

                }
                });
            }
        });
    })

</script>
</body>
</html>