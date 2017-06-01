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
		<%@include file="/nav/adminnav.jsp" %>
	</header>
	<div align="center">
    <form id="frm" action="/meoui/admin/notice/update" method="post">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption><h1>게시글 수정하기</h1></caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="TITLE" name="noticeTitle" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="noticeContent"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>         
        <input type="submit" value="수정완료" class="btn">
        <a href="/meoui/admin/notice/list?pageNo=1" class="btn" id="list" >목록으로</a>
    </form>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jsp" %> 
</body>
</html>