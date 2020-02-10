<#-- @ftlvariable name="movies" type="java.util.List<cn.edu.nxu.it.model.Movie>" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>电影分类显示</title>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.serialize-object.min.js"></script>
    <!--semantic引入的文件-->
    <script src="/js/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <!--layui引入的文件-->
    <link rel="stylesheet" href="/js/layui/css/layui.css">
    <script src="/js/layui/layui.js"></script>
</head>
<body>
<div class="ui grid container">
    <div class="twelve wide column">
        <div class="ui segment">
            <div class="ui horizontal list">
                <div class="header item"><a href="?region">全部地区:</a></div>
                <#list allRegions as r>
                    <div class="item"><a href="?region=${r!""}&year=${year!""}">${r!""}</a></div>
                </#list>
            </div>

            <div class="ui horizontal list">
                <div class="header item"><a href="?year">全部年份:</a></div>
                <#list allYears as y>
                    <div class="item"><a href="?year=${y}&region=${region!""}">${y}年 </a></div>
                </#list>
            </div>
        </div>
    </div>


    <div class="sixteen wide centered column">
        <div class="ui five column  grid">
            <#list movies as movie>
                <div class="column">
                    <div class="ui tiny card">
                        <a class=" tiny image" href="/movie/view/${movie.id}">
                            <img src="${(movie.posterUrl)!"/images/nophoto.png"}">
                        </a>

                        <div class="content">
                            ${movie.chineseTitle}
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</body>
</html>