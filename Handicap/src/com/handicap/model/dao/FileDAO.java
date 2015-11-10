package com.handicap.model.dao;

import java.sql.SQLException;
/*import java.util.List;*/
/*import java.util.List;*/
import java.util.List;
import java.util.Map;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.FileVO;


public interface FileDAO {
   public boolean insert(FileVO file)throws SQLException;
   public boolean delete(FileVO file)throws SQLException;
   public int fileid();
   public List<FileVO> bbsFileList(Map map);
   /*public int bbsNoticeFile();*/
}