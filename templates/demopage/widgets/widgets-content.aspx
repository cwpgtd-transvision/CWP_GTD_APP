<%@ Page Language="C#" AutoEventWireup="true" CodeFile="widgets-content.aspx.cs" Inherits="templates_Footer" %>
<!-- Widgets list -->
<div class="row">
	<div class="col-lg-6 col-xl-3">

		<!-- User details (with sample pattern) -->
		<div class="card">
			<div class="card-body bg-primary text-white text-center card-img-top" style="background-image: url(../../../assets/images/backgrounds/panel_bg.png); background-size: contain;">
				<div class="card-img-actions d-inline-block mb-3">
					<img class="img-fluid rounded-circle" src="../../../assets/images/demo/users/face6.jpg" width="170" height="170" alt="">
					<div class="card-img-actions-overlay card-img rounded-circle">
						<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
							<i class="ph-plus"></i>
						</a>
						<a href="user_pages_profile.html" class="btn btn-outline-white btn-icon rounded-pill ms-2">
							<i class="ph-link"></i>
						</a>
					</div>
				</div>

				<h6 class="mb-0">Victoria Davidson</h6>
				<span class="opacity-75">Head of UX</span>

				<ul class="list-inline list-inline-condensed mt-3 mb-0">
					<li class="list-inline-item">
						<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
							<i class="ph-github-logo"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
							<i class="ph-twitter-logo"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
							<i class="ph-gitlab-logo"></i>
						</a>
					</li>
				</ul>
			</div>

			<div class="card-body border-top-0">
				<div class="d-sm-flex flex-sm-wrap mb-3">
					<div class="fw-semibold">Full name:</div>
					<div class="ms-sm-auto mt-1 mt-sm-0">Victoria Anna Davidson</div>
				</div>

				<div class="d-sm-flex flex-sm-wrap mb-3">
					<div class="fw-semibold">Phone number:</div>
					<div class="ms-sm-auto mt-1 mt-sm-0">+3630 8911837</div>
				</div>

				<div class="d-sm-flex flex-sm-wrap mb-3">
					<div class="fw-semibold">Corporate Email:</div>
					<div class="ms-sm-auto mt-1 mt-sm-0"><a href="#">corporate@domain.com</a></div>
				</div>

				<div class="d-sm-flex flex-sm-wrap">
					<div class="fw-semibold">Personal Email:</div>
					<div class="ms-sm-auto mt-1 mt-sm-0"><a href="#">personal@domain.com</a></div>
				</div>
			</div>
		</div>
		<!-- /user details (with sample pattern) -->


		<!-- My messages -->
		<div class="card">

			<!-- Card heading -->
			<div class="card-header d-flex border-bottom-0">
				<h6 class="mb-0">Today's stats</h6>

				<div class="ms-auto">
					<span><i class="ph-arrow-down text-danger"></i> <span class="fw-semibold">- 29.4%</span></span>
				</div>
			</div>
			<!-- /card heading -->


			<!-- Area chart -->
			<div id="messages-stats"></div>
			<!-- /area chart -->


			<!-- Tabs nav -->
			<ul class="nav nav-tabs nav-tabs-underline nav-justified mb-0">
				<li class="nav-item">
					<a href="#today" class="nav-link active" data-bs-toggle="tab">
						Today
					</a>
				</li>

				<li class="nav-item">
					<a href="#yesterday" class="nav-link" data-bs-toggle="tab">
						Yesterday
					</a>
				</li>
			</ul>
			<!-- /tabs nav -->


			<!-- Tabs content -->
			<div class="tab-content card-body">
				<div class="tab-pane fade show active" id="today">
					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face1.jpg" class="rounded-circle" width="40" jeight="40" alt="">
							<span class="status-indicator bg-success"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">James Alexander</a>
								<span class="fs-sm text-muted">14:58</span>
							</div>

							The constitutionally inventoried precariously...
						</div>
					</div>

					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face3.jpg" class="rounded-circle" width="40" jeight="40" alt="">
							<span class="status-indicator bg-success"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Margo Baker</a>
								<span class="fs-sm text-muted">12:16</span>
							</div>

							Pinched a well more moral chose goodness...
						</div>
					</div>

					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face25.jpg" class="rounded-circle" width="40" jeight="40" alt="">
							<span class="status-indicator bg-danger"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Jeremy Victorino</a>
								<span class="fs-sm text-muted">09:48</span>
							</div>

							Pert thickly mischievous clung frowned well...
						</div>
					</div>

					<div class="d-flex align-items-start">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face4.jpg" class="rounded-circle" width="40" jeight="40" alt="">
							<span class="status-indicator bg-warning"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Beatrix Diaz</a>
								<span class="fs-sm text-muted">05:54</span>
							</div>

							Nightingale taped hello bucolic fussily cardinal...
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="yesterday">
					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face2.jpg" class="rounded-circle" width="40" height="40" alt="">
							<span class="status-indicator bg-success"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Isak Temes</a>
								<span class="fs-sm text-muted">19:58</span>
							</div>

							Reasonable palpably rankly expressly grimy...
						</div>
					</div>

					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face7.jpg" class="rounded-circle" width="40" height="40" alt="">
							<span class="status-indicator bg-danger"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Vittorio Cosgrove</a>
								<span class="fs-sm text-muted">16:35</span>
							</div>

							Arguably therefore more unexplainable fumed...
						</div>
					</div>

					<div class="d-flex align-items-start mb-3">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face18.jpg" class="rounded-circle" width="40" height="40" alt="">
							<span class="status-indicator bg-success"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Hilary Talaugon</a>
								<span class="fs-sm text-muted">12:16</span>
							</div>

							Nicely unlike porpoise a kookaburra past more...
						</div>
					</div>

					<div class="d-flex align-items-start">
						<div class="status-indicator-container me-3">
							<img src="../../../assets/images/demo/users/face14.jpg" class="rounded-circle" width="40" height="40" alt="">
							<span class="status-indicator bg-success"></span>
						</div>

						<div class="flex-fill">
							<div class="d-flex justify-content-between">
								<a href="#">Bobbie Seber</a>
								<span class="fs-sm text-muted">09:20</span>
							</div>

							Before visual vigilantly fortuitous tortoise...
						</div>
					</div>
				</div>
			</div>
			<!-- /tabs content -->

		</div>
		<!-- /my messages -->


		<!-- Course widget -->
		<div class="card">
			<div class="card-img-actions mx-1 mt-1">
				<a href="#course_preview" class="d-inline-block position-relative" data-bs-toggle="modal">
					<img src="../../../assets/images/demo/flat/1.png" class="img-fluid card-img" alt="">
					<div class="d-inline-flex bg-dark bg-opacity-50 text-white position-absolute start-50 top-50 translate-middle rounded-pill p-2">
						<i class="ph-play"></i>
					</div>
					<span class="bg-dark bg-opacity-50 text-white fs-xs lh-1 rounded-1 position-absolute bottom-0 start-0 p-1 ms-2 mb-2">38:46</span>
				</a>
			</div>

			<div class="card-body">
				<div class="mb-3">
					<h6 class="d-flex flex-nowrap mb-0">
						<a href="#" class="me-2">Data Governance</a>
						<span class="text-success ms-auto">$49.99</span>
					</h6>

					<ul class="list-inline list-inline-bullet text-muted mb-0">
						<li class="list-inline-item">By <a href="#" class="text-body">Eugene Kopyov</a></li>
					</ul>
				</div>

				One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed <a href="#">[...]</a>
			</div>

			<div class="card-footer d-flex justify-content-between align-items-center">
				<ul class="list-inline mb-0">
					<li class="list-inline-item"><i class="ph-users me-1"></i> 382</li>
				</ul>

				<div>
					<i class="ph-star fs-base lh-base align-top text-warning"></i>
					<i class="ph-star fs-base lh-base align-top text-warning"></i>
					<i class="ph-star fs-base lh-base align-top text-warning"></i>
					<i class="ph-star fs-base lh-base align-top text-warning"></i>
					<i class="ph-star fs-base lh-base align-top text-warning"></i>
					<span class="text-muted ms-1">(49)</span>
				</div>
			</div>
		</div>
		<!-- /course widget -->


		<!-- List of latest updates -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">Latest updates</h5>

				<div class="ms-auto">
					<a href="#">All updates</a>
				</div>
			</div>

			<div class="card-body">
				<div class="d-flex mb-3">
					<div class="me-3">
						<div class="bg-success bg-opacity-10 text-success lh-1 rounded-pill p-2">
							<i class="ph-arrow-clockwise"></i>
						</div>
					</div>
					<div class="flex-fill">
						<a href="#">David Linner</a> requested refund for a double card charge
						<div class="text-muted fs-sm">12 minutes ago</div>
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<div class="bg-secondary bg-opacity-10 text-secondary lh-1 rounded-pill p-2">
							<i class="ph-infinity"></i>
						</div>
					</div>
					<div class="flex-fill">
						User <a href="#">Christopher Wallace</a> is awaiting for staff reply
						<div class="text-muted fs-sm">16 minutes ago</div>
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<div class="bg-success bg-opacity-10 text-success lh-1 rounded-pill p-2">
							<i class="ph-money"></i>
						</div>
					</div>
					<div class="flex-fill">
						All sellers have received monthly payouts
						<div class="text-muted fs-sm">4 hours ago</div>
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<div class="bg-danger bg-opacity-10 text-danger lh-1 rounded-pill p-2">
							<i class="ph-check"></i>
						</div>
					</div>
					<div class="flex-fill">
						Ticket #43683 has been closed by <a href="#">Victoria Wilson</a>
						<div class="text-muted fs-sm">Apr 28, 21:39</div>
					</div>
				</div>

				<div class="d-flex">
					<div class="me-3">
						<div class="bg-primary bg-opacity-10 text-primary lh-1 rounded-pill p-2">
							<i class="ph-chats"></i>
						</div>
					</div>
					<div class="flex-fill">
						<a href="#">Beatrix Diaz</a> left a new feedback for Camo backpack
						<div class="text-muted fs-sm">Mar 30, 05:46</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /list of latest updates -->


		<!-- Card with image and button -->
		<div class="card">
			<div class="card-img-actions mx-1 mt-1">
				<img class="card-img img-fluid" src="../../../assets/images/demo/flat/17.png" alt="">
				<div class="card-img-actions-overlay card-img">
					<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
						<i class="ph-user"></i>
					</a>

					<a href="#" class="btn btn-outline-white btn-icon rounded-pill ms-2">
						<i class="ph-chats"></i>
					</a>
				</div>
			</div>

			<div class="card-body text-center">
				<h6 class="card-title">Monica Richardson</h6>
				<p class="text-muted mb-3">In on my jointure horrible margaret suitable he followed speedily</p>
				<a href="#" class="btn btn-indigo">
					<i class="ph-link me-2"></i>
					Find out more
				</a>
			</div>
		</div>
		<!-- /card with image and button -->


		<!-- Messages widget -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">Messages</h5>

				<div class="ms-auto">
					<a href="#" class="text-body">
						<i class="ph-gear"></i>
					</a>
				</div>
			</div>

			<div class="card-body">
				<div class="d-flex align-items-start mb-3">
					<div class="me-3 position-relative">
						<img src="../../../assets/images/demo/users/face10.jpg" class="rounded-circle" width="40" jeight="40" alt="">
						<span class="badge bg-primary position-absolute top-0 start-100 translate-middle rounded-pill">5</span>
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between align-items-center">
							<div class="fw-semibold"><a href="#">James Alexander</a></div>
							<span class="fs-sm text-muted">14:58</span>
						</div>

						Who knows, maybe that would be the best thing for me...
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<div class="me-3 position-relative">
						<img src="../../../assets/images/demo/users/face3.jpg" class="rounded-circle" width="40" jeight="40" alt="">
						<span class="badge bg-primary position-absolute top-0 start-100 translate-middle rounded-pill">4</span>
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between align-items-center">
							<div class="fw-semibold"><a href="#">Margo Baker</a></div>
							<span class="fs-sm text-muted">12:16</span>
						</div>

						That was something he was unable to do because...
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<div class="me-3">
						<img src="../../../assets/images/demo/users/face24.jpg" class="rounded-circle" width="40" jeight="40" alt="">
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between align-items-center">
							<div class="fw-semibold"><a href="#">Jeremy Victorino</a></div>
							<span class="fs-sm text-muted">22:48</span>
						</div>

						But that would be extremely strained and suspicious...
					</div>
				</div>

				<div class="d-flex align-items-start">
					<div class="me-3">
						<img src="../../../assets/images/demo/users/face4.jpg" class="rounded-circle" width="40" jeight="40" alt="">
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between align-items-center">
							<div class="fw-semibold"><a href="#">Beatrix Diaz</a></div>
							<span class="fs-sm text-muted">Tue</span>
						</div>

						What a strenuous career it is that I've chosen...
					</div>
				</div>
			</div>
		</div>
		<!-- /messages widget -->


		<!-- Simple thumbnail with image -->
		<div class="card">
			<div class="card-img-actions mx-1 mt-1">
				<a href="#course_preview" class="d-inline-block position-relative" data-bs-toggle="modal">
					<img src="../../../assets/images/demo/flat/10.png" class="img-fluid card-img" alt="">
					<div class="d-inline-flex bg-dark bg-opacity-50 text-white position-absolute start-50 top-50 translate-middle rounded-pill p-2">
						<i class="ph-play"></i>
					</div>
					<span class="bg-dark bg-opacity-50 text-white fs-xs lh-1 rounded-1 position-absolute bottom-0 start-0 p-1 ms-2 mb-2">50:20</span>
				</a>
			</div>

			<div class="card-body">
				Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men two discretion...
			</div>

			<div class="card-footer d-flex justify-content-between">
				<span class="text-muted">Updated: Apr 25th</span>

				<ul class="list-inline mb-0">
					<li class="list-inline-item"><a href="#">Edit</a></li>
					<li class="list-inline-item"><a href="#">Delete</a></li>
				</ul>
			</div>
		</div>
		<!-- /simple thumbnail with image -->

	</div>

	<div class="col-lg-6 col-xl-3">

		<!-- Simple inline block with icon and button -->
		<div class="card card-body">
			<div class="d-lg-flex align-items-lg-center text-center text-lg-start">
				<i class="ph-lifebuoy bg-success bg-opacity-10 text-success lh-1 rounded-pill p-2 me-lg-3 mb-3 mb-lg-0"></i>

				<div class="flex-fill">
					<h6 class="mb-0">Got a question request?</h6>
					<a href="#">Contact us</a> directly anytime
				</div>
			</div>
		</div>
		<!-- /simple inline block with icon and button -->


		<!-- Support ticket widget -->
		<div class="card">
			<div class="card-body">
				<div class="d-flex flex-wrap justify-content-between mb-2">
					<span class="fs-sm lh-sm text-uppercase text-muted fw-semibold">Nov 12, 11:25am</span>
					<span class="fs-sm lh-sm text-uppercase text-success fw-semibold">Due in 12 days</span>
				</div>

				<h6 class="pt-1">
					<a href="#">Ticket #462 - Application design and development</a>
				</h6>

				<p class="mb-3">The constitutionally inventoried precariously. Pinched a well more moral chose goodness...</p>

				<div class="d-flex flex-wrap align-items-center">
					<a href="#" class="me-1">
						<img src="../../../assets/images/demo/users/face1.jpg" class="rounded-pill" width="36" height="36" alt="">
					</a>
					<a href="#" class="me-1">
						<img src="../../../assets/images/demo/users/face24.jpg" class="rounded-pill" width="36" height="36" alt="">
					</a>
					<a href="#" class="me-1">
						<img src="../../../assets/images/demo/users/face11.jpg" class="rounded-pill" width="36" height="36" alt="">
					</a>
					<a href="#" class="btn btn-light btn-icon rounded-pill"><i class="ph-plus"></i></a>
				</div>
			</div>
		</div>
		<!-- /support ticket widget -->


		<!-- Thumbnail with social icons -->
		<div class="card">
			<div class="card-img-actions">
				<img class="card-img-top img-fluid" src="../../../assets/images/demo/users/face3.jpg" alt="">
				<div class="card-img-actions-overlay card-img-top">
					<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
						<i class="ph-plus"></i>
					</a>
					<a href="user_pages_profile.html" class="btn btn-outline-white btn-icon rounded-pill ms-2">
						<i class="ph-link"></i>
					</a>
				</div>
			</div>

			<div class="card-body text-center">
				<h6 class="mb-0">Margo Baker</h6>
				<span class="text-muted">Sales manager</span>

				<div class="d-flex justify-content-center mt-3">
					<a href="#" class="link-pink" data-bs-popup="tooltip" title="" data-bs-original-title="Dribbble">
						<i class="ph-dribbble-logo"></i>
					</a>
					<a href="#" class="link-info mx-2" data-bs-popup="tooltip" title="" data-bs-original-title="Twitter">
						<i class="ph-twitter-logo"></i>
					</a>
					<a href="#" class="link-indigo" data-bs-popup="tooltip" title="" data-bs-original-title="Teams">
						<i class="ph-microsoft-teams-logo"></i>
					</a>
				</div>
			</div>
		</div>
		<!-- /thumbnail with social icons -->


		<!-- Share your thoughts -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">Share your thoughts</h5>

				<div class="dropdown ms-auto">
					<a href="#" class="text-body" data-bs-toggle="dropdown">
						<i class="ph-list"></i>
					</a>

					<div class="dropdown-menu dropdown-menu-end">
						<a href="#" class="dropdown-item">
							<i class="ph-square-half me-2"></i>
							Notifications
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-file-video me-2"></i>
							Embed video
						</a>
						<a href="#" class="dropdown-item">
							<i class="ph-map-pin me-2"></i>
							Show location
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="ph-gear me-2"></i>
							Settings
						</a>
					</div>
				</div>
			</div>

			<div class="card-body">
				<form action="#">
				    <textarea name="enter-message" class="form-control mb-3" rows="3" cols="1" placeholder="Enter your message..."></textarea>

				    <div class="d-flex align-items-center">
						<div>
							<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Formatting">
								<i class="ph-text-aa"></i>
							</a>
							<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Emoji">
								<i class="ph-smiley"></i>
							</a>
							<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Send file">
								<i class="ph-paperclip"></i>
							</a>
						</div>

						<button type="button" class="btn btn-primary ms-auto">
							Submit
							<i class="ph-paper-plane-tilt ms-2"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /share your thoughts -->


		<!-- Inline user card -->
		<div class="card card-body flex-row">
			<a href="#" class="me-3">
				<img src="../../../assets/images/demo/users/face8.jpg" class="rounded-circle" width="44" height="44" alt="">
			</a>

			<div class="flex-fill">
				<h6 class="mb-0">William Brenson</h6>
				<span class="text-muted">Chief officer</span>
			</div>

			<div class="dropdown align-self-center ms-3">
				<a href="#" class="text-body" data-bs-toggle="dropdown">
					<i class="ph-list"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-end">
					<a href="#" class="dropdown-item">
						<i class="ph-chats me-2"></i>
						Start chat
					</a>
					<a href="#" class="dropdown-item">
						<i class="ph-phone me-2"></i>
						Make a call
					</a>
					<a href="#" class="dropdown-item">
						<i class="ph-envelope me-2"></i>
						Send mail
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item">
						<i class="ph-chart-line me-2"></i>
						Statistics
					</a>
				</div>
			</div>
		</div>
		<!-- /inline user card -->


		<!-- Icon and text -->
		<div class="card card-body">
			<div class="d-flex">
				<div class="me-3">
					<a href="#"><i class="ph-file-pdf text-danger ph-2x mt-1"></i></a>
				</div>

				<div class="flex-fill">
					<h6 class="mb-0"><a href="#">Nutria and rewound</a></h6>
					Strove the darn hey as far oh alas and yikes and gosh knitted this slept via gerbil baneful
				</div>
			</div>
		</div>
		<!-- /icon and text -->


		<!-- My tasks -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">My Tasks</h5>

				<div class="ms-auto">
					<span class="badge bg-indigo">43 new</span>
				</div>
			</div>

			<div class="card-body">
				<div class="d-flex mb-3">
					<div class="me-3">
						<input type="checkbox" class="form-check-input" id="task1" checked>
					</div>

					<div class="flex-fill">
						<h6 class="mb-0">
							<label for="task1" class="fw-semibold cursor-pointer mb-0">Resplendent much during</label>
						</h6>

						Urchin that understood yikes special ladybug that
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<input type="checkbox" class="form-check-input" id="task2">
					</div>

					<div class="flex-fill">
						<h6 class="mb-0">
							<label for="task2" class="fw-semibold cursor-pointer mb-0">Insect far hound</label>
						</h6>
											
						Hey where more that much meanly shivered salamander
					</div>
				</div>

				<div class="d-flex mb-3">
					<div class="me-3">
						<input type="checkbox" class="form-check-input" id="task3">
					</div>

					<div class="flex-fill">
						<h6 class="mb-0">
							<label for="task3" class="fw-semibold cursor-pointer mb-0">The him father parish</label>
						</h6>

						Reran sincere said monkey one slapped jeepers
					</div>
				</div>

				<div class="text-center mb-3">
					<a href="#">View completed tasks (16)</a>
				</div>

			    <div class="form-control form-control-content mb-3" contenteditable="" data-placeholder="Type your comment..."></div>

			    <div class="d-flex align-items-center">
					<div>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Formatting">
							<i class="ph-text-aa"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Emoji">
							<i class="ph-smiley"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="" data-bs-original-title="Send file">
							<i class="ph-paperclip"></i>
						</a>
					</div>

					<button type="button" class="btn btn-primary ms-auto">Create task</button>
				</div>
			</div>
		</div>
		<!-- /my tasks -->


		<!-- Application status -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">App Status</h5>

				<div class="ms-auto">
					<div><span class="d-inline-block bg-success rounded-circle p-1 me-2"></span> Operational</div>
				</div>
			</div>

			<div class="card-body">
				<div class="mb-3">
					<div class="d-flex align-items-center mb-1">CPU usage <span class="text-muted ms-auto">50%</span></div>
					<div class="progress" style="height: 0.375rem;">
						<div class="progress-bar bg-info" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>

				<div class="mb-3">
					<div class="d-flex align-items-center mb-1">RAM usage <span class="text-muted ms-auto">70%</span></div>
					<div class="progress" style="height: 0.375rem;">
						<div class="progress-bar bg-danger" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>

				<div class="mb-3">
					<div class="d-flex align-items-center mb-1">Disc space <span class="text-muted ms-auto">80%</span></div>
					<div class="progress" style="height: 0.375rem;">
						<div class="progress-bar bg-success" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>

				<div>
					<div class="d-flex align-items-center mb-1">Bandwidth <span class="text-muted ms-auto">60%</span></div>
					<div class="progress" style="height: 0.375rem;">
						<div class="progress-bar bg-primary" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /application status -->


		<!-- Simple stats with thumbnail -->
		<div class="card">
			<a href="#" class="d-block mx-1 mt-1">
				<img src="../../../assets/images/demo/flat/19.png" class="img-fluid card-img" alt="">
			</a>

			<div class="card-body">
				<div class="row text-center">
					<div class="col-4">
						<h5 class="mb-0">2,345</h5>
						<span class="text-muted fs-sm">today</span>
					</div>

					<div class="col-4">
						<h5 class="mb-0">3,568</h5>
						<span class="text-muted fs-sm">this week</span>
					</div>

					<div class="col-4">
						<h5 class="mb-0">32,693</h5>
						<span class="text-muted fs-sm">overall</span>
					</div>
				</div>
			</div>
		</div>
		<!-- /simple stats with thumbnail -->


		<!-- Accordion widget -->
		<div class="card">
			<div class="accordion accordion-flush" id="accordion_flush">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#flush_item1">
							Accordion Item #1
						</button>
					</h2>
					<div id="flush_item1" class="accordion-collapse collapse show" data-bs-parent="#accordion_flush">
						<div class="accordion-body">
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush_item2">
							Accordion Item #2
						</button>
					</h2>
					<div id="flush_item2" class="accordion-collapse collapse" data-bs-parent="#accordion_flush">
						<div class="accordion-body">
							Тon cupidatat skateboard dolor brunch. Тesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda.
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush_item3">
							Accordion Item #3
						</button>
					</h2>
					<div id="flush_item3" class="accordion-collapse collapse" data-bs-parent="#accordion_flush">
						<div class="accordion-body">
							3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it.
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /accordion widget -->

	</div>

	<div class="col-lg-6 col-xl-3">

		<!-- Thumbnail with feed -->
		<div class="card">
			<a href="#" class="d-block mx-1 mt-1">
				<img src="../../../assets/images/demo/flat/18.png" class="img-fluid card-img" alt="">
			</a>

			<div class="card-body">
				<div class="list-feed">
					<div class="list-feed-item border-warning">
						<div class="text-muted fs-sm mb-1">12 minutes ago</div>
						<a href="#">David Linner</a> requested refund for a double card charge 
					</div>

					<div class="list-feed-item border-warning">
						<div class="text-muted fs-sm mb-1">12 minutes ago</div>
						User <a href="#">Christopher Wallace</a> is awaiting for staff reply
					</div>

					<div class="list-feed-item border-warning">
						<div class="text-muted fs-sm mb-1">12 minutes ago</div>
						Ticket <strong>#43683</strong> has been closed by <a href="#">Victoria Wilson</a>
					</div>

					<div class="list-feed-item border-warning">
						<div class="text-muted fs-sm mb-1">12 minutes ago</div>
						All sellers have received payouts for December!
					</div>
				</div>
			</div>
		</div>
		<!-- /thumbnail with feed -->


		<!-- Widget with rounded icon -->
		<div class="card">
			<div class="card-body text-center">
				<div class="d-inline-flex bg-success bg-opacity-10 text-success rounded-pill p-2 mb-3 mt-1">
					<i class="ph-book ph-2x m-1"></i>
				</div>
				<h5 class="card-title">Knowledge Base</h5>
				<p class="mb-3">Ouch found swore much dear conductively hid submissively hatchet vexed far inanimately alongside candidly much and jeez</p>
				<a href="#" class="btn btn-success mb-1">Browse articles</a>
			</div>
		</div>
		<!-- /widget with rounded icon -->


		<!-- Testimonials -->
		<div class="card bg-pink text-white text-center p-3" style="background-image: url(../../../assets/images/backgrounds/panel_bg.png); background-size: contain;">
			<div>
				<a href="#" class="btn btn-outline-white btn-lg btn-icon border-width-2 rounded-pill mb-3 mt-1">
					<i class="ph-quotes"></i>
				</a>
			</div>

			<blockquote class="blockquote mb-0">
				<p>"Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men two discretion"</p>
				<footer class="blockquote-footer text-white">
					<span>
						Someone famous in <cite title="Source Title">Source Title</cite>
					</span>
				</footer>
			</blockquote>
		</div>
		<!-- /testimonials -->


		<!-- Widget with inline medium sized thumbnail -->
		<div class="card card-body">
			<div class="d-sm-flex align-items-sm-start">
				<a href="#" class="d-inline-block position-relative me-sm-3 mb-3 mb-sm-0">
					<img src="../../../assets/images/demo/flat/1.png" class="flex-shrink-0 rounded" height="80" alt="">
					<div class="d-inline-flex bg-dark bg-opacity-50 text-white position-absolute start-50 top-50 translate-middle rounded-pill p-2">
						<i class="ph-play"></i>
					</div>
				</a>

		        <div class="flex-fill">
					<h6 class="mb-0"><a href="#">Up unpacked friendly</a></h6>
			        <ul class="list-inline list-inline-bullet text-muted mb-2">
			            <li class="list-inline-item">Video tutorials</li>
			        </ul>
					The him father parish looked has sooner. Attachment frequently son
				</div>
			</div>
		</div>
		<!-- /widget with inline medium sized thumbnail -->


		<!-- Subscription form -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h5 class="mb-0">Subscribe</h5>

				<div class="ms-auto">
					<label class="form-check form-switch form-check-reverse">
						<input type="checkbox" class="form-check-input" checked>
						<span class="form-check-label">Auto updates</span>
					</label>
				</div>
			</div>

			<form class="card-body" action="#">
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="Your email">
				</div>

				<div class="mb-3">
					<select class="form-select">
						<option value="0" disabled selected>Subscription plan</option>
						<option value="updates">Website updates</option>
						<option value="discounts">Discount offers</option>
						<option value="catalog">Catalog</option>
						<option value="prints">Prints</option>
						<option value="promo">Promotions</option>
					</select>
				</div>

				<div class="mb-3">
					<textarea class="form-control" cols="3" rows="3" placeholder="Your message"></textarea>
				</div>

				<div class="d-flex align-items-center">
					<label class="form-check">
						<input type="checkbox" class="form-check-input" checked>
						<span class="form-check-label">Accept terms</span>
					</label>

			        <button type="button" class="btn btn-primary ms-auto">Subscribe</button>
			    </div>
			</form>
		</div>
		<!-- /subscription form -->


		<!-- Tabs widget -->
		<div class="card">
			<ul class="nav nav-tabs nav-tabs-underline nav-justified mb-0">
				<li class="nav-item"><a href="#tab-desc" class="nav-link active" data-bs-toggle="tab">Overview</a></li>
				<li class="nav-item"><a href="#tab-spec" class="nav-link" data-bs-toggle="tab">Specs</a></li>
				<li class="nav-item"><a href="#tab-shipping" class="nav-link" data-bs-toggle="tab">Shipping</a></li>
			</ul>

			<div class="tab-content card-body">
				<div class="tab-pane fade show active" id="tab-desc">
					Aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthet.
				</div>

				<div class="tab-pane fade" id="tab-spec">
					Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
				</div>

				<div class="tab-pane fade" id="tab-shipping">
					DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg whatever.
				</div>
			</div>
		</div>
		<!-- /tabs widget -->


		<!-- User card with thumb and social icons at the bottom -->
		<div class="card">
			<div class="card-body text-center">
				<div class="card-img-actions d-inline-block mb-3">
					<img class="img-fluid rounded-circle" src="../../../assets/images/demo/users/face2.jpg" width="170" height="170" alt="">
					<div class="card-img-actions-overlay card-img rounded-circle">
						<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
							<i class="ph-plus"></i>
						</a>
						<a href="user_pages_profile.html" class="btn btn-outline-white btn-icon rounded-pill ms-2">
							<i class="ph-link"></i>
						</a>
					</div>
				</div>

				<h6 class="mb-0">Nathan Jacobson</h6>
				<span class="text-muted">Lead UX designer</span>
			</div>

			<div class="card-footer d-flex justify-content-around text-center p-0">
				<a href="#" class="text-body flex-fill p-2" data-bs-popup="tooltip" title="Figma">
					<i class="ph-figma-logo"></i>
				</a>
				<a href="#" class="text-body flex-fill p-2" data-bs-popup="tooltip" title="Twitter">
					<i class="ph-twitter-logo"></i>
				</a>
				<a href="#" class="text-body flex-fill p-2" data-bs-popup="tooltip" title="Github">
					<i class="ph-github-logo"></i>
				</a>
				<a href="#" class="text-body flex-fill p-2" data-bs-popup="tooltip" title="Dribbble">
					<i class="ph-dribbble-logo"></i>
				</a>
			</div>
		</div>
		<!-- /user card with thumb and social icons at the bottom -->


		<!-- Thumbnail with linked title -->
		<div class="card">
			<div class="card-img-actions mx-1 mt-1">
				<img class="card-img img-fluid" src="../../../assets/images/demo/flat/15.png" alt="">
				<div class="card-img-actions-overlay card-img">
					<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
						<i class="ph-user"></i>
					</a>

					<a href="#" class="btn btn-outline-white btn-icon rounded-pill ms-2">
						<i class="ph-chats"></i>
					</a>
				</div>
			</div>

			<div class="card-body">
				<h6 class="card-title"><a href="#">So come must</a></h6>
				<span>Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men two discretion...</span>
			</div>
		</div>
		<!-- /thumbnail with linked title -->


		<!-- List of files -->
		<div class="card">
			<div class="card-header d-flex">
				<h5 class="mb-0">
					<i class="ph-folder me-2"></i>
					Downloaded files
				</h5>

				<div class="ms-auto">
					<span class="text-muted">(93)</span>
				</div>
			</div>

			<div class="list-group list-group-borderless py-2">
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-file-pdf me-3"></i>
					Hello_exotic_staunch.pdf <span class="badge bg-success ms-auto">New</span>
				</a>

				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-file-doc me-3"></i>
					That_well_ecstatically.docx
				</a>

				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-file-csv me-3"></i>
					Shared_coast_concurrent.csv
					<span class="badge badge-secondary ml-auto">Draft</span>
				</a>

				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-file-doc me-3"></i>
					Into_intrepid_belated.docx
				</a>

				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-arrow-right me-3"></i>
					Show all files (93)
				</a>
			</div>
		</div>
		<!-- /list of files -->


		<!-- Simple card with a list and button -->
		<div class="card">
			<div class="card-header">
				<h5 class="mb-0">Card with check list</h5>
			</div>

			<div class="card-body">
				<p class="mb-3">The constitutionally inventoried precariously. Pinched a well more moral chose goodness...</p>

				<ul class="list list-unstyled mb-0">
					<li>
						<i class="ph-check-circle text-success me-2"></i>
						But that would be extremely strained
					</li>
					<li>
						<i class="ph-check-circle text-success me-2"></i>
						Who knows, maybe that would be the best
					</li>
					<li>
						<i class="ph-check-circle text-success me-2"></i>
						That was something he was unable to do
					</li>
					<li>
						<i class="ph-check-circle text-success me-2"></i>
						Way extensive and dejection get delivered
					</li>
				</ul>
			</div>

			<div class="card-footer d-flex align-items-center justify-content-between">
				<a href="#" class="btn btn-primary">
					<i class="ph-chats me-2"></i>
					Request demo
				</a>

				<a href="#">Dismiss</a>
			</div>
		</div>
		<!-- /simple card with a list and button -->

	</div>

	<div class="col-lg-6 col-xl-3">

		<!-- Seamless vertical button group -->
		<div class="mb-3">
			<div class="row row-tile g-0">
				<div class="col">
					<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-top-start py-2">
						<i class="ph-app-store-logo text-primary ph-2x mb-1"></i>
						App store
					</button>

					<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-bottom-start py-2">
						<i class="ph-twitter-logo text-info ph-2x mb-1"></i>
						Twitter
					</button>
				</div>
									
				<div class="col">
					<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-top-end py-2">
						<i class="ph-dribbble-logo text-pink ph-2x mb-1"></i>
						Dribbble
					</button>

					<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-bottom-end py-2">
						<i class="ph-spotify-logo text-success ph-2x mb-1"></i>
						Spotify
					</button>
				</div>
			</div>
		</div>
		<!-- /seamless vertical button group -->


		<!-- Seamless horizontal button group -->
		<div class="mb-3">
			<div class="d-flex btn-group">
				<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-start py-2">
					<i class="ph-microsoft-teams-logo text-purple ph-2x mb-1"></i>
					Teams
				</button>

				<button type="button" class="btn btn-light w-100 flex-column rounded-0 py-2">
					<i class="ph-behance-logo text-primary ph-2x mb-1"></i>
					Behance
				</button>

				<button type="button" class="btn btn-light w-100 flex-column rounded-0 rounded-end py-2">
					<i class="ph-youtube-logo text-danger ph-2x mb-1"></i>
					Youtube
				</button>
			</div>									
		</div>
		<!-- /seamless horizontal button group -->


		<!-- Widget with centered text and colored icon -->
		<div class="card">
			<div class="card-body text-center">
				<i class="ph-angular-logo ph-3x text-danger mt-1 mb-3"></i>
				<h6>Angular</h6>
				<p class="mb-3">Inanimately alongside candidly much and jeez conductively hid submissively hatchet</p>
				<a href="#">Read more &rarr;</a>
			</div>
		</div>
		<!-- /widget with centered text and colored icon -->


		<!-- Colored info widget -->
		<div class="card card-body bg-pink text-white" style="background-image: url(../../../assets/images/backgrounds/panel_bg.png);">
			<div class="d-flex">
				<div class="me-3 align-self-center">
					<i class="ph-wave-sine ph-2x"></i>
				</div>

				<div class="flex-fill text-end">
					<h6 class="mb-0">Search Engine Optimization</h6>
					<span class="opacity-75">Grow visibility in organic search results</span>
				</div>
			</div>
		</div>
		<!-- /colored info widget -->


		<!-- Chat widget -->
		<div class="card">
			<div class="card-header">
				<h6 class="mb-0">Chatting with James</h6>
			</div>

			<div class="card-body">
				<div class="media-chat-scrollable mb-3">
					<div class="media-chat vstack gap-3">
						<div class="media-chat-item hstack align-items-start gap-3">
							<a href="#" class="d-block status-indicator-container">
								<img src="../../../assets/images/demo/users/face11.jpg" class="w-40px h-40px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>

							<div>
								<div class="media-chat-message">Tolerantly some understood this stubbornly after snarlingly</div>
								<div class="fs-sm text-muted mt-2">Wed, 4:20 pm</div>
							</div>
						</div>

						<div class="media-chat-item media-chat-item-reverse hstack align-items-start gap-3">
							<a href="#" class="d-block status-indicator-container">
								<img src="../../../assets/images/demo/users/face1.jpg" class="w-40px h-40px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>

							<div>
								<div class="media-chat-message">Satisfactorily strenuously while sleazily dear</div>
								<div class="fs-sm text-muted mt-2">
									<i class="ph-checks text-primary me-1"></i>
									2 hours ago
								</div>
							</div>
						</div>

						<div class="media-chat-item hstack align-items-start gap-3">
							<a href="#" class="d-block status-indicator-container">
								<img src="../../../assets/images/demo/users/face11.jpg" class="w-40px h-40px rounded-pill" alt="">
								<span class="status-indicator bg-success"></span>
							</a>

							<div class="align-self-center">
								<span class="fw-semibold">Victoria</span> is typing
								<div class="typing-indicator">
									<span></span>
									<span></span>
									<span></span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form-control form-control-content mb-3" contenteditable data-placeholder="Type message here and hit enter..."></div>

				<div class="d-flex align-items-center">
					<div>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Formatting">
							<i class="ph-text-aa"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Emoji">
							<i class="ph-smiley"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Send file">
							<i class="ph-paperclip"></i>
						</a>
					</div>

					<button type="button" class="btn btn-primary ms-auto">
						Send
						<i class="ph-paper-plane-tilt ms-2"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- /chat widget -->


		<!-- Thumbnail with comments and form -->
		<div class="card">
			<div class="card-img-actions mx-1 mt-1">
				<img class="card-img img-fluid" src="../../../assets/images/demo/flat/14.png" alt="">
				<div class="card-img-actions-overlay card-img">
					<a href="#" class="btn btn-outline-white btn-icon rounded-pill">
						<i class="ph-magnifying-glass-plus"></i>
					</a>
				</div>
			</div>

			<div class="card-body">
				<div class="d-flex align-items-start mb-3">
					<div class="status-indicator-container me-3">
						<img src="../../../assets/images/demo/users/face25.jpg" class="rounded-circle" width="40" jeight="40" alt="">
						<span class="status-indicator bg-success"></span>
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between">
							<a href="#">Eugene Smith</a>
							<span class="fs-sm text-muted">14:58</span>
						</div>

						Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men...
					</div>
				</div>

				<div class="d-flex align-items-start mb-3">
					<div class="status-indicator-container me-3">
						<img src="../../../assets/images/demo/users/face3.jpg" class="rounded-circle" width="40" jeight="40" alt="">
						<span class="status-indicator bg-success"></span>
					</div>

					<div class="flex-fill">
						<div class="d-flex justify-content-between">
							<a href="#">Amanda Baker</a>
							<span class="fs-sm text-muted">12:16</span>
						</div>

						Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men...
					</div>
				</div>

			    <textarea name="enter-message" class="form-control mb-3" rows="2" cols="1" placeholder="Add comment"></textarea>

				<div class="d-flex align-items-center">
					<div>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Formatting">
							<i class="ph-text-aa"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Emoji">
							<i class="ph-smiley"></i>
						</a>
						<a href="#" class="btn btn-light btn-icon border-transparent rounded-pill btn-sm me-1" data-bs-popup="tooltip" title="Send file">
							<i class="ph-paperclip"></i>
						</a>
					</div>

					<button type="button" class="btn btn-primary ms-auto">
						Submit
						<i class="ph-paper-plane-tilt ms-2"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- /thumbnail with comments and form -->


		<!-- Upload file widget -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h6 class="mb-0">Upload image</h6>

				<div class="ms-auto">
					<a href="#" class="text-body">
						<i class="ph-gear"></i>
					</a>
				</div>
			</div>

			<div class="card-body">
				<input type="file" class="form-control">
				<div class="form-text">Accepted formats: gif, png, jpg</div>
			</div>
		</div>
		<!-- /upload widget -->


		<!-- Login form -->
		<div class="card card-body">
			<div class="text-center mb-3">
				<a href="#" class="d-inline-block mt-1 mb-3">
					<img src="../../../assets/images/demo/users/face11.jpg" class="rounded-circle img-fluid" width="120" height="120" alt="">
				</a>

				<h5 class="mb-0">Login to your account</h5>
				<div class="text-muted">Enter your credentials below</div>
			</div>

			<form action="index.html">
				<div class="form-control-feedback form-control-feedback-start mb-3">
					<input type="text" class="form-control" placeholder="Username">
					<div class="form-control-feedback-icon">
						<i class="ph-user-circle"></i>
					</div>
				</div>

				<div class="form-control-feedback form-control-feedback-start mb-3">
					<input type="password" class="form-control" placeholder="Password">
					<div class="form-control-feedback-icon">
						<i class="ph-lock"></i>
					</div>
				</div>

				<div class="d-flex align-items-center">
			        <a href="login_password_recover.html">Forgot password?</a>

			        <button type="submit" class="btn btn-primary ms-auto">
			            Sign in
			            <i class="ph-sign-in ms-2"></i>
			        </button>
			    </div>
			</form>
		</div>
		<!-- /login form -->


		<!-- Simple info widget with icon -->
		<div class="card card-body">
			<div class="d-flex">
				<div class="flex-fill">
					<h6 class="mb-0">Mortgage and private loan</h6>
					<span class="text-muted">Standard rate is up to 4.5%</span>
				</div>

				<div class="ms-3 align-self-center">
					<i class="ph-house ph-2x text-purple"></i>
				</div>
			</div>
		</div>
		<!-- /simplw info widget with icon -->


		<!-- Navigation widget -->
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h6 class="mb-0">Navigation</h6>

				<div class="ms-auto">
					<a href="#" class="text-body">
						<i class="ph-wrench"></i>
					</a>
				</div>
			</div>

			<div class="list-group list-group-borderless py-2">
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-user-circle me-3"></i>
					My profile
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-coins me-3"></i>
					Balance
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-share-network me-3"></i>
					Connections
					<span class="badge bg-danger rounded-pill ms-auto">29</span>
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-calendar me-3"></i>
					Events
					<span class="badge bg-teal rounded-pill ms-auto">48</span>
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<i class="ph-gear me-3"></i>
					Account settings
				</a>
			</div>
		</div>
		<!-- /navigation widget -->


		<!-- Simple text stats with icons -->
		<div class="card card-body">
			<div class="row text-center">
				<div class="col-4">
					<p><i class="ph-users-three bg-info bg-opacity-10 text-info lh-1 rounded-pill p-2"></i></p>
					<h5 class="mb-0">2,345</h5>
					<span class="text-muted fs-sm">users</span>
				</div>

				<div class="col-4">
					<p><i class="ph-thumbs-up bg-warning bg-opacity-10 text-warning lh-1 rounded-pill p-2"></i></p>
					<h5 class="mb-0">3,568</h5>
					<span class="text-muted fs-sm">clicks</span>
				</div>

				<div class="col-4">
					<p><i class="ph-coins bg-success bg-opacity-10 text-success lh-1 rounded-pill p-2"></i></p>
					<h5 class="mb-0">$9,693</h5>
					<span class="text-muted fs-sm">revenue</span>
				</div>
			</div>
		</div>
		<!-- /simple text stats with icons -->


		<!-- Calendar widget -->
		<div class="card">
			<div class="form-control-datepicker datepicker-inline"></div>
		</div>
		<!-- /calendar widget -->

	</div>
</div>
<!-- /widgets list -->