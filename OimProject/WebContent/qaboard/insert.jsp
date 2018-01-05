<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
   margin: 0px auto;
   width:600px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		var om_id=$('#om_id').val();
		if(om_id.trim()=="")
		{
			$('#om_id').focus();
			return;
		}
		var qa_subject=$('#qa_subject').val();
		if(qa_subject.trim()=="")
		{
			$('#qa_subject').focus();
			return;
		}
		var qa_content=$('#qa_content').val();
		if(qa_content.trim()=="")
		{
			$('#qa_content').focus();
			return;
		}
		var qa_pwd=$('#qa_pwd').val();
		if(qa_pwd.trim()=="")
		{
			$('#qa_pwd').focus();
			return;
		}
		$('#frm').submit();

	});
});
</script>
</head>
<body>
<center>
  <div class="container">
    <div class="row">
     <h1 style="font-weight: 900">글쓰기</h1>
     <form method="post" action="iinsertok.do" id=frm>
     <table class="table table-hover">
      <tr class="active">
       <th width=10% class="text-right" style="font-size: 17px;">아이디</th>
       <td width=90% class="text-left">
        <input type=text class="input" size=13 name=om_id id="om_id">
       </td>
      </tr>
      <tr class="active">
       <th width=15% class="text-right" style="font-size: 17px;">제목</th>
       <td width=85% class="text-left">
        <input type=text class="input" size=45 name=qa_subject id="qa_subject">
       </td>
      </tr>
      <tr class="active">
       <th width=15% class="text-right" style="font-size: 17px;">내용</th>
       <td width=85% class="text-left">
        <textarea rows="7" cols="50" name=qa_content id="qa_content"></textarea>
       </td>
      </tr>
      <tr class="active">
       <th width=15% class="text-right" style="font-size: 17px;">비밀번호</th>
       <td width=85% class="text-left">
        <input type="password" name=qa_pwd size=10 id="qa_pwd">
       </td>
      </tr>
      <tr class="active">
       <td colspan="2" class="text-center">
        <input type="submit" value="글쓰기"
         class="btn btn-warning btn-sm" id="writeBtn">
         <!-- btn-xs , btn-sm , btn-md , btn-lg -->
         <input type="button" value="취소"
         class="btn btn-warning btn-sm"
         onclick="javascript:history.back()"
         >
       </td>
      </tr>
     </table>
     </form>
    </div>
  </div>
  </center>
</body>
</html>












