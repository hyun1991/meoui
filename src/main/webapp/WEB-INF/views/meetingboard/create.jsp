<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> 

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<body>
<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
 <div class="container">
	<h1>모임게시판 글 생성하기</h1>
		<form id="meetingboard" action="/meoui/meetingboard/create" method="POST" enctype="multipart/form-data">
		<!-- <table>
			<tr><td>제목:</td><td><input type="text" name="meetingboardTitle" id="meetingboardTitle"></td><tr>
			<tr><td>이미지:</td><td><input type="file" name="Img" id="meetingboardImg"></td></tr>
			<tr><td>내용</td><td><input type="text" name="meetingboardContent" id="meetingboardContent"></td></tr>
			
			
			<tr><td><button id="commit" type="submit">글 쓰기</button></td></tr>		
		
		</table> 
		
		<table>
  <tr>
   <td>
    <table width="1000px" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"></td>
      <td>글쓰기</td>
      <td width="5"></td>
     </tr>
    </table>
   <table width="1000px">
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input  name="meetingboardTitle" id="meetingboardTitle" size="120" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea  name="meetingboardContent" id="meetingboardContent" cols="121" rows="20"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td colspan="2">
		<input type="file" name="Img" id="meetingboardImg" class="form-control" value="등록">
		</td>	
		</tr>
	
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input id="commit" type="submit"    value="등록">	       
       <input type="button" value="취소" onclick=" history.back(-1);">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>-->
 

  <div class="form-group">
    <label for="exampleInputEmail1">글 제목</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="meetingboardTitle" placeholder="title">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">글 내용</label>
    <textarea class="form-control" rows="5" id="comment" name="meetingboardContent" placeholder="contents"></textarea>
  <input type="file" name="Img" id="meetingboardImg" class="form-control" value="등록">
  </div>
  <input type="button"  class="btn btn-default pull-right" value="취소" onclick=" history.back(-1);">
  <button type="submit" class="btn btn-default pull-right" >글작성하기</button>
 
  
</form>

</div>
 			
 
 
 
 
 
 
 


	<footer>
		<%@include file="/footer.jsp"%>
	</footer>
	
		

</body>
</html>