package cn.edu.nxu.it.DTO;

import cn.edu.nxu.it.model.Catalogue;

import java.util.List;

/**
 * @author zhangz
 * @date 2020-03-08 14:29
 * @description
 */
public class CatalogueDTO {
    private Long CATALOUGEID;
    private Long  PARENTID;
    private  Long CLASSID;
    private String   TITLE;
    private Long GMT_CREATED;
    private Long       GMT_MODIFIED;
    private Long  VIEW_COUNT;
    private Long   IS_DELETED;
    private String  URL;
    private String FIRST;
    private String SECOND;

    private List<Catalogue> catalogueList;

    public Long getCATALOUGEID() {
        return CATALOUGEID;
    }

    public void setCATALOUGEID(Long CATALOUGEID) {
        this.CATALOUGEID = CATALOUGEID;
    }

    public Long getPARENTID() {
        return PARENTID;
    }

    public void setPARENTID(Long PARENTID) {
        this.PARENTID = PARENTID;
    }

    public Long getCLASSID() {
        return CLASSID;
    }

    public void setCLASSID(Long CLASSID) {
        this.CLASSID = CLASSID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public Long getGMT_CREATED() {
        return GMT_CREATED;
    }

    public void setGMT_CREATED(Long GMT_CREATED) {
        this.GMT_CREATED = GMT_CREATED;
    }

    public Long getGMT_MODIFIED() {
        return GMT_MODIFIED;
    }

    public void setGMT_MODIFIED(Long GMT_MODIFIED) {
        this.GMT_MODIFIED = GMT_MODIFIED;
    }

    public Long getVIEW_COUNT() {
        return VIEW_COUNT;
    }

    public void setVIEW_COUNT(Long VIEW_COUNT) {
        this.VIEW_COUNT = VIEW_COUNT;
    }

    public Long getIS_DELETED() {
        return IS_DELETED;
    }

    public void setIS_DELETED(Long IS_DELETED) {
        this.IS_DELETED = IS_DELETED;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getFIRST() {
        return FIRST;
    }

    public void setFIRST(String FIRST) {
        this.FIRST = FIRST;
    }

    public String getSECOND() {
        return SECOND;
    }

    public void setSECOND(String SECOND) {
        this.SECOND = SECOND;
    }

    public List<Catalogue> getCatalogueList() {
        return catalogueList;
    }

    public void setCatalogueList(List<Catalogue> catalogueList) {
        this.catalogueList = catalogueList;
    }
}