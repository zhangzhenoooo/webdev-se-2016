package cn.edu.nxu.it.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {
	
	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("t_answer", "ANSWERID", Answer.class);
		arp.addMapping("t_catalogue", "CATALOUGEID", Catalogue.class);
		arp.addMapping("t_comment", "COMMENTID", Comment.class);
		arp.addMapping("t_course", "CLASSID", Course.class);
		arp.addMapping("t_history", "HISTORYID", History.class);
		arp.addMapping("t_notification", "NOTIFICATIONID", Notification.class);
		arp.addMapping("t_test", "TESTID", Test.class);
		arp.addMapping("t_testline", "TESTLINEID", Testline.class);
		arp.addMapping("t_user", "USERID", User.class);
		arp.addMapping("t_user_class", "USER_CLASSID", UserClass.class);
	}
}

