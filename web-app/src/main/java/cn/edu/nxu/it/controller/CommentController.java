package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.model.Catalogue;
import cn.edu.nxu.it.model.Comment;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import cn.edu.nxu.it.service.CommentService;
import com.jfinal.core.Controller;
import com.jfinal.json.Json;
import com.jfinal.kit.Kv;
import com.sun.jmx.remote.internal.ClientCommunicatorAdmin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class CommentController extends Controller {
    /**
     * p对课程问或者评论提问
     */
    public void doComment(){
        String content = getPara("content");
        Long classId = getLong("classId");
        Long parentId = getLong("parentId");

        Integer type = getInt("type");

        System.out.println("classId = "+classId);
        System.out.println("parentId = "+parentId);
        System.out.println("content = "+content);
        System.out.println("type = "+type);
        User user = (User) getSession().getAttribute("user");
        if (user == null) {
            set("message","用户未登录");
        }
        Kv result = Kv.create();

        if (type.equals(CommentTypeEnum.COMMENT_CLASS.getType())||type == CommentTypeEnum.COMMENT_CLASS.getType()){
            //评论或者提问课程:1
            Course dbCourse = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",parentId);
            if (dbCourse ==null){
                result.set("message","该课程内容已被删除！");
                result.set("success",false);
            }else {
                Comment comment = new Comment();
                comment.setCOMMENTATOR(user.getUSERID());
                comment.setCLASSID(classId);
                comment.setPARENTID(parentId);
                comment.setTYPE(CommentTypeEnum.COMMENT_CLASS.getType());
                comment.setCONTENT(content);
                comment.setGmtCtrated(System.currentTimeMillis());
                comment.setGmtModified(System.currentTimeMillis());
                comment.setCommentCount(0);
                comment.save();
                result.set("success",true);
            }

        }
        if (type.equals(CommentTypeEnum.COMMNET_COMMENT.getType())) {
            //回复评论:2
            Catalogue dbCatalogue = Catalogue.dao.findFirst("SELECT * FROM t_comment WHERE PARENTID = ?",parentId);
            if (dbCatalogue ==null){
                result.set("message","你所回复的内容已被删除！");
                result.set("success",false);
            }else {
                Comment comment = new Comment();
                comment.setCLASSID(classId);
                comment.setCOMMENTATOR(user.getUSERID());
                comment.setPARENTID(parentId);
                comment.setTYPE(CommentTypeEnum.COMMNET_COMMENT.getType());
                comment.setCONTENT(content);
                comment.setGmtCtrated(System.currentTimeMillis());
                comment.setGmtModified(System.currentTimeMillis());
                comment.setCommentCount(0);
                comment.save();
                result.set("success",true);
            }
        }
        renderJson(result);
    }

    /**
     * 获取评论
     */
    public void getComment (){
        Long commentId =getLong("id");
        System.out.println("commentId =============="+commentId);
        CommentService commentService = new CommentService();
        List<CommentDTO> commentDTOS = commentService.initComment(commentId,CommentTypeEnum.COMMNET_COMMENT.getType());
        Kv result = Kv.create();
        result.set("comments",commentDTOS);
        System.out.println("commentDTOS =============="+commentDTOS.size());
        renderJson("comments",result);

    }



}
