package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.FileVO;


public class FileDAOImpl implements FileDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(FileVO bbs) throws SQLException {
		int t = sqlSession.insert("bbs.bbsfile", bbs);
		if(t==1) return true;
		return false;
	}	
	@Override
	public int fileid() {
		return sqlSession.selectOne("bbs.fileid");
	}
	
	@Override
	public void fileupload(Map map) {
		sqlSession.insert("bbs.fileupload", map);
	}
	
	@Override
	public List<FileVO> bbsfilename(Map map) {
		return sqlSession.selectList("bbs.bbsfilename", map);
	}

	/*@Override
	public int bbsNoticeFile() {
		return sqlSession.selectOne("bbs.noticeno");
	}*/
	
}
