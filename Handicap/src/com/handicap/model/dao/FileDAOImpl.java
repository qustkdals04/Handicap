package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.FileVO;


public class FileDAOImpl implements FileDAO {

   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public boolean insert(FileVO file) throws SQLException {
      file.setNo(sqlSession.selectOne("bbs.bbsNo", file.getBoardno()));
      int t = sqlSession.insert("bbs.bbsFile", file);
      if(t==1) return true;
      return false;
   }
   
   @Override
   public boolean delete(FileVO file) throws SQLException {
      // TODO Auto-generated method stub
      return false;
   }
   
   @Override
   public int fileid() {
      return sqlSession.selectOne("bbs.fileid");
   }
   
   @Override
   public List<FileVO> bbsFileList(Map map) {
      return sqlSession.selectList("bbs.bbsFileList", map);
   }

   /*@Override
   public int bbsNoticeFile() {
      return sqlSession.selectOne("bbs.noticeno");
   }*/
   
}