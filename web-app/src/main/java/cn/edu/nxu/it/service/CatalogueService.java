package cn.edu.nxu.it.service;

import cn.edu.nxu.it.DTO.CatalogueDTO;
import cn.edu.nxu.it.DTO.CommentDTO;
import cn.edu.nxu.it.model.Catalogue;
import cn.edu.nxu.it.model.User;
import cn.hutool.core.bean.BeanUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author zhangz
 * @date 2020-03-08 14:13
 * @description
 */
public class CatalogueService {

  public static List<CatalogueDTO> listCatalogByCourseId(Long courseId){

       List<Catalogue> catalogues = Catalogue.dao.find("SELECT * FROM t_catalogue WHERE PARENTID IS NULL AND CLASSID = ?", courseId);
       if (catalogues.size() == 0) {
           return new ArrayList<>();
       }
       // 转换 comment 为 commentDTO
       List<CatalogueDTO> catalogueDTOS = catalogues.stream().map(catalogue -> {
           CatalogueDTO catalogueDTO = new CatalogueDTO();
           catalogueDTO.setCATALOUGEID(catalogue.getCATALOUGEID());
           catalogueDTO.setCLASSID(catalogue.getCLASSID());
           catalogueDTO.setFIRST(catalogue.getFIRST());
           catalogueDTO.setGMT_CREATED(catalogue.getGmtCreated());
           catalogueDTO.setGMT_MODIFIED(catalogue.getGmtModified());
           catalogueDTO.setIS_DELETED(catalogue.getIsDeleted());
           catalogueDTO.setPARENTID(catalogue.getPARENTID());
           catalogueDTO.setSECOND(catalogue.getSECOND());
           catalogueDTO.setTITLE(catalogue.getTITLE());
           catalogueDTO.setURL(catalogue.getURL());
           catalogueDTO.setVIEW_COUNT(catalogue.getViewCount());

           List<Catalogue> secondCatalogues = Catalogue.dao.find("SELECT * FROM t_catalogue WHERE PARENTID  = ?", catalogue.getCATALOUGEID());
           catalogueDTO.setCatalogueList(secondCatalogues);
           return catalogueDTO;

       }).collect(Collectors.toList());

       return catalogueDTOS;

   }

}