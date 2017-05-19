package com.jeju.meoui.util;

import java.awt.image.*;
import java.io.*;

import javax.imageio.*;
import javax.servlet.*;

import org.imgscalr.*;
import org.springframework.util.*;
import org.springframework.web.multipart.*;

public class UploadUtil {
	private static boolean isImage(String name){
		//	파일이 이미지인지 확인
		//	jpg, gif, png ...
		String ext= name.substring(name.lastIndexOf(".")+1).toUpperCase();
		if(ext.equals("JPG")||ext.equals("GIF")||ext.equals("PNG"))
			return true;
		return false;
	}
	//	썸네일 실습.
	private static String makeThumnail(String realPath, String fileName) throws IOException{
		//	업로드한 한 파일이 이미지인 경우 썸네일을 만들어서 저장
		//	자바의 예외: 체크하는 예외, 체크하지 않는 예외(RuntimeExeption의 자식들)
		//	체크하는 예외를 통해 프로그래머에게 예외 처리가 필요한 경우 가르쳐 준다.
		//	→ 너무 자주 뜨다보니 .... 너무 가볍게 본다.
		//	스프링은 모두 체크하지 않는 예외
		BufferedImage src= ImageIO.read(new File(realPath+"/"+fileName));
		BufferedImage dest= Scalr.resize(src, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//	file이름 변경: s-20170331112233-img.jpg
		String thumnailName= "s-"+fileName;
		File newFile= new File(realPath, thumnailName);
		ImageIO.write(dest, "JPG", newFile);
		return thumnailName;
	}
	//	유틸을 통해 image파일 지정
	public static String storeAndGetFileName(MultipartFile file, ServletContext ctx, String path){
		System.out.println("넘어온 파일:"+file);
		String fileName= System.currentTimeMillis()+"-"+file.getOriginalFilename();
		//	fileName: 저장할 파일이름.
		//	서버PC에 SSD가 있다면 nanoTile이 적당.
		String realPath= ctx.getRealPath(path);
		//	realPath: 저장할 폴더경로
		File target= new File(realPath, fileName);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			//	file의 이름을 읽어서 target의 경로에 복사한다.
			//	파일의 끝에는 EOF(End Of File)표시: 대게는 -1을 사용한다(-1이 나오게 되면 복사를 중지한다)
		} 
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//	썸네일도 함께 만들어집니다.
		if(isImage(fileName))
			try {
				makeThumnail(realPath, fileName);
			} 
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return fileName;
	}
}
