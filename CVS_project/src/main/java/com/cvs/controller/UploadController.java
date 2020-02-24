package com.cvs.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cvs.utill.MediaUtils;
import com.cvs.utill.UploadFileUtils;

@Controller
public class UploadController {
	@Resource
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadFormGET() {
		
	}
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadFormPOST(MultipartFile file, Model model) throws Exception {
		logger.info("original : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("content type : " + file.getContentType());
		logger.info("getBytes : " + file.getBytes());

		String savedName =
				uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
	
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+originalName;
		
		File target = new File(uploadPath,savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjaxGET() {logger.info("uploadFormGET : ");}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile file)throws Exception {
		logger.info("original : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("content type : " + file.getContentType());
		
		return new ResponseEntity<>(
			  UploadFileUtils.uploadFile(uploadPath,
					  file.getOriginalFilename(),
					  file.getBytes()),
			  HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]>entity = null;
		
		logger.info("fileName : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders header = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);
			if(mType != null) {
				header.setContentType(mType);
				
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				header.add("Content-Disposition", "attachment;filename=\""+
				new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			
			
			}
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		
		logger.info("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
			if(mType != null) {
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();

			}

			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
}







