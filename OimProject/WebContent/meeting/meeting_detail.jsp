<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
<link rel = "stylesheet" type = "text/css" href = "css/bootstrap.min.css">
<script type="text/javascript" src = "js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "js/bootstrap.min.js"></script>

<!-- 네이버 map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=zo4zP_T_AlgKWbxHbxzw&callback=CALLBACK_FUNCTION"></script>

<!-- Box shadow -->
<link rel="stylesheet" type = "text/css" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>

<!--메뉴클릭시 화면 스크롤-->
<script type="text/javascript">
    $(document).ready(function() {
	// navigation click actions	
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow'); 		
        });
    });
    
    // scroll function
    function scrollToID(id, speed){
        var offSet = 50;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
</script>
<!--smallnav-->
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 600) {
                $('.smallnav').fadeIn();
            } else {
                $('.smallnav').fadeOut();
            }
        });
    });
</script>
<!-- shadow box html->jsp -->
<script type="text/javascript">
    Shadowbox.init({
           players:["iframe"]
        }); 
    $(function(){
          $('#apply').click(function(){
             Shadowbox.open({
                content:'meeting_payment.jsp',
                player:'iframe',
                title:'신청내역확인',
                width:1200,
                height:700
             });         
          });
       });
</script>

<!--meeting_detail/CSS-->
<style type="text/css">
    .container{
        border: 1px solid #999;
    }
    .row{
        border-bottom: 1px solid #999;
    }
    .top{
		border-bottom: 1px solid #999;
        height: 30px;
        padding-top: 4px
	}
    .top span{
		border: 1px solid #999;
	}
    .left, .right{
		margin-top: 20px;
        margin-bottom: 20px;
	}
    .left-detail{
		width: 90%;
		margin: 0px auto;
	}
    .right-detail{
		width: 90%;
        height: 330px;
		margin: 0px auto;
	}
    .detailContent img{
        width: 100%;
    }
    .smallnav{
        position: fixed;
        right: 5.5%;
        top: 100px;
        display: none;
        z-index: 999;
    }
    .small li{
        text-align: center;
        border: 1px solid #999;
        border-radius: 10%;
        width: 120px;
        height: 50px;
        line-height: 47px;
        cursor: pointer;
        font-size: 13px;
    }
    .small li:hover, .nav li:hover {
        background-color: dodgerblue;
        color: white;
    }
    .nav li{
        text-align: center;
        width: 160px;
        height: 50px;
        line-height: 47px;
        cursor: pointer;
        font-size: 17px;
        
    }
    #apply{
        margin-right: 10px;
        width: 30%;  
        font-size: 20px;
        line-height: 35px
    }
        
    
