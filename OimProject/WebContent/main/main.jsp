<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<!-- 기존 부트스트랩(항상가져오는 3줄)  -->
  		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
   		<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
  		<script type="text/javascript" src="js/bootstrap.min.js"></script>
  	   
  		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- 템플릿 css -->
		<link href="css/owl.carousel.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css"  rel="stylesheet">
		<link href="css/animate.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<!-- 우리가 추가한 css -->     
		<link href="css/oim_style.css" rel="stylesheet">
  		
  		<!-- 슬라이드에 필요한 스크립트  -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<!-- 태그모임 추가 tab css  -->
	    <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" /> <!-- 느낌있게 사진배열 -->
	    <link rel="stylesheet" href="css/bootstrap.css">
  		
  		<!-- 모달   -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- class="w3-table w3-hoverable" -->
		
		<!-- 비밀번호 확인 스트립 -->
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<title>Insert title here</title>
<script>
   $(document).ready(function(){
      $(".boardmenu>a").click(function(){
         $(this).next(".board").toggleClass(".board");
      });
   });
   $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".boardmenu>a").click(function(){
            var submenu = $(this).next(".board");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
   
</script>


<!-- 스크롤 내렸을때 흰색 메뉴바 상단 고정하는 스트립트 -->
<script type="text/javascript">
$( document ).ready( function() {
    var jbOffset = $( '.oim-nb' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.oim-nb' ).addClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');
       /*  $('.oim-nb').css('background-color', '#fcbe03').css('color', 'white');    왜안될까??*/
      }
      else {
        $( '.oim-nb' ).removeClass( 'oim-Fixed' );
        $('.oim-nb').css('background-color', 'white');
      }
    });
  } );
</script>

<style>
	.boardmenu a{cursor:pointer;}
	.boardmenu .board{display:none;}
</style>

<style>

.footer {
  bottom: 0;
  width: 100%;
  height: 70px;
  background-color: gray;
}

 /* 흰색 네비바  */
.oim-nb {
	text-align: center;
	background-color:#ffffff ;
	width: 100%;
	z-index:20;    /*로그인,회원가입 모달이 안보여서 잠시 낮출게여*/
	margin:0px;
	padding:0px;
}

.oim-logo{
	margin:15%; margin-top:2%; margin-bottom:1%; 
	margin-left:28%
}

.oim-Content {
	height: 5000px;
}
.oim-Fixed {
	position: fixed;
	top: 0px;
}
.oim_btn_yw{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border: 0;
	outline:0;
}
.oim_btn_yw:hover{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border: 0.5px solid #fcbe03;
	outline:0;

}
.oim_modal{
	background-color: #fcbe03;
	font-family: "Open Sans",sans-serif;
	color:white;
	border-radius: 0.5em 0.5em 0.5em 0;

}
.oim_btn_gr{
	background-color: #848484;
	font-family: "Open Sans",sans-serif;
	color:white;
	line-height: 22px;
	border: 0;
	outline:0;
}
.oim_btn_gr:hover, .oim_btn_gr:focus{
	background-color: #2E2E2E;
	font-family: "Open Sans",sans-serif;
	color:white;
	line-height: 22px;
	border: 0;
	outline:0;
	
}

</style>

