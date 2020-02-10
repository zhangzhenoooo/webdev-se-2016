<#-- @ftlvariable name="movie" type="cn.edu.nxu.it.model.Movie" -->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/js/jquery.min.js"></script>
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
    <title>编辑电影</title>
</head>
<body>
<#--<div class="ui left inverted borderless container fluid nine item menu ">-->
<#--    <a href="#" class="item">首页</a>-->
<#--    <a href="#" class="item">电影</a>-->
<#--    <a href="#" class="item">我的</a>-->
<#--    <a href="#" class="item"></a>-->
<#--    <a href="#" class="item"></a>-->
<#--    <a href="#" class="item"></a>-->
<#--    <a href="#" class="item"></a>-->
<#--    <a href="#" class="item">登录/注册</a>-->
<#--</div>-->

<div class="ui grid container centered">
    <div class="twelve wide column centered">
        <form class="ui form segment"  action="/movie/update" id="movie-edit-form" method="post">
            <input type="text" name="id" id="id" hidden value="${movie.id}"><br>
            <div class="field">
                <label for="original_title">原片名</label>
                <input type="text" name="original_title" id="original_title" value="${movie.originalTitle}" autocomplete="off" placeholder="请输入原片名">
            </div>
            <div class="field">
                <label for="chinese_title">中文名</label>
                <input type="text" name="chinese_title" id="chinese_title" value="${movie.chineseTitle}" autocomplete="off" placeholder="请输入中文名">
            </div>
            <div class="field">
                <label for="aka">别名</label>
                <input type="text" name="aka" id="aka" value="${movie.aka}" autocomplete="off" placeholder="请输入别名，多个则以分隔符(,)分隔">
            </div>
            <div class="field">
                <label for="year">上映年份</label>
                <input type="number" name="year" id="year" min="1900" max="2020"  value="${movie.year!""}" autocomplete="off" placeholder="请输入上映年份">
            </div>
            <div class="field">
                <label for="pub_date">上映时间</label>
                <input type="date" name="pub_date" id="pub_date" min="1900-01-01" max="2020-01-01" value="${movie.pubDate!""}" autocomplete="off" placeholder="请选择上映时间">
            </div>
            <div class="field">
                <label for="duration">片长</label>
                <input type="number" name="duration" id="duration" min="1" max="500" value="${movie.duration!""}" autocomplete="off" placeholder="请输入片长">
            </div>

            <div class="field">
                <label for="region">地区</label>
                <div class="ui selection dropdown">
                    <input type="hidden" name="region" >
                    <div class="default text">${movie.region!""}</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item" data-value="中国大陆"><i class="cn flag"></i>中国大陆</div>
                        <div class="item" data-value="中国香港"><i class="hk flag"></i>中国香港</div>
                        <div class="item" data-value="中国台湾"><i class="tw flag"></i>中国台湾</div>
                        <div class="item" data-value="美国"><i class="us flag"></i>美国</div>
                        <div class="item" data-value="英国"><i class="uk flag"></i>英国</div>
                        <div class="item" data-value="印度"><i class="india flag"></i>印度</div>
                        <div class="item" data-value="意大利"><i class="italy flag"></i>意大利</div>
                        <div class="item" data-value="法国"><i class="france flag"></i>法国</div>
                        <div class="item" data-value="其他"><i class="map marker icon"></i>其他</div>
                        <div class="item" data-value="其他"><i class="question circle icon"></i>不详</div>
                    </div>
                </div>
            </div>
            <div class="field">
                <label for="language">语言</label>
                <div class="ui selection dropdown">
                    <input type="hidden" name="language">
                    <div class="default text">${movie.language!""}</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item" data-value="华语"><i class="cn flag"></i>华语</div>
                        <div class="item" data-value="粤语"><i class="hk flag"></i>粤语</div>
                        <div class="item" data-value="英语"><i class="uk flag"></i>英语</div>
                        <div class="item" data-value="印第安语"><i class="india flag"></i>印第安语</div>
                        <div class="item" data-value="意大利语"><i class="italy flag"></i>意大利语</div>
                        <div class="item" data-value="法语"><i class="france flag"></i>法语</div>
                        <div class="item" data-value="其他"><i class="map marker icon"></i>其他</div>
                        <div class="item" data-value="不详"><i class="question circle icon"></i>不详</div>
                    </div>
                </div>
            </div>

            <div class="field">
                <label for="summary">简介</label>
                <textarea name="summary" id="summary" cols="80" rows="5" onkeyup="wordStatic(this);" maxlength="500">
                ${movie.summary!""}
        </textarea>
                <div class=""><span id="num">0</span>/500</div>
            </div>
            <div class="field">
                <label for="poster_url">海报URL</label>
                <input type="text" name="poster_url" id="poster_url" placeholder="请输入海报URL" autocomplete="off" value="${movie.posterUrl}">
                </textarea>
            </div>

            <div class="ui error message"></div>
            <input type="submit" value="保存" class="ui primary button">
        </form>
    </div>
</div>
</div>
</body>
<script>
    $('.ui .dropdown').dropdown();
</script>
</html>