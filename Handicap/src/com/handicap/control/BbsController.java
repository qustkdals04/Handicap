package com.handicap.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.handicap.model.dao.BbsCommentDAO;
import com.handicap.model.dao.BbsDAO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO bd;
	@Autowired
	private BbsCommentDAO bcd;


}
