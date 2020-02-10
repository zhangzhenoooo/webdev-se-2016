<#-- @ftlvariable name="joinMovies" type="java.util.List<cn.edu.nxu.it.model.Movie>" -->
<#-- @ftlvariable name="cast" type="cn.edu.nxu.it.model.Cast" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${(cast.chineseName)!""}</title>
    <script src="/js/jquery-1.11.0.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    <!--semantic引入的文件-->
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <!--layui引入的文件-->
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
    <#--bootstrap引入的文件-->
    <link rel="stylesheet" href="/js/bootstrap/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css">
    <script src="/js/bootstrap/bootstrap.min.js"></script>

</head>
<body>
<div class="ui menu inverted">
    <div class="item">MyDouban!</div>
    <div class="item"><a href="#">首页 </a> </div>
    <div class="item"><a href="#">电影</a> </div>
    <div class="item"><a href="#">个人中心 </a> </div>
    <div class="floating right item">
        <div class="item"><a href="/login">登录</a> </div>
        <div class="item"><a href="/register">注册</a> </div>
        <div class="item"><a href="/login1">退出</a> </div>
    </div>
</div>
<div class="ui grid container">
    <div class="twelve column">
        <div class="ui basic segment">
            <div class="ui large header">${cast.chineseName}  ${cast.englishName}</div>
            <div class="ui grid">
                <div class="two wide column">
                    <div class="ui small image">
                        <img src="${(cast.avatarUrl)!"/images/nophoto.png"}" alt="">
                    </div>
                </div>
                <div class="twelve wide column" style="margin-left: -10px">
                    性别：${cast.gender}<br>
                    出生日期：${(cast.birthday)!"不详"}<br>
                    国家或地区：${(cast.region)!"不详"}<br>
                </div>

                <div class="ten wide column">
                    <div class="ui divider"></div>
                    <div class="ui basic vertical segment">
                        <div class="ui tiny header" style="color: #007722;">${cast.chineseName}的简介....</div>
                        <p style="text-indent: 2em">${cast.summary}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="eleven wide column">
            <div class="ui basic vertical segment">
                <div class="ui tiny header" style="color: #007722;">${cast.chineseName}参演的电影....</div>
                <div class="ui container">
                    <#list joinMovies[0..*6] as movie>
                        <div class="ui tiny item" style="display: inline-block; margin-left: 0.5rem">
                            <div class="image">
                                <a href="/movie/view/${movie.id}">
                                    <img src="${(movie.posterUrl)!"/images/nophoto.png"}" width="95px" height="133px"
                                         alt="">
                                </a>
                            </div>
                            <div class="content" style="text-align: center">

                                ${movie.chineseTitle}
                            </div>
                        </div>

                    </#list>
                </div>
            </div>
        </div>
    </div>
</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
</ul>
</body>
</html>