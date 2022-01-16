package kr.co.mytour.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mytour.util.MediaUtils;
import kr.co.mytour.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	//uploadPath: C://upload
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax")
    public ResponseEntity<Map<String, Object>> fileUpload(MultipartFile upload) {
		
		logger.info("ORIGINAL FILE NAME: " + upload.getOriginalFilename());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, upload.getOriginalFilename(), upload.getBytes());
			map.put("uploaded", true);
			map.put("url", "/displayFile?fileName=" + uploadedFileName);
		} catch(Exception e) {
			e.printStackTrace();
			map.put("uploaded", false);
			map.put("error", "could not upload this image");
		}
           
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("DISPLAY FILE NAME: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType= MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""
						+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("DELETE FILE: " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			
		} else {
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
	
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		logger.info("DELETE ALL FILES: " + files);
		
		if(files == null || files.length == 0) {
			logger.info("THERE ARE NO FILES TO DELETE");
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
			
		}
		
		for(String fileName : files) {
			System.out.println(fileName);
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
			
	}
}
