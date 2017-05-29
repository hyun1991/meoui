<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관광지 수정</h1>
<form id="UpdateFrom" action="/stie/update/{siteNo}" method="post" enctype="multipart/form-data">
<table>
<tr><td>관광지 번호</td><td><input type="text" name="siteNo" id="siteNo">${siteNo }</td></tr>
<tr><td>관광지명</td><td><input type="text" name="siteName" id="siteName">${siteName}</td></tr>
<tr><td>관광지 소개</td><td><textarea name="siteIntroduce" id="siteIntroduce">${siteIntroduce}</textarea></td></tr>
<tr><td>관광지 전화번호</td><td><input type="text" name="sitePhone" id="sitePhone">${sitePhone}</td></tr>
<tr><td>관광지 홈페이지</td><td><input type="text" name="siteHomePage" id="siteHomePage">${siteHomePage}</td></tr>
<tr><td>관광지 개장시간</td><td><input type="text" name="siteOpenTime" id="siteOpenTime">${siteOpenTime}</td></tr>
<tr><td>관광지 폐장시간</td><td><input type="text" name="siteCloseTime" id="siteCloseTime">${siteCloseTime}</td></tr>
<tr><td>관광지 야간개장여부</td><td><input type="text" name="siteNightOpen" id="siteNightOpen">${siteNightOpen}</td></tr>
<tr><td>관광지 야간개장 시 폐장시간</td><td><input type="text" name="siteNightCloseTime" id="siteNightCloseTime">${siteNightCloseTime}</td></tr>
</table>
<a href="/meoui/site/update">
<button id="update">수정 완료</button>
</a>
</form>
</body>
</html>