<!-- 회원가입모달-> 아이디중복체크 스크립트 -->
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){ /*#checkBtn 셀랙터  */

		var id=$('#id').val();

		if(id.trim()=="") //아이디가 입력이 안되었을때

		
		
		{
			$('#id').focus();
			return;
		}
		$.ajax({   //*******
			type:'POST', // type: 데이터를 무슨 방식으로 보낼꺼냐
			url:'main.do', // 멤버.jsp에서 만들어짐

			data:{"om_id":id}, // 값을 보냄 ','를 찍고 값을 여러개 보낼 수 있다.

			success:function(response) //idcheck_result.jsp'여기서 실행된 결과값을 넣어준다

			{
				//성공했을때
				var result=response.trim();
				
				if(result==0)    //중복된 아이디가  0이면(없으면)====> 사용가능한 아이디
				{
					$('#res').html("<font color=blue>"+id+"은(는) 사용 가능한 아이디입니다.</font>");
					$('#res_ok').html("<input type=submit value=확인 onclick=ok('"+id+"')>"); 
																//  ㄴ>매개변수 작은따음표를 꼭 써줘야 한다 , 안쓰면 숫자로 인식한다
						// 확인 버튼이 눌리면 중복확인창이 사라진다
						// ok 버튼을 눌렀을때 ===> 밑에 함수 처리
				
				}else
				{
					$('#res').html("<font color=red>"+id+"은(는) 이미 사용중인 아이디입니다.</font>");
					$('#id').val("");
					$('#id').focus();
					$('#res_ok').html("");
				}
			}
		});
	});
});
function ok(om_id){
	parent.frm.om_id.value=om_id;
	parent.idcheck-modal.close();      // 중복체크하고 아이디를 사용할 수 있을때 사용한다는 확인 버튼을 누르면 쉐도우 박스가 자동으로 꺼지면서 입력한 아이디가 자동으로 아이디 창으로 입력된다
}

//비밀번호 일치 확인
 $(function(){
  $('#password').keyup(function(){
   $('font[name=check]').text('');
  }); //#password.keyup

  $('#check_password').keyup(function(){
   if($('#password').val()!=$('#check_password').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("<font color=red>"+"암호가 일치하지 않습니다.다시입력하세요.");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("<font color=blue>"+"암호가 일치합니다.");
   }
  }); //#check_password.keyup
 });
</script>
</head>
<body>

<jsp:include page="${login_jsp}"></jsp:include>

	
<!--===사이트 로고 ====-->
	<div class="container oim-logo">
		<div class="oim-logo-img">
		<!-- 오임 로고 이미지 -->
			<a href="main.do"><img alt="오늘의 모임" src="img/oim.png" class="img-responsive"></a>
		</div>
		
		<!-- 검색창 -->
		<div class="col-md-6 oim-sc">
        	<div id="custom-search-input">
        		<div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="모임을 입력하세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
<!-- 사이트 로고 끝 -->
	
	
	
<!--==== 네비바 위에 회색선 ====-->
	<!-- <hr class="oim-hr"> -->
<!--===흰색 네비바====== -->
	<nav class="navbar navbar-default oim-nb" style="border:0;">
		
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- 메뉴 왼쪽으로 -->
				<ul class="nav navbar-nav navbar-left">

					<li>
						<a href="main.do"><span class="glyphicon glyphicon-home"></span></a>
					</li>
					<li>
						<a href="meeting_list.do">모임</a>
					</li>
					<li>
						<a href="selectsave.do">맞춤모임</a>
					</li>
					<li class="boardmenu">
		                  <a href="#" >커뮤니티</a>
		                  
		                  	<ul class="board">
		                     <li>공지사항</li>
		                     <li>문의게시판(Q&A)</li>
		                     <li>자유게시판(소통)</li>
		                  	</ul>
               </li>
				</ul>
			<!-- 메뉴 오른쪽 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="disabled"> <!-- 비활성화: 모임 개설 시에만 나타남  -->
						<a href="#">모임 개설하기</a>
					</li>
					<li class="disabled"> <!-- 비활성화: 모임 개설 시에만 나타남  -->
						<a href="#">모임관리</a>
					</li>
					<li>
						<a href="main.jsp?mode=5">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>	<!-- /.container-fluid -->
	
	<!-- =====맨위로 올라가기 버튼======== -->
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
	
 	<jsp:include page="${main_jsp}"></jsp:include>
					
	
<!-- =======푸터 ========-->
		<footer class="footer" style="position:relative">
		    <div class="container text-center">
          		<p>오늘의  모임 </p>
    		</div>
         </footer>
       
</body>
</html>