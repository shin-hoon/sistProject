<%@ page language="java"
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.oim.model.SelectSaveModel" />
<%
	model.meetingList(request,session);	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/selectsave.css">
	<script type="text/javascript" src="js/selectsave.js"></script>
	<script type="text/javascript">
		$(function(){
			<c:forEach var="vo" items='${list }'>
    		$('.likeGroup${vo.meet_no} .likeInsertBtn').click(function(){
    			
				var meet_no=$('.likeGroup${vo.meet_no} span.likeNumber1').attr("no-data");
				
		
				$.ajax({
    				type:"POST",
    				url:"like_insert.do",
    				data:{"meet_no":meet_no},
    				success:function(res)
    				{
    					$('.selectBoard').html(res);
    					/* $('div.container').html(res); */
    					/* location.href = "selectsave.do?saveNum=${num}&page=${curpage}"; */
    				}
    			});
    		});
    		
			$('.likeGroup${vo.meet_no} .likeDeleteBtn').click(function(){
    			
				var meet_no=$('.likeGroup${vo.meet_no} span.likeNumber2').attr("no-data");
				
				$.ajax({
    				type:"POST",
    				url:"like_delete.do",
    				data:{"meet_no":meet_no},
    				success:function(res)
    				{
    					$('.selectBoard').html(res);
    					/* $('div.container').html(res); */
    					/* location.href = "selectsave.do?saveNum=${num}&page=${curpage}"; */
    				}
    			});
    		});
        	</c:forEach>

		});
	</script>
