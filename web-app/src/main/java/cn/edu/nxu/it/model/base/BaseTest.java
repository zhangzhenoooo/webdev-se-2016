package cn.edu.nxu.it.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseTest<M extends BaseTest<M>> extends Model<M> implements IBean {

	public M setTESTID(java.lang.Long TESTID) {
		set("TESTID", TESTID);
		return (M)this;
	}


	public java.lang.Long getTESTID() {
		return getLong("TESTID");
	}


	public M setCATALOGUEID(java.lang.Long CATALOGUEID) {
		set("CATALOGUEID", CATALOGUEID);
		return (M)this;
	}


	public java.lang.Long getCATALOGUEID() {
		return getLong("CATALOGUEID");
	}


	public M setDESCRPTION(java.lang.String DESCRPTION) {
		set("DESCRPTION", DESCRPTION);
		return (M)this;
	}


	public java.lang.String getDESCRPTION() {
		return getStr("DESCRPTION");
	}


	public M setTYPE(java.lang.Integer TYPE) {
		set("TYPE", TYPE);
		return (M)this;
	}


	public java.lang.Integer getTYPE() {
		return getInt("TYPE");
	}


	public M setANSWER(java.lang.String ANSWER) {
		set("ANSWER", ANSWER);
		return (M)this;
	}


	public java.lang.String getANSWER() {
		return getStr("ANSWER");
	}


	public M setSCORE(java.lang.Integer SCORE) {
		set("SCORE", SCORE);
		return (M)this;
	}


	public java.lang.Integer getSCORE() {
		return getInt("SCORE");
	}


	public M setIsDeleted(java.lang.Long isDeleted) {
		set("IS_DELETED", isDeleted);
		return (M)this;
	}


	public java.lang.Long getIsDeleted() {
		return getLong("IS_DELETED");
	}


}
