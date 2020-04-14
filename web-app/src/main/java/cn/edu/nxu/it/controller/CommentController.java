package cn.edu.nxu.it.controller;

import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.Enum.CommentTypeEnum;
import cn.edu.nxu.it.Enum.NotifyTypeEnum;
import cn.edu.nxu.it.model.*;
import cn.edu.nxu.it.service.CommentService;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;

import java.util.List;

public class CommentController extends Controller {
    /**
     * p对课程问或者评论提问
     */
    public void doComment(){
        String content = getPara("content");
        Long classId = getLong("classId");
        Long parentId = getLong("parentId");

        Integer type = getInt("type");

//        System.out.println("classId = "+classId);
//        System.out.println("parentId = "+parentId);
//        System.out.println("content = "+content);
//        System.out.println("type = "+type);
        User user = (User) getSession().getAttribute("user");
        if (user == null) {
            set("message","用户未登录");
        }
        Kv result = Kv.create();
        if (type == CommentTypeEnum.COMMENT_CLASS.getType()){
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
                //添加通知
                Notification notification = new Notification();
                notification.setNOTIFER(user.getUSERID());
                notification.setNotiferName(user.getNAME());
                notification.setOUTERID(dbCourse.getCLASSID());
                notification.setOuterTitle(dbCourse.getTITLE());
                notification.setRECEIVER(dbCourse.getCREATOR());
                notification.setTYPE(NotifyTypeEnum.NOTIFY_COURSE.getType());
                notification.setGmtCreated(System.currentTimeMillis());
                notification.save();

                result.set("success",true);
            }

        }
        if (type.equals(CommentTypeEnum.COMMNET_COMMENT.getType())) {
            //回复评论:2
            Comment dbComment = Comment.dao.findFirst("SELECT * FROM t_comment WHERE COMMENTID = ?",parentId);
            if (dbComment ==null){
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
                //添加通知
                Notification notification = new Notification();
                notification.setNOTIFER(user.getUSERID());
                notification.setNotiferName(user.getNAME());
                notification.setOUTERID(dbComment.getCOMMENTATOR());
                notification.setOuterTitle(dbComment.getCONTENT());
                notification.setRECEIVER(comment.getCOMMENTATOR());
                notification.setTYPE(NotifyTypeEnum.NOTIFY_COMMENT.getType());
                notification.setGmtCreated(System.currentTimeMillis());
                notification.save();
                result.set("success",true);
                Db.update("UPDATE t_comment SET COMMENT_COUNT = COMMENT_COUNT +1  WHERE COMMENTID =?",parentId);//评论的评论数加一
            }
        }
        if (type.equals(CommentTypeEnum.COMMNET_CATALOGUE.getType())){
            //评论或者提问课程:3
            Catalogue dbCatalogue = Catalogue.dao.findFirst("SELECT * FROM t_catalogue WHERE CATALOUGEID = ?",parentId);
            if (dbCatalogue ==null){
                result.set("message","该章节内容已被删除！");
                result.set("success",false);
            }else {
                Course dbCourse = Course.dao.findFirst("SELECT * FROM t_course WHERE CLASSID = ?",dbCatalogue.getCLASSID());
                if (dbCourse ==null){
                    result.set("message","该课程内容已被删除！");
                    result.set("success",false);
                }else {
                    Comment comment = new Comment();
                    comment.setCOMMENTATOR(user.getUSERID());
                    comment.setCLASSID(dbCourse.getCLASSID());
                    comment.setPARENTID(parentId);
                    comment.setTYPE(CommentTypeEnum.COMMENT_CLASS.getType());
                    comment.setCONTENT(content);
                    comment.setGmtCtrated(System.currentTimeMillis());
                    comment.setGmtModified(System.currentTimeMillis());
                    comment.setCommentCount(0);
                    comment.save();
                    //添加通知
                    Notification notification = new Notification();
                    notification.setNOTIFER(user.getUSERID());
                    notification.setNotiferName(user.getNAME());
                    notification.setOUTERID(dbCatalogue.getCATALOUGEID());
                    notification.setOuterTitle(dbCatalogue.getTITLE());
                    notification.setRECEIVER(dbCourse.getCREATOR());
                    notification.setTYPE(NotifyTypeEnum.NOTIFY_CATALOGUE.getType());
                    notification.setGmtCreated(System.currentTimeMillis());
                    notification.save();
                    result.set("success",true);
                }
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
