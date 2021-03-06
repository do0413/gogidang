<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
		
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./main.me"><img src="./resources/img/footerlogo_1.PNG"
								alt=""></a>
						</div>
						<ul>
							<li>addr : 서울특별시 종로구 종로 69 서울YMCA 7층</li>
							<li>Phone : +82) 02.1234.4954</li>
							<li>Email : gogidang@naver.com</li>
						</ul>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>short cut</h6>
						<ul>

							<li><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
							<li><a href="#"></a></li>
							<li><a href="#">전체가게</a></li>
							<li><a href="#">전체리뷰</a></li>
							<li><a href="#"> </a></li>
						</ul>
						<ul>
							<li><a href="#">추천가게</a></li>
							<li><a href="#">베스트리뷰</a></li>
							<li><a href="#"></a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">이벤트</a></li>
							<li><a href="#"></a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>탁월한 사장님들을 모십니다 !</h6>
						<p>고기당은 함께 성장하실 사장님들을 기다립니다.</p>

						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="./resources/img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</footer>
	<!-- Footer Section End -->
	
	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script>
		var socket = null;
		
		$(document).ready(function() {
			connectWS();
		});
		
		function connectWS() {
			console.log("ttttttt");
			
			var ws = new WebSocket("ws://localhost:8090/gogidang/manageSocket.me");
			socket = ws
	
			ws.onopen = function() {
				console.log('info: connection opened.');
			};
	
			ws.onmessage = function (event) {
				console.log("ReceiveMessage:", event.data + '\n');
				/* let $socketAlert = $('div#socketAlert');
				$socketAlert.html(event.data);
				$socketAlert.css('display', 'block'); */
				toastr.success(event.data);
				
				setTimeout( function() {
					$socketAlert.css('display', 'none');
				}, 13000);
			};
	
			ws.onclose = function (event) { 
				console.log('info: connection closed.');
			};
			
			ws.onerror = function (event) { 
				console.log('info: connection closed.');
			};
		}
	</script>

	
	</body>
</html>