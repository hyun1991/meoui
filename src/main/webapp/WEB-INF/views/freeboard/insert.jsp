<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
	<header>
		<%@include file="/nav/navbar.jsp"%>
	</header>
	<div align="center">
    <form action="/meoui/freeboard/join" method="post" enctype="multipart/form-data">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption><h1>게시글 작성하기</h1></caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="TITLE" name="freeboardTitle" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="freeboardContent"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="view_file">
                        <label>첨부파일</label><input type="file" name="img" id="freeboardImg" class="form-control">
                    </td>
                </tr>
            </tbody>
        </table>         
        <input type="submit" value="작성완료" class="btn">
        <a href="/meoui/freeboard/list?pageNo=1" class="btn" id="list" >목록으로</a>
    </form>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jsp" %> 
</body>
</html>