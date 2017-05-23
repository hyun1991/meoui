<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>게시물 작성</title>
<link href="se/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="se/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<form name="insertForm" action="boardInsert.sn" method="post">
    <input type="hidden" name="act" value="insert"/>
    <input type="hidden" name="pageNo" value="1"/>

    <table border="1">
        <tr>
            <td>Title</td>
            <td colspan="3"><input type="text" name="title" value=""/> </td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><input type="text" name="regiUser" value=""/> </td>
            <td>등록일</td>
            <td><c:out value="${boardDetail.regiDt}"></c:out> </td>
        </tr>
        <tr>
            <td colspan="4"> 
                <textarea name="ir1" id="ir1" style="width:500px; height:300px; display:none;"></textarea>
            </td>
        </tr>
    
    </table>
    <p>    
        <input type="button" name="list" value="List" onclick="goList();"/>
        <input type="button" name="save" value="Save" onclick="_onSubmit(this);"/>
        
    </p>
</form>
<script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "se/SEditorSkin.html",
    fCreator: "createSEditorInIFrame"
});

function _onSubmit(elClicked){
    // 에디터의 내용을 에디터 생성시에 사용했던 textarea에 넣어 줍니다.
    oEditors.getById["ir1"].exec("UPDATE_IR_FIELD", []);
    
    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
    var contentTxt = document.getElementById("ir1").value;

    if(contentTxt == null || contentTxt == ''){
        alert('empty content');
        return;
    }
    
    try{
        elClicked.form.submit();
    }catch(e){}
}

function goList(){
    var doc = document.insertForm;
    doc.action = "boardList.sn";
    doc.submit();
}
</script>
</body>
</html>



