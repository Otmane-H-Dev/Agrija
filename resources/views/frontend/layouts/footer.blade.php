
	<!-- Start Footer Area -->
	<footer class="footer">
		<!-- Footer Top -->
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer about">
							<div class="logo">
								<a href="index.html"><img src="/backend/img/agrija.png" alt="#"></a>
							</div>
							@php
								$settings = $settings ?? DB::table('settings')->get();
							@endphp
							<p class="text">@foreach($settings as $data) {{$data->short_des}} @endforeach</p>
							<p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">@foreach($settings as $data) {{$data->phone}} @endforeach</a></span></p>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Information</h4>
							<ul>
								<li><a href="{{route('about-us')}}">About Us</a></li>
								<li><a href="#">Faq</a></li>
								<li><a href="#">Terms & Conditions</a></li>
								<li><a href="#">Shipping</a></li>
								<li><a href="{{route('contact')}}">Contact Us</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer social">
							<h4>Get In Tuch</h4>
							<!-- Single Widget -->
							<div class="contact">
								<ul>
									<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->email}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
								</ul>
							</div>
							<!-- End Single Widget -->
							<div class="sharethis-inline-follow-buttons"></div>
						</div>
						<!-- End Single Widget -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<div class="copyright">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="left">
								<p>Copyright © {{date('Y')}} <a href="https://agryja.com/" target="_blank">Agrija</a>  -  All Rights Reserved.</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- /End Footer Area -->
 
	<!-- Jquery -->
    <script src="/frontend/js/jquery.min.js"></script>
    <script src="/frontend/js/jquery-migrate-3.0.0.js"></script>
	<script src="/frontend/js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="/frontend/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="/frontend/js/bootstrap.min.js"></script>
	<!-- Slicknav JS -->
	<script src="/frontend/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="/frontend/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="/frontend/js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<script src="/frontend/js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="/frontend/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
				<script src="/frontend/js/nice-select/js/jquery.nice-select.min.js"></script>
				<!-- Flex Slider JS -->	<script src="/frontend/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="/frontend/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="/frontend/js/onepage-nav.min.js"></script>
	{{-- Isotope --}}
	<script src="/frontend/js/isotope/isotope.pkgd.min.js"></script>
	<!-- Easing JS -->
	<script src="/frontend/js/easing.js"></script>

	<!-- Active JS -->
	<script src="/frontend/js/active.js"></script>

	
	@stack('scripts')
	<script>
		setTimeout(function(){
		  $('.alert').slideUp();
		},5000);
		$(function() {
		// ------------------------------------------------------- //
		// Multi Level dropdowns
		// ------------------------------------------------------ //
			$("ul.dropdown-menu [data-toggle='dropdown']").on("click", function(event) {
				event.preventDefault();
				event.stopPropagation();

				$(this).siblings().toggleClass("show");


				if (!$(this).next().hasClass('show')) {
				$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
				}
				$(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
				$('.dropdown-submenu .show').removeClass("show");
				});

			});
		});
	  </script>
	<script src="https://www.wanochat.com/dist/embed.js" data-chatbot-unique-name="agrija-1788575871" async></script>