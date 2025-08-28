<!-- Main navbar -->
<div class="navbar navbar-dark navbar-expand-lg navbar-static border-bottom border-bottom-white border-opacity-10">
	<div class="container-fluid">
		<div class="d-flex d-lg-none me-2">
			<button type="button" class="navbar-toggler sidebar-mobile-main-toggle rounded-pill">
				<i class="ph-list"></i>
			</button>
		</div>
		<%--<div class="navbar-brand flex-1 flex-lg-0">
				<a href="#" class="d-inline-flex align-items-center">
					 <img src="/assets/images/kptcl-logo.png" class="sidebar-logo-icon" alt="">
					<span class="sidebar-resize-hide ms-3 text-white d-none d-md-block"><b>GTD </b> </span>
				</a>
			</div>--%>


		<div class="navbar-brand flex-1 flex-lg-0">
			<a href="#" class="d-inline-flex align-items-center">
				<img src="/assets/images/KPCL_LOGO_1.png" class="sidebar-logo-icon" alt="GTD">
				<span class="sidebar-resize-hide ms-3 text-white d-none d-md-block"><b>KPCL-GTD</b></span>
			</a>
		</div>
<%--		<% Server.Execute("~/templates/header/NavbarSearch.aspx") %>--%>
		<ul class="nav hstack gap-sm-1 flex-row justify-content-end order-1 order-lg-2">

			<!-- DATE -->
			<li class="nav-item me-2">
			  <div class="v-middle d-inline-block position-relative">
				<i id="dateIcon" class="ph ph-calendar"></i>
				<span id="date" class="d-none d-lg-inline" aria-live="polite"></span>
				<span id="dateBadge" class="badge bg-dark position-absolute start-50 translate-middle-x mt-2 d-none d-lg-none"></span>
			  </div>
			</li>

			<!-- TIME -->
			<li class="nav-item custom-clock">
			  <div class="v-middle d-inline-block position-relative">
				<i id="timeIcon" class="ph ph-clock"></i>
				<span id="clock" class="d-none d-lg-inline"></span>
				<span id="timeBadge" class="badge bg-dark position-absolute start-50 translate-middle-x mt-2 d-none d-lg-none"></span>
			  </div>
			</li>
			<%--<li class="nav-item me-2"><div class="v-middle d-inline-block"><i class="ph ph-calendar"></i> <span id="date"></span></div></li>
			<li class="nav-item custom-clock"><div class="v-middle d-inline-block"><i class="ph ph-clock"></i> <span id="clock"></span></div></li>--%>


			<li class="navbar-nav-link navbar-nav-link-icon rounded-pill"><a href="javascript:void(0)" class="text-white" onclick="toggleFullscreen()"><i class="ph ph-arrows-out"></i></a></li>
			<%--<li class="nav-item d-lg-none">
				<a href="#navbar_search" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="collapse">
					<i class="ph-magnifying-glass"></i>
				</a>
			</li>--%>
		<%--	<% Server.Execute("~/templates/header/NavbarBrowse.aspx") %>--%>
			<%--<li class="nav-item nav-item-dropdown-lg dropdown">
					<a href="#" class="navbar-nav-link navbar-nav-link-icon rounded-pill" data-bs-toggle="dropdown" data-bs-auto-close="outside">
						<i class="ph-chats"></i>
						<span class="badge bg-yellow text-black position-absolute top-0 end-0 translate-middle-top zindex-1 rounded-pill mt-1 me-1">8</span>
					</a>

					<div class="dropdown-menu wmin-lg-400 p-0">
						<div class="d-flex align-items-center p-3">
							<h6 class="mb-0">Messages</h6>
							<div class="ms-auto">
								<a href="#" class="text-body">
									<i class="ph-plus-circle"></i>
								</a>
								<a href="#search_messages" class="collapsed text-body ms-2" data-bs-toggle="collapse">
									<i class="ph-magnifying-glass"></i>
								</a>
							</div>
						</div>

						<div class="collapse" id="search_messages">
							<div class="px-3 mb-2">
								<div class="form-control-feedback form-control-feedback-start">
									<input type="text" class="form-control" placeholder="Search messages">
									<div class="form-control-feedback-icon">
										<i class="ph-magnifying-glass"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="dropdown-menu-scrollable pb-2">
							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="../../../assets/images/demo/users/face10.jpg" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-warning"></span>
								</div>

								<div class="flex-1">
									<span class="fw-semibold">James Alexander</span>
									<span class="text-muted float-end fs-sm">04:58</span>
									<div class="text-muted">who knows, maybe that would be the best thing for me...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="../../../assets/images/demo/users/face3.jpg" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-success"></span>
								</div>

								<div class="flex-1">
									<span class="fw-semibold">Margo Baker</span>
									<span class="text-muted float-end fs-sm">12:16</span>
									<div class="text-muted">That was something he was unable to do because...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="../../../assets/images/demo/users/face24.jpg" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-success"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Jeremy Victorino</span>
									<span class="text-muted float-end fs-sm">22:48</span>
									<div class="text-muted">But that would be extremely strained and suspicious...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="../../../assets/images/demo/users/face4.jpg" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-grey"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Beatrix Diaz</span>
									<span class="text-muted float-end fs-sm">Tue</span>
									<div class="text-muted">What a strenuous career it is that I've chosen...</div>
								</div>
							</a>

							<a href="#" class="dropdown-item align-items-start text-wrap py-2">
								<div class="status-indicator-container me-3">
									<img src="../../../assets/images/demo/users/face25.jpg" class="w-40px h-40px rounded-pill" alt="">
									<span class="status-indicator bg-danger"></span>
								</div>
								<div class="flex-1">
									<span class="fw-semibold">Richard Vango</span>
									<span class="text-muted float-end fs-sm">Mon</span>
									<div class="text-muted">Other travelling salesmen live a life of luxury...</div>
								</div>
							</a>
						</div>

						<div class="d-flex border-top py-2 px-3">
							<a href="#" class="text-body">
								<i class="ph-checks me-1"></i>
								Dismiss all
							</a>
							<a href="#" class="text-body ms-auto">
								View all
								<i class="ph-arrow-circle-right ms-1"></i>
							</a>
						</div>
					</div>
				</li>--%>
<%--			<% Server.Execute("~/templates/header/NavbarNotification.aspx") %>--%>
			<% Server.Execute("~/templates/header/NavbarUser.aspx") %>
		</ul>
	</div>
</div>

<!-- /main navbar -->