<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>电影详情页</title>
</head>

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

<script>

</script>
<style>
    p{
        margin: 0.2em 0;}
</style>
<body>
<div class="ui left inverted borderless container fluid nine item menu ">
    <a href="#" class="item">首页</a>
    <a href="#" class="item">电影</a>
    <a href="#" class="item">我的</a>
    <a href="#" class="item"></a>
    <a href="#" class="item"></a>
    <a href="#" class="item"></a>
    <a href="#" class="item"></a>
    <a href="#" class="item">登录/注册</a>
</div>


<div class="ui grid center aligned" style="margin-top: 50px">
    <div class="ten wide column left aligned" style="background-color: ">
        <h3>最好的我们（2019）</h3>
        <div class="row">
            <div class="col-md-7">
                <div class="media">
                    <div class="media-left media-left">
                        <a href="#">
                            <img class="media-object" src="/images/ah.jpg" alt="..."  width="135px" height="188px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h5 class="media-heading"><p>导演：xxxx</p><p>编剧：xxx</p><p>主演：xxxx</p><p>类型：xxx</p><p>制片国家/地区：xxx</p>
                            <p>语言：xxxx</p><p>上映日期：xxxx</p><p>片长：xxx</p><p>又名：xxx</p>
                        </h5>
                        <#--            <div class="ui vertical divided"></divcls>-->
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4">豆瓣评分<p id="movie_rate">3344人评价
<#--                <div class="column">-->
                    <div class="ui text vertical menu">
                        <a href="#"class="item"><h5>5星</h5></a>
                        <a href="#"class="item"><h5>4星</h5></a>
                        <a href="#"class="item"><h5>3星</h5></a>
                        <a href="#"class="item"><h5>2星</h5></a>
                        <a href="#"class="item"><h5>1星</h5></a>
                    </div>
<#--                </div>-->
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">最好的我们的剧情简介 · · · · · ·</div>
            <div class="panel-body">
                每个人的心里大概都藏着一个念念不忘的人。一个偶然被提及的名字，让女摄影师耿耿（何蓝逗 饰）内心掀起万千波澜，触动了回忆的开关，那个撩人心动的少年余淮（陈飞宇 饰）再度闯进她的思绪。
                　　那是记忆里最好的时光，“学渣”耿耿和“学霸”余淮成了同桌，还结识了简单（王初伊 饰）、贝塔（周楚濋 饰）、徐延亮（陈帅 饰）。校园里充盈着专属少男少女们的懵懂、青涩、怦然心动和勇敢，耿耿余淮也拥有了他们的约定。高考后，当耿耿满怀期待憧憬约定兑现之时，余淮却忽然消失不见了。七年后两人重逢，余淮当年未说出口的那句话、他不辞而别的秘密，耿耿能否得到解答？这段耿耿于怀的过往，让两人再度面临情感的抉择……
                　　本片根据八月长安同名小说作品改编。
            </div></div>


        <hr class="layui-bg-black">
        <h4>最好的我们的演职员 · · · · · · ( 全部 13 )</h4>
        <div class="row " >
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail">
                    <img src="/images/ah.jpg" alt="...">
                    <div class="caption">
                        <p>章笛沙</p>
                        <p>导演</p>
                    </div>
                </div>
            </div>
        </div>
        <h4>最好的我们的短评 · · · · · · ( 全部 17208 条 )</h4>

<div class="ui items">
    <hr class="layui-bg-black">
    <div class="item">
        <img class="ui avatar image" src="/images/ah.jpg">
        <div class="content">
            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">你是猪吗？ 看过  2019-06-06</font></font></a>
            <div class="description"><a><b><font style="vertical-align: inherit;">就是不去刘昊然啊，就是不如谭松韵啊，怀念王栎鑫啊！</font></b></a></div>
        </div>
    </div>
    <hr class="layui-bg-black">
    <div class="item">
        <img class="ui avatar image" src="/images/ah.jpg">
        <div class="content">
            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">风吹百里 看过  2019-06-06</font></font></a>
            <div class="description"><a><b><font style="vertical-align: inherit;">意外好看的青春题材，在国产青春片影史里绝对排得进前三。八月长安的ip改编真是上一部成一部。</font></b></a></div>
        </div>
    </div>
    <hr class="layui-bg-black">
    <div class="item">
        <img class="ui avatar image" src="/images/ah.jpg">
        <div class="content">
            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">萨库拉 看过  2019-06-03</font></font></a>
            <div class="description"><a><b><font style="vertical-align: inherit;">八月长安只手撑起国产青春一片天，女主角真的蛮可爱，躲躲闪闪的样子很有青春味了</font></b></a></div>
        </div>
    </div>
</div>



    </div>


    <div class="one wide column left aligned" style="background-color: "></div>
</div>



<div class="ui vertical secondary very padded segment">
    <div class="ui container">
        <div class="ui divider"></div>
        <div class="ui five column grid">
            <div class="column">
                <div class="ui text vertical menu">
                    <a href="#"class="item"><h4>Apple Store</h4></a>
                    <a href="#"class="item"><h5>查找零售店</h5></a>
                    <a href="#"class="item">iPhone</a>
                    <a href="#"class="item">iPad</a>
                    <a href="#"class="item">iPod</a>
                    <a href="#"class="item">Watch</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('rate', function(){
        var rate = layui.rate;

        //渲染
        var ins1 = rate.render({
            elem: '#rate'  //绑定元素
            ,text:true
        });
    });
    layui.use('rate', function(){
        var rate = layui.rate;

        //渲染
        var ins1 = rate.render({
            elem: '#movie_rate'  //绑定元素
            ,text:true
            ,readonly:true
        });
    });

</script>
</html>