</head>
<body>
	<div class="container" style="margin-top:30px;">
		<div id="SubContentsTab" >
			<ul>
				<li>
					<a href="selectsave.do?saveNum=1" ${num==1?'class="on"':''}>
						<span id="selectSave1">맞춤모임1</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=2" ${num==2?'class="on"':''}>
						<span id="selectSave2">맞춤모임2</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=3" ${num==3?'class="on"':''}>
						<span id="selectSave3">맞춤모임3</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	<c:if test="${view==0}">
	<jsp:include page="../selectsave/selectNoSave.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${view!=0}">
	<c:forEach var="vo" items="${checkBox}">
	<div class="container">
		<form method="post" action="selectsave/selectsave_ok.jsp">
		<div class="col-sm-12">
			<div class="form-group">
				<input type="hidden" name="cst_no" value="${view}" />
				<div class="input-group" style="width:100%">
					<input type="text" class="form-control"  
						id="validate-text" placeholder="맞춤모임 이름을 입력해주세요.(최대15글자) *필수입력"
						name="cst_subject" maxlength="15" value="${vo.subject}"  
						required>
					<span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
				</div>
			</div>
		</div>
		<div class="row selectBoard">
			<div class="col-sm-3">
			<c:set var="cst_cg" value="${fn:split(vo.cst_cg,',')}"/>
				<span class="btn btn-warning border-trim">모임카테고리</span>				
				
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                	<input type="checkbox" name="cst_cg" value="교육" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='교육'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강연</button>
                	<input type="checkbox" name="cst_cg" value="강연" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='강연'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                	<input type="checkbox" name="cst_cg" value="세미나,컨퍼런스" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='세미나' or check=='컨퍼런스'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                	<input type="checkbox" name="cst_cg" value="문화,예술" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='문화' or check=='예술'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                	<input type="checkbox" name="cst_cg" value="방송,연예" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='방송' or check=='연예'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                	<input type="checkbox" name="cst_cg" value="취미활동" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='취미활동'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                	<input type="checkbox" name="cst_cg" value="소모임,친목행사" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='소모임' or check=='친목행사'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                	<input type="checkbox" name="cst_cg" value="공모전" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='공모전'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                	<input type="checkbox" name="cst_cg" value="전시,박람회" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='전시' or check=='박람회'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                	<input type="checkbox" name="cst_cg" value="패션,뷰티" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='패션' or check=='뷰티'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                	<input type="checkbox" name="cst_cg" value="이벤트,파티" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='이벤트' or check=='파티'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">여행</button>
                	<input type="checkbox" name="cst_cg" value="여행" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='여행'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                	<input type="checkbox" name="cst_cg" value="후원금 모금" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='후원금 모금'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타</button>
                	<input type="checkbox" name="cst_cg" value="기타" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='기타'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            </div>
			<div class="col-sm-3">
				<c:set var="cst_loc" value="${fn:split(vo.cst_loc,',')}"/>
				<span class="btn btn-warning border-trim">모임지역</span>
				
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">서울</button>
                	<input type="checkbox" name="cst_loc" value="서울" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='서울'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                	<input type="checkbox" name="cst_loc" value="부산,울산,경남" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='부산' or check=='울산' or check=='경남'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                	<input type="checkbox" name="cst_loc" value="인천,경기" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='인천' or check=='경기'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                	<input type="checkbox" name="cst_loc" value="대전,충청,세종" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='대전' or check=='충청' or check=='세종'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                	<input type="checkbox" name="cst_loc" value="광주,전라" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='광주' or check=='전라'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강원</button>
                	<input type="checkbox" name="cst_loc" value="강원" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='강원'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                	<input type="checkbox" name="cst_loc" value="대구,경북" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='대구' or check=='경북'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">제주</button>
                	<input type="checkbox" name="cst_loc" value="제주" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='제주'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                	<input type="checkbox" name="cst_loc" value="기타지역" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='기타지역'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            </div>
			<div class="col-sm-3">
				<c:set var="cst_day" value="${fn:split(vo.cst_day,',')}"/>
				<span class="btn btn-warning border-trim">모임요일</span>
				
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주중</button>
                	<input type="checkbox" name="cst_day" value="주중" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='주중'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주말</button>
                	<input type="checkbox" name="cst_day" value="주말" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='주말'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            </div>
			<div class="col-sm-3">
				<c:set var="cst_price" value="${fn:split(vo.cst_price,',')}"/>
				<span class="btn btn-warning border-trim">모임가격</span>
				
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">무료</button>
                	<input type="checkbox" name="cst_price" value="0" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='0'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000원</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='10000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000원~25,000원</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='25000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000원~40,000원</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='40000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000원~99,000원</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000원 ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99001'?'checked':''}
						</c:forEach>   
                	/>
				</span>
			</div>
		</div>
			<div class="row">
				<div class="text-center col-sm-12 border-submit"">
					<input type="submit" class="btn btn-primary btn-sm outline" value="검색저장"/>
					<input type="button" class="btn btn-primary btn-sm outline" id="DeleteBtn" value="검색삭제"/>
					<input type="hidden" id="id" value="${id}">
					<input type="hidden" name="saveNum" id="saveNum" value="${num}">
				</div>
			</div>
			</form>
		</div>
	</c:forEach>
	</c:if>			
	
	
	
		<div class="container col-lg-12 text-center" style="margin-top:5%">
			<c:if test="${view==0}">
				<b style="font-size:40px">전체 모임정보 : ${totalCount}건</b>
			</c:if>
			<c:if test="${view!=0}">
				<b style="font-size:40px">검색된 모임정보 : ${totalCount}건</b>
			</c:if>
		</div>
		<div class="container">
			<div class="col-lg-12 text-center">
				<ul class="thumbnails">
				<c:forEach var="vo" items="${list}" >
						<div class="col-sm-3">
						<div class="thumbnail">
						<div style="width:100%; height:230px;">
							<a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}"><img src="${vo.meet_poster}" style="width:100%;height:100%;"></a>
							</div>
							<div class="caption">
								<div>
									<li class="li_add">
										<c:if test="${vo.meet_charge=='무료'}">
											<span class="label label-success" >
												${vo.meet_charge }
											</span>
										</c:if>
										<c:if test="${vo.meet_charge=='유료'}">
											<span class="label label-danger" >
												${vo.meet_charge }
											</span>
										</c:if>
									</li>
									<li class="li_add">
										<span class="label label-primary">
											${vo.meet_cg }
										</span>
									</li>
								</div>
								<p style="text-align:left;clear:both;">${vo.meet_start} ~ ${vo.meet_end}</p>
								<p class="p_add" style="height:22px;overflow:hidden;">
									${vo.meet_subject }
								</p>
								<%-- <p align="center">
									<a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}" class="btn btn-primary btn-block">신청하기</a>
								</p> --%>
								
								<div class="likeGroup${vo.meet_no}" style="display:hidden;text-align:left;">
                                    <c:choose>
                                  	<c:when test="${sessionScope.id!=null && vo.likeCount==0 }">
                                  		<input type="button" class="btn btn-default likeInsertBtn" style="width:20%;" value="♡">
                                  		<span class="likeNumber1" no-data="${vo.meet_no}" >${vo.meet_like }</span>
                                  	</c:when>
                                  	<c:when test="${sessionScope.id!=null && vo.likeCount!=0 }">
                                  		<input type="button" class="btn btn-primary likeDeleteBtn" style="width:20%;" value="♡">
                                  		<span class="likeNumber2" no-data="${vo.meet_no}">${vo.meet_like }</span>
                                  	</c:when>
                                  	<c:otherwise>
                                  		<input type="button" class="btn btn-primary" onclick="alert('로그인 후 이용해주세요.');" value="♡" style="width:20%;"/>
                                  		<span class="likeNumber3">${vo.meet_like }</span>
                                  	</c:otherwise>
                                  </c:choose>  
                                  
                                  
                                  <c:if test="${vo.meet_limit eq 0}"> <!-- 신청가능 인원이 0일때 버튼 비활성화 후 정원도달 출력 -->
                                  	<a href="#" class="btn btn-primary disabled" style="float:right; width:50%;">정원도달</a>
                                  </c:if>
                                  
                                  <c:if test="${vo.meet_limit ne 0}"> <!-- 신청가능 인원이 존재할때 몇명 신청가능한지 표시 -->
                                  <a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}" class="btn btn-primary" style="float:right; width:50%;"
                                  onMouseOver="this.innerHTML='신청하기'" 
                                  onMouseOut="this.innerHTML='${vo.meet_limit}명 신청가능'">${vo.meet_limit}명 신청가능</a>
                                  </c:if>
                                  </div>
                                  
                                  <fmt:parseNumber var="percent" value="${(vo.meet_total-vo.meet_limit)/vo.meet_total*100}" integerOnly="true"/>
                              <div class="progress" style="margin-top:10px;margin-bottom:0px;height:10px;"> <!-- 얼마나 신청했는지 %값 계산해서 progress bar형태로 표시 -->
                              	  
                              	  <c:if test="${percent >= 0 && percent <= 30}">
                                  <div class="progress-bar progress-bar-success" role="progressbar" style="width:${percent}%"></div>
                                  </c:if>
                                  
                              	  <c:if test="${percent > 30 && percent <= 80}">
                                  <div class="progress-bar progress-bar-primary" role="progressbar" style="width:${percent}%"></div>
                                  </c:if>
                                  
                              	  <c:if test="${percent > 80}">
                              	  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:${percent}%"></div>
                              	  </c:if>
                              	  
                              	  
                            </div>
								
								
								
								
								
							</div>
						</div>
					</div>
				</c:forEach>
				</ul>
			</div>
		</div>

	
	<div class="container text-center">
		<ul class="pagination">
       		<li><a href="selectsave.do?page=${curpage<11?curpage:curpage-10}&saveNum=${num}">◀◀</a></li>
       		<li><a href="selectsave.do?page=${curpage<2?curpage:curpage-1}&saveNum=${num}">◀</a></li>
       				
       		<fmt:parseNumber var="num1" value="${curpage/10}" integerOnly="true"/>
       		<c:set var="num1" value="${num1<=0?1:num1*10}"/>  
       		<c:forEach var="i"  begin="${num1}" end="${num1==1?num1+8:num1+9}">
       			<c:choose>
       				<c:when test="${i > totalpage }"></c:when>
       				<c:when test="${i==curpage}">
	    				<li class="active">
	    					<a href="selectsave.do?page=${i}&saveNum=${num}">	${i} </a>
	    				</li>
       				</c:when>
       				<c:when test="${i <= totalpage}">
       					<li>
       						<a href="selectsave.do?page=${i}&saveNum=${num}"> ${i} </a>
       					</li>
       				</c:when>
       			</c:choose>
       		</c:forEach>
       		<li><a href="selectsave.do?page=${curpage<totalpage?curpage+1:curpage}&saveNum=${num}">▶</a></li>
            <li><a href="selectsave.do?page=${curpage<=totalpage-10?curpage+10:curpage}&saveNum=${num}">▶▶</a></li>
		</ul>
	</div>
	<div class="container" style="height:300px;"></div>
</body>
</html>












