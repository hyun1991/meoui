<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
	<header>
		<%@include file="/nav/adminnav.jsp" %>
	</header>
	<div align="center">
    <form id="frm" action="/meoui/admin/notice/join" method="post">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption><h1>게시글 작성</h1></caption>
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
        <input type="submit" value="작성하기" class="btn">
        <a href="/meoui/admin/notice/list?pageNo=1" class="btn" id="list" >목록으로</a>
    </form>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jsp" %> 
</body>
</html>