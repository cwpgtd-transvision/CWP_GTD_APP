<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DemoConfig.aspx.cs" Inherits="templates_DemoConfig" %>

<!-- Demo config -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="demo_config">
	<div class="position-absolute top-50 end-100 visible">
		<button type="button" class="btn btn-primary btn-icon translate-middle-y rounded-end-0" data-bs-toggle="offcanvas" data-bs-target="#demo_config">
			<i class="ph-gear"></i>
		</button>
	</div>

	<div class="offcanvas-header border-bottom py-0">
		<h5 class="offcanvas-title py-3">Demo configuration</h5>
		<button type="button" class="btn btn-light btn-sm btn-icon border-transparent rounded-pill" data-bs-dismiss="offcanvas">
			<i class="ph-x"></i>
		</button>
	</div>

	<div class="offcanvas-body">
		<div class="fw-semibold mb-2">Color mode</div>
		<div class="list-group mb-3">
			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-sun ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Light theme</span>
							<div class="fs-sm text-muted">Set light theme or reset to default</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="light" checked>
				</div>
			</label>

			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-moon ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Dark theme</span>
							<div class="fs-sm text-muted">Switch to dark theme</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="dark">
				</div>
			</label>

			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-translate ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Auto theme</span>
							<div class="fs-sm text-muted">Set theme based on system mode</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="auto">
				</div>
			</label>
			<!--<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-translate ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Background image theme</span>
							<div class="fs-sm text-muted">Background image</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="backgroundimg">
				</div>
			</label>--->
			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-translate ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Custom theme-1</span>
							<div class="fs-sm text-muted">Custom theme-1</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="customThemeOne">
				</div>
			</label>
			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-translate ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Custom theme-2</span>
							<div class="fs-sm text-muted">Custom theme-2</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="customThemeTwo">
				</div>
			</label>
			<label class="list-group-item list-group-item-action form-check border-width-1 rounded mb-2">
				<div class="d-flex flex-fill my-1">
					<div class="form-check-label d-flex me-2">
						<i class="ph-translate ph-lg me-2"></i>
						<div>
							<span class="fw-bold">Custom theme-3</span>
							<div class="fs-sm text-muted">Custom theme-3</div>
						</div>
					</div>
					<input type="radio" class="form-check-input cursor-pointer ms-auto" name="main-theme" value="customThemeThree">
				</div>
			</label>
		</div>
	</div>
</div>
<!-- /demo config -->
