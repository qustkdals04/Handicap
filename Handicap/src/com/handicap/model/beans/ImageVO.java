package com.handicap.model.beans;

import org.springframework.web.multipart.MultipartFile;

public class ImageVO {
   private MultipartFile img;

public MultipartFile getImg() {
	return img;
}

public void setImg(MultipartFile img) {
	this.img = img;
}
   
   
}
