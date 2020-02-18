package cn.edu.nxu.it.service;

import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.DTO.CourseDTO;
import cn.edu.nxu.it.model.Course;
import cn.edu.nxu.it.model.User;
import com.sun.org.apache.regexp.internal.RE;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class CourseService {

    public List<CourseDTO> init(Long userid) {
        String sql = "SELECT * FROM t_course WHERE CREATOR = ?";
        List<Course> courses = Course.dao.find(sql, userid);
        if (courses.size() == 0) {
            return new ArrayList<>();
        }
//        // 获取去重的评论人
//        Set<Long> commentators = comments.stream().map(comment -> comment.getCOMMENTATOR()).collect(Collectors.toSet());
//        List<Long> userIds = new ArrayList();
//        userIds.addAll(commentators);
//
//
//        // 获取评论人并转换为 Map
//        String sqlUser = "SELECT t_user.* FROM t_user INNER JOIN t_comment ON t_user.USERID = t_comment.COMMENTATOR WHERE t_comment.PARENTID =?  AND t_comment.TYPE = ?";
//        List<User> users = User.dao.find(sqlUser,commentId,type);
//        Map<Long, User> userMap = users.stream().collect(Collectors.toMap(user -> user.getUSERID(), user -> user));
//
//
//        // 转换 comment 为 commentDTO
//        List<CommentDTO> commentDTOS = comments.stream().map(comment -> {
//            CommentDTO commentDTO = new CommentDTO();
//            commentDTO.setCOMMENTID(comment.getCOMMENTID());
//            commentDTO.setCLASSID(comment.getCLASSID());
//            commentDTO.setCOMMENT_COUNT(comment.getCommentCount());
//            commentDTO.setCOMMENTATOR(comment.getCOMMENTATOR());
//            commentDTO.setCONTENT(comment.getCONTENT());
//            commentDTO.setGMT_CTRATED(comment.getGmtCtrated());
//            commentDTO.setGMT_MODIFIED(comment.getGmtModified());
//            commentDTO.setPARENTID(comment.getPARENTID());
//            commentDTO.setTYPE(comment.getTYPE());
//            commentDTO.setUser(userMap.get(comment.getCOMMENTATOR()));
//            return commentDTO;
//        }).collect(Collectors.toList());
//
//        return commentDTOS;
//    }
        return null;
    }
}
