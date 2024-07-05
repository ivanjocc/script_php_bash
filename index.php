<!DOCTYPE html>
<?php include './functions/translate.php'; ?>
<html lang="<?= __("fr") ?>">
<?php include './components/head.php'; ?>

<body data-plugin-scroll-spy data-plugin-options="{'target': '#header'}">

	<div class="body">

		<?php include './components/header.php'; ?>

		<!-- Home -->
		<div id="home" class="owl-carousel owl-carousel-light owl-carousel-light-init-fadeIn owl-theme manual dots-inside dots-horizontal-center show-dots-hover show-dots-xs dots-light nav-style-1 nav-inside nav-inside-plus nav-light nav-md nav-font-size-md show-nav-hover mb-0" data-plugin-options="{'autoplayTimeout': 7000}" style="height: 100vh;">
			<div class="owl-stage-outer">
				<div class="owl-stage">

					<!-- Carousel Slide 1 -->
					<div class="owl-item position-relative overlay overlay-show overlay-op-8" style="background-image: url(img/1/3.jpg); background-size: cover; background-position: center;">
						<div class="container position-relative z-index-3 h-100">
							<div class="row justify-content-center align-items-center h-100">
								<div class="col-lg-7 text-center">
									<div class="d-flex flex-column align-items-center justify-content-center h-100">
										<div class="overflow-hidden mb-2">
											<h2 class="position-relative text-color-primary text-5 line-height-5 font-weight-normal ls-0 px-4 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="500" data-plugin-options="{'minWindowWidth': 0}">
												BIENVENUE CHEZ AUTOPASSION
											</h2>
										</div>
										<div class="overflow-hidden mb-2">
											<h1 class="text-color-light font-weight-extra-bold text-10 text-md-15 line-height-1 line-height-sm-3 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="1000" data-plugin-options="{'minWindowWidth': 0}">ESTHÉTIQUE AUTOMOBILE</h1>
										</div>
										<p class="text-4-5 text-color-light font-weight-light text-center px-lg-5 mb-4" data-plugin-animated-letters data-plugin-options="{'startDelay': 1800, 'minWindowWidth': 0, 'animationSpeed': 30}">Nos services professionnels depuis 2013.</p>
										<a href="#faq" data-hash data-hash-offset="0" data-hash-offset-lg="92" class="btn btn-primary btn-outline font-weight-bold text-color-light text-2 py-3 btn-px-4 mt-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="2700" data-plugin-options="{'minWindowWidth': 0}">EN SAVOIR PLUS</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Carousel Slide 2 -->
					<div class="owl-item position-relative overlay overlay-show overlay-op-8" style="background-image: url(img/1/1.jpg); background-size: cover; background-position: center;">
						<div class="container position-relative z-index-3 h-100">
							<div class="row justify-content-center align-items-center h-100">
								<div class="col-lg-7 text-center">
									<div class="d-flex flex-column align-items-center justify-content-center h-100">
										<div class="overflow-hidden mb-2">
											<h3 class="position-relative text-color-primary text-5 line-height-5 font-weight-normal ls-0 px-4 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="500" data-plugin-options="{'minWindowWidth': 0}">
												SERVICE EXCEPTIONNEL
											</h3>
										</div>
										<div class="overflow-hidden mb-2">
											<h2 class="text-color-light font-weight-extra-bold text-10 text-md-15 line-height-1 line-height-sm-3 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="1000" data-plugin-options="{'minWindowWidth': 0}">AUTOPASSION</h2>
										</div>
										<p class="text-4-5 text-color-light font-weight-light text-center px-lg-5 mb-4" data-plugin-animated-letters data-plugin-options="{'startDelay': 1800, 'minWindowWidth': 0, 'animationSpeed': 30}">Votre expert en esthétique automobile.</p>
										<a href="#faq" data-hash data-hash-offset="0" data-hash-offset-lg="92" class="btn btn-primary btn-outline font-weight-bold text-color-light text-2 py-3 btn-px-4 mt-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="2700" data-plugin-options="{'minWindowWidth': 0}">EN SAVOIR PLUS</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-nav">
				<button type="button" role="presentation" class="owl-prev" aria-label="Previous"></button>
				<button type="button" role="presentation" class="owl-next" aria-label="Next"></button>
			</div>
		</div>

		<div role="main" class="main">

			<!-- About -->
			<section class="section section-height-4 bg-light position-relative border-0 m-0" id="about">
				<div class="custom-section-halfbar-bg d-none d-md-block appear-animation" data-appear-animation="customFadeInRightShorter" data-appear-animation-delay="500"></div>
				<div class="container">
					<div class="row align-items-center">
						<div class="col-md-6 mb-5 mb-md-0">
							<div class="pe-0">
								<div class="overflow-hidden mb-2">
									<h2 class="word-rotator letters type font-weight-bold line-height-4 text-8 mb-0 appear-animation" data-appear-animation="maskUp">
										<span class="custom-primary-font">Découvrez les meilleurs services de </span>
										<span class="word-rotator-words waiting">
											<b class="is-visible custom-primary-font">nettoyage</b>
											<b class="custom-primary-font">polissage</b>
											<b class="custom-primary-font">détail</b>
										</span>
									</h2>
								</div>
								<div class="divider divider-primary divider-small">
									<hr class="w-25 text-start custom-h-1 appear-animation" data-appear-animation="dividerProgress25" data-appear-animation-delay="200">
								</div>
								<p class="text-4 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="400">Autopassion est votre expert en esthétique automobile depuis 2013, offrant des services de nettoyage, polissage et plus encore.</p>
								<div class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="600">
									<p class="opacity-8 mb-4">Notre mission est de fournir un service professionnel et de haute qualité, garantissant la satisfaction de nos clients passionnés par l'automobile.</p>
								</div>

								<div class="collapse" id="aboutViewMore">
									<p class="opacity-8 mb-0 pb-0">Nous utilisons les meilleures techniques et produits pour assurer que votre véhicule soit en parfait état. Que ce soit pour un nettoyage complet ou un service de polissage, notre équipe est prête à répondre à vos besoins.</p>

									<div class="row py-4">
										<div class="col-6">
											<a class="img-thumbnail img-thumbnail-no-borders d-block img-thumbnail-hover-icon lightbox" href="img/demos/coffee/others/others-2.jpg" data-plugin-options="{'type':'image'}">
												<img class="img-fluid rounded-0" src="img/demos/coffee/others/others-2.jpg" alt="Project Image">
											</a>
										</div>
										<div class="col-6">
											<a class="img-thumbnail img-thumbnail-no-borders d-block img-thumbnail-hover-icon lightbox" href="img/demos/coffee/others/others-3.jpg" data-plugin-options="{'type':'image'}">
												<img class="img-fluid rounded-0" src="img/demos/coffee/others/others-3.jpg" alt="Project Image">
											</a>
										</div>
									</div>

									<p class="opacity-8 mb-4">Nous nous engageons à offrir un service personnalisé et adapté à chaque client, en prenant soin de chaque détail pour que votre véhicule soit impeccable.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<img src="img/1/about.jpg" class="img-fluid rounded appear-animation" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="700" alt="Image Autopassion" />
						</div>
					</div>
				</div>
			</section>

			<!-- Parallax -->
			<section class="section section-parallax section-height-4 overlay overlay-show border-0 m-0 appear-animation" data-appear-animation="fadeIn" data-plugin-parallax data-plugin-options="{'speed': 1.5, 'parallaxHeight': '135%'}" data-image-src="img/1/2.jpg" id="reservations">
				<div class="container container">
					<div class="row align-items-center">
						<div class="col-md-6 custom-column-bg text-center py-5 mb-5 mb-md-0 appear-animation" data-appear-animation="fadeInLeftShorter" data-appear-animation-delay="200">
							<div class="overflow-hidden mb-3">
								<h2 class="text-color-light font-weight-bold text-9 negative-ls-1 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="400">Contactez-nous</h2>
							</div>
							<div class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="600">
								<p class="font-weight-light text-color-light text-3 opacity-7 px-4">Pour prendre rendez-vous ou pour toute question, n'hésitez pas à nous appeler.</p>
							</div>
							<a href="tel:(450) 542 3518" class="font-weight-bold text-color-primary text-4 ls-0 d-block mb-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="650">APPELEZ-NOUS: (450) 542 3518</a>
						</div>
						<div class="col-md-6 text-center">
							<div class="row justify-content-center">
								<div class="col-md-6 col-lg-4 mb-4 mb-md-0 appear-animation" data-appear-animation="fadeInLeftShorter" data-appear-animation-delay="500">
									<h2 class="text-color-light font-weight-bold text-7 negative-ls-05 mb-3">LUN - VEN</h2>
									<p class="font-weight-light text-color-light opacity-7 mb-0"><span class="d-block">8:00 AM</span> À <span class="d-block">5:00 PM</span></p>
								</div>
								<div class="col-md-6 col-lg-4 appear-animation" data-appear-animation="fadeInLeftShorter" data-appear-animation-delay="700">
									<h2 class="text-color-light font-weight-bold text-7 negative-ls-05 mb-3">SAM</h2>
									<p class="font-weight-light text-color-light opacity-7 mb-0"><span class="d-block">9:00 AM</span> À <span class="d-block">3:00 PM</span></p>
									<p class="font-weight-light text-color-light opacity-7 mb-0">(été seulement)</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Portfolio -->
			<div class="container" id="projects">
				<div class="row">
					<div class="col">
						<h3 class="text-secondary font-weight-bold text-capitalize text-7 mb-2 mt-5">Portfolio</h3>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="appear-animation" data-appear-animation="fadeIn" data-appear-animation-delay="500">
							<ul class="nav nav-pills sort-source sort-source-style-3" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li class="d-none nav-item active" data-option-value="*"><a class="nav-link text-2-5 text-uppercase active" href="#">Afficher tout</a></li>
								<li class="d-none nav-item" data-option-value=".outils"><a class="nav-link text-2-5 text-uppercase" href="#">Outils de travail</a></li>
								<li class="d-none nav-item" data-option-value=".bain"><a class="nav-link text-2-5 text-uppercase" href="#">Salle de bain</a></li>
								<li class="d-none nav-item" data-option-value=".avant"><a class="nav-link text-2-5 text-uppercase" href="#">Avant et après</a></li>
							</ul>

							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/7.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/6.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/9.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/8.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/11.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/10.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/14.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/12.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/18.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/17.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/20.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/19.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/24.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/23.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/16.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/15.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/25.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/26.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/28.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/27.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
												</span>
											</span>
										</div>
									</div>

									<div class="col-sm-6 col-lg-3 isotope-item avant">
										<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<span class="owl-carousel owl-theme dots-inside m-0" data-plugin-options="{'items': 1, 'margin': 20, 'animateOut': 'fadeOut', 'autoplay': true, 'autoplayTimeout': 3000}"><span><img src="img/1/30.jpg" class="img-fluid border-radius-0" alt="Apres"></span><span><img src="img/1/29.jpg" class="img-fluid border-radius-0" alt="Avant"></span></span>
													<span class="thumb-info-title">
													</span>
												</span>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Divider -->
			<div class="home-intro bg-primary mt-5" id="home-intro">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-8">
							<p>
								Bienvenue chez <span class="highlighted-word text-4">Autopassion</span>, votre expert en esthétique automobile.
								<span>Découvrez nos services et options inclus.</span>
							</p>
						</div>
						<div class="col-lg-4">
							<div class="get-started text-start text-lg-end">
								<a href="#faq" class="btn btn-dark btn-lg text-3 font-weight-semibold px-4 py-3">Commencez maintenant</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Services -->
			<section class="section my-0 py-5 border-0 bg-transparent" id="services">
				<div class="container container-xl-custom">
					<div class="row justify-content-between align-items-center py-5">
						<div class="col-lg-3">
							<h4 class="text-primary text-3 font-weight-bold mb-2">AUTOPASSION</h4>
							<h3 class="mb-3">Nos Services</h3>
							<p class="mb-5 mb-lg-0">Découvrez nos services professionnels d'esthétique automobile.</p>
						</div>
						<div class="col-lg-8">
							<div class="owl-carousel owl-theme carousel-half-full-width-right nav-style-1 nav-dark nav-font-size-lg mb-0" data-plugin-options="{'responsive': {'0': {'items': 1}, '768': {'items': 3}, '992': {'items': 3}, '1200': {'items': 3}}, 'loop': true, 'nav': true, 'dots': false, 'margin': 20}">

								<!-- Service 1 -->
								<div class="p-relative">
									<span class="thumb-info thumb-info-swap-content anim-hover-inner-wrapper rounded">
										<span class="thumb-info-wrapper overlay overlay-show overlay-gradient-bottom-content">
											<img src="img/1/service-1.jpg" class="img-fluid" alt="Nettoyage Complet">
										</span>
									</span>
									<h4 class="font-weight-bold mt-4">Nettoyage Complet</h4>
									<ul class="list list-icons list-primary font-weight-medium mt-3">
										<li><i class="fas fa-check text-color-primary"></i> Nettoyage intérieur et extérieur.</li>
										<li><i class="fas fa-check text-color-primary"></i> Shampoing des sièges et tapis.</li>
										<li><i class="fas fa-check text-color-primary"></i> Lavage de la carrosserie.</li>
									</ul>
								</div>

								<!-- Service 2 -->
								<div class="p-relative">
									<span class="thumb-info thumb-info-swap-content anim-hover-inner-wrapper rounded">
										<span class="thumb-info-wrapper overlay overlay-show overlay-gradient-bottom-content">
											<img src="img/1/service-2.jpg" class="img-fluid" alt="Polissage">
										</span>
									</span>
									<h4 class="font-weight-bold mt-4">Polissage</h4>
									<ul class="list list-icons list-primary font-weight-medium mt-3">
										<li><i class="fas fa-check text-color-primary"></i> Polissage professionnel.</li>
										<li><i class="fas fa-check text-color-primary"></i> Élimination des rayures.</li>
										<li><i class="fas fa-check text-color-primary"></i> Protection de la peinture.</li>
									</ul>
								</div>

								<!-- Service 3 -->
								<div class="p-relative">
									<span class="thumb-info thumb-info-swap-content anim-hover-inner-wrapper rounded">
										<span class="thumb-info-wrapper overlay overlay-show overlay-gradient-bottom-content">
											<img src="img/1/service-3.jpg" class="img-fluid" alt="Détail Complet">
										</span>
									</span>
									<h4 class="font-weight-bold mt-4">Détail Complet</h4>
									<ul class="list list-icons list-primary font-weight-medium mt-3">
										<li><i class="fas fa-check text-color-primary"></i> Service de détail complet.</li>
										<li><i class="fas fa-check text-color-primary"></i> Protection longue durée.</li>
										<li><i class="fas fa-check text-color-primary"></i> Réparation de la peinture.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Tarifs -->
			<section class="section parallax bg-transparent border-0 py-0 m-0 position-relative" data-plugin-parallax data-image-src="img/1/31.jpg" data-plugin-options="{'speed': 1.5, 'scrollableParallax': true, 'scrollableParallaxMinWidth': 991, 'startOffset': 8, 'cssProperty': 'width', 'cssValueStart': 40, 'cssValueEnd': 100, 'cssValueUnit': 'vw'}">
				<div class="d-flex justify-content-center position-relative">
					<div class="scrollable-parallax-wrapper overflow-hidden position-relative">
						<!-- Overlay oscuro -->
						<div class="position-absolute w-100 h-100" style="background: rgba(0, 0, 0, 0.5); z-index: 1;"></div>
						<div class="container custom-container-style-1 custom-container-position-1 py-5 my-5 mx-0 position-relative d-flex justify-content-center align-items-center w-100" style="z-index: 2;">
							<div class="row justify-content-center py-4">
								<div class="col-lg-9 text-center">
									<p class="custom-font-secondary text-9 text-color-light line-height-3 opacity-9 mb-0" style="color: #FFFFFF; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
										tarifs
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Faq and Contact -->
			<div class="container py-5 my-3" id="faq">
				<div class="row align-items-center">

					<!-- Faq -->
					<div class="col-lg-6 mb-5 mb-lg-0">
						<div class="card bg-primary border-0 border-radius-0">
							<div class="card-body p-5">
								<h3 class="d-block alternative-font-4 text-color-light font-weight-medium opacity-8 text-4 mb-0">DES QUESTIONS?</h3>
								<h2 class="text-color-light font-weight-bold text-9 pb-2 mb-4">Questions Fréquentes</h2>

								<div class="custom-seemore-overlay mb-4">
									<div class="custom-accordion-style-1 accordion accordion-modern" id="FAQAccordion">
										<div class="card card-default">
											<div class="card-header">
												<h4 class="card-title m-0">
													<a class="accordion-toggle text-color-dark font-weight-semibold text-2-5 collapsed" data-bs-toggle="collapse" href="#collapseFAQOne">
														1- Pourquoi choisir Autopassion?
													</a>
												</h4>
											</div>
											<div id="collapseFAQOne" class="collapse" data-bs-parent="#FAQAccordion">
												<div class="card-body ps-4 pt-2">
													<p class="mb-0">Nous offrons des services d'esthétique automobile de haute qualité avec une attention méticuleuse aux détails depuis 2013.</p>
												</div>
											</div>
										</div>
										<div class="card card-default">
											<div class="card-header">
												<h4 class="card-title m-0">
													<a class="accordion-toggle text-color-dark font-weight-semibold text-2-5 collapsed" data-bs-toggle="collapse" href="#collapseFAQTwo">
														2- Quels services offrez-vous?
													</a>
												</h4>
											</div>
											<div id="collapseFAQTwo" class="collapse" data-bs-parent="#FAQAccordion">
												<div class="card-body ps-4 pt-2">
													<p class="mb-0">Nous proposons des services de nettoyage complet, de polissage et de détail complet pour votre véhicule.</p>
												</div>
											</div>
										</div>
										<div class="card card-default">
											<div class="card-header">
												<h4 class="card-title m-0">
													<a class="accordion-toggle text-color-dark font-weight-semibold text-2-5 collapsed" data-bs-toggle="collapse" href="#collapseFAQThree">
														3- Comment puis-je prendre rendez-vous?
													</a>
												</h4>
											</div>
											<div id="collapseFAQThree" class="collapse" data-bs-parent="#FAQAccordion">
												<div class="card-body ps-4 pt-2">
													<p class="mb-0">Vous pouvez nous appeler au (450) 542 3518 ou utiliser notre formulaire de contact en ligne pour planifier un rendez-vous.</p>
												</div>
											</div>
										</div>
										<div class="card card-default">
											<div class="card-header">
												<h4 class="card-title m-0">
													<a class="accordion-toggle text-color-dark font-weight-semibold text-2-5 collapsed" data-bs-toggle="collapse" href="#collapseFAQFour">
														4- Quelles sont vos horaires d'ouverture?
													</a>
												</h4>
											</div>
											<div id="collapseFAQFour" class="collapse" data-bs-parent="#FAQAccordion">
												<div class="card-body ps-4 pt-2">
													<p class="mb-0">Nous sommes ouverts du lundi au vendredi de 8h à 17h, et le samedi de 9h à 15h (été seulement).</p>
												</div>
											</div>
										</div>
										<div class="card card-default">
											<div class="card-header">
												<h4 class="card-title m-0">
													<a class="accordion-toggle text-color-dark font-weight-semibold text-2-5 collapsed" data-bs-toggle="collapse" href="#collapseFAQFive">
														5- Offrez-vous des services de protection de peinture?
													</a>
												</h4>
											</div>
											<div id="collapseFAQFive" class="collapse" data-bs-parent="#FAQAccordion">
												<div class="card-body ps-4 pt-2">
													<p class="mb-0">Oui, nous offrons des services de polissage et de protection de peinture pour préserver l'éclat de votre véhicule.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Form -->
					<div id="requestConsultation" class="col-lg-6 col-xl-5 offset-xl-1">
						<h2 class="text-color-dark font-weight-bold text-9 text-lg-end pb-2 mb-4 appear-animation" data-appear-animation="fadeInUpShorterPlus" data-appear-animation-delay="600">Envoyez nous un message</h2>

						<form class="contact-form custom-form-style-1 appear-animation" data-appear-animation="fadeInUpShorterPlus" data-appear-animation-delay="800" action="php/contact-form.php" method="POST">
							<div class="contact-form-success alert alert-success d-none mt-4">
								<strong>Succès!</strong> Votre demande a été envoyée.
							</div>

							<div class="contact-form-error alert alert-danger d-none mt-4">
								<strong>Erreur!</strong> Il y a eu une erreur lors de l'envoi de votre demande.
								<span class="mail-error-message text-1 d-block"></span>
							</div>

							<div class="row">
								<div class="form-group col mb-3">
									<input type="text" value="" data-msg-required="Veuillez entrer votre nom." maxlength="100" class="form-control" name="name" id="name" required placeholder="Nom *">
								</div>
							</div>
							<div class="row">
								<div class="form-group col mb-3">
									<input type="email" value="" data-msg-required="Veuillez entrer votre adresse email." data-msg-email="Veuillez entrer une adresse email valide." maxlength="100" class="form-control" name="email" id="email" required placeholder="E-mail *">
								</div>
							</div>
							<div class="row">
								<div class="form-group col mb-3">
									<input type="text" value="" data-msg-required="Veuillez entrer votre numéro de téléphone." maxlength="100" class="form-control" name="phone" id="phone" required placeholder="Téléphone *">
								</div>
							</div>
							<div class="row">
								<div class="form-group col mb-4">
									<textarea maxlength="5000" data-msg-required="Veuillez entrer votre message." rows="9" class="form-control" name="message" id="message" required placeholder="Message *"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="form-group col text-lg-end mb-0">
									<button type="submit" class="btn btn-primary font-weight-bold btn-px-5 btn-py-3 appear-animation" data-appear-animation="fadeInUpShorterPlus" data-appear-animation-delay="350" data-loading-text="Chargement...">DEMANDE DE CONSULTATION</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Footer -->
			<?php include './components/footer.php'; ?>
		</div>

		<?php include './components/scripts.php'; ?>

</body>

</html>