<#-- @ftlvariable name="actors" type="java.util.List<java.lang.String>" -->
<#-- @ftlvariable name="directors" type="java.util.List<java.lang.String>" -->
<#-- @ftlvariable name="movie" type="cn.edu.nxu.it.model.Movie" -->
<#-- @ftlvariable name="castList" type="java.util.List<cn.edu.nxu.it.model.Cast>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${(movie.chineseTitle)!""}</title>
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
<#--<div class="ui menu inverted">-->
<#--    <div class="item">MyDouban!</div>-->
<#--    <div class="item"><a href="#">首页 </a> </div>-->
<#--    <div class="item"><a href="#">电影</a> </div>-->
<#--    <div class="item"><a href="#">个人中心 </a> </div>-->
<#--    <div class="floating right item">-->
<#--        <div class="item"><a href="/login">登录</a> </div>-->
<#--        <div class="item"><a href="/register">注册</a> </div>-->
<#--        <div class="item"><a href="/logout">退出</a> </div>-->
<#--    </div>-->
<#--</div>-->


<div class="ui grid container">
    <div class="twelve column">

        <div class="ui basic segment">
            <div class="ui large header">${(movie.chineseTitle)!""}(${(movie.year)!""})</div>
            <div class="ui grid">
                <div class="two wide column">
                    <div class="ui small image">
                        <img src="${(movie.posterUrl)!"/images/nophoto.png"}" alt="">
                    </div>
                </div>
                <div class="twelve wide column" style="margin-left: -20px;">
                    导演：<#list directors[0..*3] as director>${director}</#list><br>
<#--                    主演：<#list actors[0..*5] as actor> ${actor}/</#list><#if(actors?size>5)> <a href="#"-->
<#--                                                                                               id="btn-show-actors"-->
<#--                                                                                               onclick="showMoreActors()">-->
<#--                        更多...</a>-->
<#--                        <span id="more-actors"-->
<#--                              style="display: none">-->
<#--                        <#list actors[5..] as actor>${actor}${actor?is_last?string('','/')}</#list></span></#if>-->
<#--                    <br>-->
                    国家/地区：${(movie.region)!"不详"} <br>
                    上映时间：${(movie.pubDate)!"不详"} <br>
                    片长：${(movie.duration)!""}分钟<br>
                    又名：${(movie.aka)!""}<br>
                </div>
                <div class="ten wide column">
                    <div class="ui basic vertical segment">
                        <div class="ui tiny header" style="color: #007722;">${(movie.chineseTitle)!""}的剧情简介...........
                        </div>
                        <p style="text-indent: 2em;">${(movie.summary)!""}</p>
                    </div>
                </div>

                <div class="eleven wide column">
                    <div class="ui basic vertical segment">
                        <div class="ui tiny header" style="color: #007722;">${(movie.chineseTitle)!""}的演职员
                            ( <a href="/movie/cast/view/${movie.id}">全部 ${casts?size}</a> )
                            ............
                        </div>
                        <div class="ui container">
                            <#list casts[0..*6] as cast>
                                <div class="ui tiny item" style="display: inline-block; margin-left: 0.5rem;">
                                    <div class="image"><a href="/cast/view/${cast.id}"><img
                                                    src="${(cast.avatar_url)!"/images/nophoto.png"}" width="95"
                                                    height="133" alt=""></a></div>
                                    <div class="content" style="text-align: center">${cast.chinese_name}
                                        <br><span style="color: #9b9b9b;">
                                            <#if cast.role_name!="演员">
                                            ${cast.role_name}</span>
                                            <#else>
                                                饰${(cast.act_as[0..*5])!""}
                                            </#if>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>
<script>
    function showMoreActors() {
        $('#more-actors').show();
        $('#btn-show-actors').hide();
    }
</script>
</html>