</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
    
    
    <div style="height: 50px"></div>
	<div class="container">
        <div class="row">
            <div class="top col-xs-12">
				<span class="label label-danger" style="font-size:13px; margin-right:5px;">유료</span>
				<!-- 무료일경우 -->
				<!--<span class="label label-success" style="font-size:13px; margin-right:5px;">무료</span>-->
				<span class="label label-info" style="font-size:13px; margin-right:5px;">교육</span>
            </div>
            <div class="left col-xs-3" style="border-right: 1px solid #999;">
                <div class="left-detail">
                    <img src="https://onoffmix.com/images/event/121808/s" style="height:50%; width:100%; border: 2px solid #999;">
                    <img src="image/facebook.png" style="height:25px; width:25px; margin: 3px;">
                    <img src="image/instagram.png" style="height:25px; width:25px; margin: 3px;">
                    <img src="image/twitter.png" style="height:25px; width:25px; margin: 3px;">
                    <h4 class="list-group-item">개설자 정보</h4>
                    <b class="list-group-item"><img src="image/man.png" style="height: 10px; width: 10px;">&emsp;장연식</b>
                    <b class="list-group-item"><img src="image/tel.png" style="height: 10px; width: 10px;">&emsp;010-9699-8645</b>
                    <b class="list-group-item"><img src="image/email.png" style="height: 10px; width: 10px;">&emsp;jang1234@daum.net</b>
                    <b class="list-group-item"><img src="image/company.png" style="height: 10px; width: 10px;">&emsp;쌍용강북교육센터</b>
				</div>
            </div>
            
            <div class="right col-xs-9">
                <div class="right-detail">
				    <h2 class="title" id="title">2017 꿈다락 토요문화학교 (일상의 작가)</h2><hr>
					<p>
						<b class="start" id="start"><img src="image/calender.png" style="height: 20px; width: 20px;">&emsp;모임 기간 : 12월 16일 (토) 10시 00분</b>~
						<b class="end" id="end">2018년 1월 13일 (토) 17시 00분</b>
					</p>
					<p>
						<b class="place" id="place"><img src="image/place.png" style="height: 20px; width: 20px;">&emsp;모임 장소 : [제로원디자인센터] 서울 종로구 동숭동 서울시 종로구 동숭길 122-6 국민대학교</b>
					</p>
					<p>
						<b class="total" id="total"><img src="image/people.png" style="height: 20px; width: 20px;">&emsp;신청인원 : 총 20 명 </b> |
						<b class="limit" id="limit">  11 명 신청가능</b>
					</p>
					<hr>
					<p>
						<b class="info" id="info">
							꿈다락 토요문화학교 (일상의 작가)는 사소한 일상, 감정, 생각 등 자신의 이야기를 
							창작하는 프로그램으로 가족과 문학이 만나는 과정을 담고자 합니다.
						</b>
                    </p>
                </div>
                <hr>
                <div class="right-pay">   
					<h2 class="price" id="price" style="text-align: right;">가격 : 10000 원</h2>
                    <a href="#" class="btn btn-large btn-danger jjim" id="jjim" style="float: right; height: 50px;">♡<br>1</a>
                    <a href="#" class="btn btn-large btn-primary apply" id="apply" style="float: right; height: 50px;">신청하기</a>
				</div> 
            </div>
        </div>
        <div class="row">
            <nav class="navbar navbar-default" id="mainNav">
              <div class="collapse navbar-collapse" id="main-nav">
                <ul class="nav navbar-nav">
                    <li class="scroll-link" data-id="detailContent">모임상세 정보</li>
                    <li class="scroll-link" data-id="detailMap">지도보기</li>
                    <li class="scroll-link" data-id="detailcancle">참여신청/취소 안내</li>
                    <li class="scroll-link" data-id="detailComment">댓글보기</li>
                </ul>
              </div>
            </nav>
            <div style="padding-left: 5%; padding-right: 5%;">
                <div class="detailContent" id="detailContent" style="margin-bottom: 100px">
                    <h3 class="webFont">상세내용</h3>
                    <div class="eventDescription">
                        <div class="description html4style" id="description">
                            <img src="https://cfile1.onoffmix.com/attach/9G8I1tOWgTAnbfcTpeohjU58gJJcckN4"><br>			
                        </div>
                    </div>
                </div>
                
                <div class="detailMap" id="detailMap" style="margin-bottom: 100px">
                  <h3 class="webFont">지도보기</h3>
                   <div id="map" style="width:100%;height:600px; margin: 0 auto;"></div>
                    
                        <script>
                            var map = new naver.maps.Map('map', {
                                center: new naver.maps.LatLng(37.50960113, 127.05812649), //지도의 초기 중심 좌표
                                zoom: 8, //지도의 초기 줌 레벨
                                minZoom: 1, //지도의 최소 줌 레벨
                                zoomControl: true, //줌 컨트롤의 표시 여부
                                zoomControlOptions: { //줌 컨트롤의 옵션
                                    position: naver.maps.Position.TOP_RIGHT
                                }
                            });
                            var marker = new naver.maps.Marker({
                                position: new naver.maps.LatLng(37.50960113, 127.05812649),
                                map: map
                            });
                            map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부


                            // 지도 인터랙션 옵션
                            $("#interaction").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("draggable")) {
                                    map.setOptions({ //지도 인터랙션 끄기
                                        draggable: false,
                                        pinchZoom: false,
                                        scrollWheel: false,
                                        keyboardShortcuts: false,
                                        disableDoubleTapZoom: true,
                                        disableDoubleClickZoom: true,
                                        disableTwoFingerTapZoom: true
                                    });

                                    $(this).removeClass("control-on");
                                } else {
                                    map.setOptions({ //지도 인터랙션 켜기
                                        draggable: true,
                                        pinchZoom: true,
                                        scrollWheel: true,
                                        keyboardShortcuts: true,
                                        disableDoubleTapZoom: false,
                                        disableDoubleClickZoom: false,
                                        disableTwoFingerTapZoom: false
                                    });

                                    $(this).addClass("control-on");
                                }
                            });
                                                        $("#min-max-zoom").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("minZoom") === 10) {
                                    map.setOptions({
                                        minZoom: 1,
                                        maxZoom: 14
                                    });
                                    $(this).val(this.name + ': 1 ~ 14');
                                } else {
                                    map.setOptions({
                                        minZoom: 10,
                                        maxZoom: 12
                                    });
                                    $(this).val(this.name + ': 10 ~ 12');
                                }
                            });

                            //지도 컨트롤
                            $("#controls").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("scaleControl")) {
                                    map.setOptions({ //모든 지도 컨트롤 숨기기
                                        scaleControl: false,
                                        logoControl: false,
                                        mapDataControl: false,
                                        zoomControl: false,
                                        mapTypeControl: false
                                    });
                                    $(this).removeClass('control-on');
                                } else {
                                    map.setOptions({ //모든 지도 컨트롤 보이기
                                        scaleControl: true,
                                        logoControl: true,
                                        mapDataControl: true,
                                        zoomControl: true,
                                        mapTypeControl: true
                                    });
                                    $(this).addClass('control-on');
                                }
                            });

                            
                            var map = new naver.maps.Map('map', mapOptions);
                            
                        </script>
                        <h4 class="place" id="place"><img src="image/place.png" style="height: 20px; width: 20px;">&emsp;모임 장소 : [제로원디자인센터] 서울 종로구 동숭동 서울시 종로구 동숭길 122-6 국민대학교</h4>
                </div>
                
                <div class="detailcancle" id="detailcancle" style="margin-bottom: 100px">
				    <h3>참여신청/취소 안내</h3>
				    <div class="box" style="border: 1px solid #999;">
                        <ul style="list-style: none; line-height: 50px;">
                            <li>* <b>모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.</b></li>
                            <li>* <b>결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 <a href="/legal/cancelAndRefund">취소/환불약관</a>을 확인해주세요.</b></li>
                            <li>* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.</li>
                            <li>* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 <a href="/cs/faq/attendee#4">FAQ</a>를 확인해주세요.</li>
                            <li>* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 <a href="/cs/faq/attendee#262">FAQ</a>를 확인해 주세요.</li>
                            <li>* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.</li>
                            <li>* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</li>
                        </ul>
				    </div>
			    </div>
                <div class="detailComment" id="detailComment" style="margin-bottom: 100px">
                   <h3 class="webFont">댓글보기</h3>
                       <table class="table">
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                           <tr style="height: 30px;">
                               <td class="text-center id" width="20%" id="id">임기스칸</td>
                               <td class="text-left reply" width="80%" id="reply">임도진은 뭐하는 사람인가요?</td>
                           </tr>
                       </table>
                </div>
            </div>
        </div>
    </div>
    
        <!--<a id="MOVE_TOP_BTN" class="btn-primary" href="#">TOP</a>-->
        <div class="smallnav" id="main-nav">
            <ul class="small" style="list-style: none">
                <li class="scroll-link" data-id="detailContent">모임상세 정보</li>
                <li class="scroll-link" data-id="detailMap">지도보기</li>
                <li class="scroll-link" data-id="detailcancle">참여신청/취소 안내</li>
                <li class="scroll-link" data-id="detailComment">댓글보기</li>
                <li class="scroll-top" data-id="detailComment" style="font-size: 15px;"><img src="image/top.png" style="width: 20px; height: 20px"> Top</li>
            </ul>
        </div>
    
</body>
</html>