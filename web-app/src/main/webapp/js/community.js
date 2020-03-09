/**
 * Created by codedrinker on 2019/6/1.
 */

/**
 * 提交课程问题/回复
 */
function post() {
    var courseId = $("#classId").val();
    var questionId = $("#classId").val();
    var content = $("#comment_content").val();
    alert(courseId+content+questionId);
    comment2target(courseId,questionId, 1, content);
}

function post2() {
    //评论课程章节
    var courseId = $("#classId").val();
    var questionId = $("#classId").val();
    var content = $("#comment_content").val();
    alert(courseId+content+questionId);
    comment2target(courseId,questionId, 3, content);
}

function comment2target(courseId,targetId, type, content) {
    if (!content) {
        alert("不能回复空内容~~~");
        return;
    }

    $.ajax({
        type: "post",
        url: "/comment/doComment",
        // contentType: 'application/json',
        data: {
            "classId":courseId,
            "parentId": targetId,
            "content": content,
            "type": type
        },
        success: function (response) {
            if (response.success) {
                window.location.reload();
            }
        }
    });
}

function comment(e) {
    var commentId = e.getAttribute("data-id");
    var content = $("#input-" + commentId).val();
    comment2target(0,commentId, 2, content);
}

/**
 * 展开二级评论
 */
function collapseComments(e) {
    var id = e.getAttribute("data-id");
    var comments = $("#comment-" + id);
    comments.toggle();
    // 获取一下二级评论的展开状态
    var collapse = e.getAttribute("data-collapse");
    if (collapse) {
        // 折叠二级评论
        // comments.hidden();
        comments.removeClass("in");
        e.removeAttribute("data-collapse");
        e.classList.remove("active");
    } else {
        var subCommentContainer = $("#comment-" + id);
        if (subCommentContainer.children().length != 1) {
            //展开二级评论
            // comments.show();
            comments.addClass("in");
            // 标记二级评论展开状态
            e.setAttribute("data-collapse", "in");
            e.classList.add("active");
        } else {
            $.getJSON("/comment/getComment?id=" + id, function (data) {
                var commentList = data.comments.comments ;
                // alert("comment = "+commentList.length);
                $.each(commentList, function (index, comment) {
                    // alert("comments = "+comment.cOMMENTID);
                    var mediaLeftElement = $("<div/>", {
                        "class": "media-left"
                    }).append($("<img/>", {
                        "class": "media-object img-rounded",
                        "src": "/upload/user/head/"+comment.user.HEAD
                    }));

                    var mediaBodyElement = $("<div/>", {
                        "class": "media-body"
                    }).append($("<h5/>", {
                        "class": "media-heading",
                        "html": comment.user.NAME
                    })).append($("<div/>", {
                        "html": comment.cONTENT
                    })).append($("<div/>", {
                        "class": "menu"
                    }).append($("<span/>", {
                        "class": "pull-right",
                        "html": moment(comment.gMT_CREATED).format('YYYY-MM-DD')
                    })));

                    var mediaElement = $("<div/>", {
                        "class": "media"
                    }).append(mediaLeftElement).append(mediaBodyElement);

                    var commentElement = $("<div/>", {
                        "class": "col-lg-12 col-md-12 col-sm-12 col-xs-12 comments"
                    }).append(mediaElement);

                    subCommentContainer.prepend(commentElement);
                });
                //展开二级评论
                // comments.show();
                comments.addClass("in");
                // 标记二级评论展开状态
                e.setAttribute("data-collapse", "in");
                e.classList.add("active");
            });
        }
    }
}

function showSelectTag() {
    $("#select-tag").show();
}

function selectTag(e) {
    var value = e.getAttribute("data-tag");
    var previous = $("#tag").val();
    if (previous.indexOf(value) == -1) {
        if (previous) {
            $("#tag").val(previous + ',' + value);
        } else {
            $("#tag").val(value);
        }
    }
}