package com.handicap.model.dao;

import java.sql.SQLException;
/*import java.util.List;*/
/*import java.util.List;*/
import java.util.List;
import java.util.Map;

import com.handicap.model.beans.FileVO;


public interface FileDAO {
	public boolean insert(FileVO bbs)throws SQLException;
	public int fileid();
	public void fileupload(Map map);
	public List<FileVO> bbsfilename(Map map);
	/*public int bbsNoticeFile();*/
}
