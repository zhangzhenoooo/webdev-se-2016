<#-- @ftlvariable name="movie" type="cn.edu.nxu.it.model.Movie"-->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>增加电影信息</title>
</head>
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
<body>


<#--<div class="ui menu inverted">-->
<#--    <div class="item">MyDouban!</div>-->
<#--    <div class="item"><a href="#">首页 </a> </div>-->
<#--    <div class="item"><a href="#">电影</a> </div>-->
<#--    <div class="item"><a href="#">个人中心 </a> </div>-->
<#--    <div class="floating right item">-->
<#--        <div class="item"><a href="/login">登录</a> </div>-->
<#--        <div class="item"><a href="/login1">退出</a> </div>-->
<#--    </div>-->
<#--</div>-->

<div class="container">
</ul>
<hr class="layui-bg-black">

    <div class="ui grid container">
        <div style="width: 80%; height: 50px; margin: 0 auto">
            <h3 style="text-align: center;line-height: 50px">添加电影信息</h3>
        </div>
        <div class="twelve wide column centered">
            <form class="ui form segment" id="movie-add-form" action="/movie/save" method="post">
                <div class="field">
                    <label for="original_title">原片名</label>
                    <input type="text" name="original_title" id="original_title" autocomplete="off" placeholder="请输入原片名">
                </div>
                <div class="field">
                    <label for="chinese_title">中文名</label>
                    <input type="text" name="chinese_title" id="chinese_title" autocomplete="off" placeholder="请输入中文名">
                </div>
                <div class="field">
                    <label for="aka">别名</label>
                    <input type="text" name="aka" id="aka" autocomplete="off" placeholder="请输入别名，多个则以分隔符(,)分隔">
                </div>
                <div class="field">
                    <label for="year">上映年份</label>
                    <input type="number" name="year" id="year" min="1900" max="2020" autocomplete="off" placeholder="请输入上映年份">
                </div>
                <div class="field">
                    <label for="pub_date">上映时间</label>
                    <input type="text" name="pub_date" id="pub_date" min="1900-01-01" max="2020-01-01" autocomplete="off" placeholder="请选择上映时间">
                </div>
                <div class="field">
                    <label for="duration">片长</label>
                    <input type="number" name="duration" id="duration" min="1" max="500" autocomplete="off" placeholder="请输入片长">
                </div>

                <div class="field">
                    <label for="region">地区</label>
                    <div class="ui selection dropdown">
                        <i class="dropdown icon"></i>
                        <input type="hidden" name="region">
                        <div class="default text">请选择地区</div>
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
                        <i class="dropdown icon"></i>
                        <input type="hidden" name="language">
                        <div class="default text">请选择语言</div>
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
                 </textarea>
                    <div class=""><span id="num">0</span>/500</div>
                </div>
                <div class="field">
                    <label for="poster_url">海报URL</label>
                    <input type="text" name="poster_url" id="poster_url" placeholder="请输入海报URL" autocomplete="off" value="">
                    </textarea>
                </div>

                <div class="ui error message"></div>
                <input type="submit" value="保存" class="ui primary button">
            </form>
        </div>
    </div>


</div>
<#--<ul class="layui-footer" style="text-align: center;background-color: black;height: 60px;line-height: 60px;color: white;font-size: medium">Copyright &copy; 宁夏大学信息工程学院 12016242402 张康璐 All rights reserved.-->
<#--</ul>-->
</body>

<script>
    $('.ui.dropdown').dropdown();
    // $('.tag.example .ui.dropdown')
    //     .dropdown({
    //         allowAdditions: true
    //     })
    // ;
    var movieAddFrom = $('#movie-add-form').form({
        on: 'blur',
        fields: {
            chinese_name: {
                rules: [
                    {
                        type: 'empty', prompt: '中文名不能为空！'
                    }
                ]
            },
            english_name: {
                rules: [
                    {
                        type: 'empty', prompt: '英文名不能为空！'
                    }
                ]
            },
            summary: {
                rules: [
                    {
                        type: 'empty', prompt: '简介不能为空！'
                    }
                ]
            },
            gender: {
                rules: [
                    {
                        type: 'empty', prompt: '性别不能为空！'
                    }
                ]
            }
            // region: {
            //     rules: [
            //         {
            //             type: 'empty', prompt: '地区不能为空！'
            //         }
            //     ]
            // }

            // 字段名：{
            //          rules:[
            //              {type:'验证规则类型1',prompt;'错误提示1'},
            //              {type:'验证规则类型2',prompt;'错误提示2'},
            //              {type:'验证规则类型3',prompt;'错误提示3'}
            //          ]
            //
            //   }
        }
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#pub_date' //指定元素
        });
    });


    function wordStatic(input) {
        // 获取要显示已经输入字数文本框对象
        var content = document.getElementById('num');
        if (content && input) {
            // 获取输入框输入内容长度并更新到界面
            var value = input.value;
            // 将换行符不计算为单词数
            value = value.replace(/\n|\r/gi,"");
            // 更新计数
            content .innerText = value.length;
        }
    }
</script>
</html>
