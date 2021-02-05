<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.domain.*"%>
<%@include file="../includes/header_simple.jsp"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/modal.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/store_reviewStyle.css"
	type="text/css">

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	String id1 = memberVO.getU_id();
	String id = "'" + memberVO.getU_id() + "'";
%>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3" id="nav-bar">
	            <div class="hero__categories">
	                  <div class="hero__categories__all">
	                  	<span>마이페이지</span>
	              	  </div>
		                  <ul>
		                     <li><a href="./updateList.me">내정보</a></li>
		                     <li><a href="./storeRegForm.st">가게 정보</a></li>
		                     <li><a href="./menuRegForm.mn">메뉴 등록</a></li>
		                     <li><a href="./storeNoticeList.no">문의 관리</a></li>
		                     <li><a href="./storereviewList.re">리뷰 관리</a></li>
		                  </ul>				
	               </div>
				</div>
				<div class="col-lg-9">
					<div class="section-title product__discount__title">
						<h2>리뷰 관리</h2>
					</div>
					<div class="reviewbor">
					<div class="container">
						<table class="table table-hover">
							<thead>
								<tr align=center>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>별점</th>
									<th>등록일</th>
									<th>답변 상태</th>
								</tr>
							</thead>
							<tbody id="review_content" class="text-center">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<form name="reReviewStoreInsertForm">
			<fieldset>
				<legend>리뷰 내용</legend>
				<ol>
					<li>
						<label for="review_num">리뷰번호</label> 
						<input type="text" id="review_num" name="review_num" readonly>
					</li>
					<li>
						<label for="title">리뷰제목</label> 
						<input type="text" id="title" name="title" readonly >
					</li>
					<li>
						<label for="u_id">회원아이디</label>
						<input type="text" id="u_id" name="u_id" readonly>
					</li>
					<li>
						<label for="nickname">회원닉네임</label> 
						<input type="text" id="nickname" name="nickname" readonly>
					</li>
					<li>
						<label for="content">리뷰내용</label> 
						<input id="content" name="content" type="text" readonly>
					</li>
					<li>
						<label for="star">별점</label> 
						<input id="star" name="star" type="text" readonly>
					</li>
					<li>
						<label for="re_review">답글</label> 
						<input type="text" id="re_review" name="re_review" />
					</li>
				</ol>
<<<<<<< HEAD
				<input type="button" id="reReviewStoreInsertBtn" value="댓글달기" /> 
				<input type="button" id="closeBtn" value="닫기" />
=======
			</fieldset>

			<fieldset>
				<input type="button" id="confirmBtn" value="댓글달기" /> <input
					type="button" id="confirmBtn" value="닫기" />
>>>>>>> 5422913cfc447949c107caabea42c5b9345f8933
			</fieldset>
		</form>
	</div>
</div>
<!-- modal END -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	var u_id = <%=id%>;

	$(document).ready(function() {

		commentList();
	});

	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById('myBtn');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	function callModal(event) {
		$.ajax({
			url : 'reviewInfoAjax.re',
			type : 'POST',
			data : {
				'review_num' : event
			},
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			dataType : 'json',
			success : function(retVal) {
				if (retVal.res == "OK") {
					var review_num = retVal.review_num;
					var u_id = retVal.u_id;
					var nickname = retVal.nickname;
					var title = retVal.title;
					var content = retVal.content;
					var star = retVal.star;
					$('input#review_num').val(review_num);
					$('input#u_id').val(u_id);
					$('input#nickname').val(nickname);
					$('input#title').val(title);
					$('input#content').val(content);
					$('input#star').val(star);
				} else {
					alert("confirm Fail!!!!");
				}
			}
		});

		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function(event) {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

<<<<<<< HEAD
	//리뷰 목록
	function commentList() {
		$.ajax({
			url : 'storeReviewListAjax.re',
			data : {'u_id' : u_id}, //u_id의 가게의 리뷰를 다 가져온다.
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
				$.each(data,function(key, value) { //data는 list객체를 받음(controller return 부분)list는 commentVO를 여려개 가지고 있음
					a += '<tr align=center><td>'+ value.review_num+ '</td>';
					a += '<td>' + value.title + '</td>';
					a += '<td>' + value.u_id + '</td>';
					a += '<td>' + value.star + '</td>';
					a += '<td>' + value.review_date+ '</td>';
					a += '<td><button onclick="callModal('+ value.review_num + ');" id="myBtn" class="btn btn-primary btn-xs pull-right">리뷰댓글</button></td></tr>';
				});
				$("#review_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
			},error : function() {
				alert("ajax통신 실패(list)!!!");
			}
		});
	}
	
 	$('[name="reReviewStoreInsertBtn"]').click(function () {
 		var insertData = $('[name="reReviewStoreInsertForm]').serialize();
 		alert(insertData);
 		reReviewStoreInsert(insertData);
 	});

 	function reReviewStoreInsert(insertData) {
 		$.ajax({
 			url : 'reReviewStoreInsert.re',
 			type : 'POST',
 			data : insertData,
 			success : function(data) {
 				if (data == "ok") {
 					modal.style.display = "none";
 					storeQnaList();
 				} else {
 					alert("qnaRe insert Fail!!!!");
 				}
 			}
 		});
 	}
=======
//리뷰 목록
function commentList(){
  $.ajax({
     url : 'storeReviewList.re',
     data : {'u_id' : u_id}, //u_id의 가게의 리뷰를 다 가져온다.
     dataType : 'json',
     contentType : 'application/x-www-form-urlencoded; charset=utf-8',
     success : function(data){ 
        var a ='';
        $.each(data, function(key,value){ //data는 list객체를 받음(controller return 부분)list는 commentVO를 여려개 가지고 있음
      		a += '<tr align=center><td>'+ value.review_num + '</td>';
      		a += '<td>' + value.title + '</td>';
      		a += '<td>' + value.u_id + '</td>';
      		a += '<td>' + value.star + '</td>';
      		a += '<td>' + value.review_date + '</td>';
      		a += '<td><button onclick="callModal(' + value.review_num + ');" id="myBtn" class="btn btn-primary btn-xs pull-right" style="background: #7fad39;border: 1px solid #7fad39;color: white;">리뷰댓글</button></td></tr>';
        });
        
        $("#review_content").html(a); //a내용을 html에 형식으로 .commentList로 넣음
     },
     error:function(){
        alert("ajax통신 실패(list)!!!");
     }
  });
}
>>>>>>> 5422913cfc447949c107caabea42c5b9345f8933
</script>


<%@include file="../includes/footer.jsp"%>