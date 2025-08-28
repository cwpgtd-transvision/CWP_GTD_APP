<%@ Page Language="C#" AutoEventWireup="true" CodeFile="widgets-stats.aspx.cs" Inherits="templates_Footer" %>


<!-- Simple statistics -->
<div class="mb-3">
	<h6 class="mb-0">Simple stats</h6>
	<span class="text-muted">Boxes with icons</span>
</div>

<div class="row">
	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center">
				<i class="ph-hand-pointing ph-2x text-success me-3"></i>

				<div class="flex-fill text-end">
					<h4 class="mb-0">652,549</h4>
					<span class="text-muted">total clicks</span>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center">
				<i class="ph-users-three ph-2x text-indigo me-3"></i>

				<div class="flex-fill text-end">
					<h4 class="mb-0">245,382</h4>
					<span class="text-muted">total visits</span>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center">
				<div class="flex-fill">
					<h4 class="mb-0">54,390</h4>
					<span class="text-muted">total comments</span>
				</div>

				<i class="ph-chats ph-2x text-primary ms-3"></i>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center">
				<div class="flex-fill">
					<h4 class="mb-0">389,438</h4>
					<span class="text-muted">total orders</span>
				</div>

				<i class="ph-package ph-2x text-danger ms-3"></i>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-primary text-white">
			<div class="d-flex align-items-center">
				<div class="flex-fill">
					<h4 class="mb-0">54,390</h4>
					total comments
				</div>

				<i class="ph-chats ph-2x opacity-75 ms-3"></i>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-danger text-white">
			<div class="d-flex align-items-center">
				<div class="flex-fill">
					<h4 class="mb-0">389,438</h4>
					total orders
				</div>

				<i class="ph-package ph-2x opacity-75 ms-3"></i>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-success text-white">
			<div class="d-flex align-items-center">
				<i class="ph-hand-pointing ph-2x opacity-75 me-3"></i>

				<div class="flex-fill text-end">
					<h4 class="mb-0">652,549</h4>
					total clicks
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-indigo text-white">
			<div class="d-flex align-items-center">
				<i class="ph-users-three ph-2x opacity-75 me-3"></i>

				<div class="flex-fill text-end">
					<h4 class="mb-0">245,382</h4>
					total visits
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /simple statistics -->


<!-- Statistics with progress bar -->
<div class="mb-3 pt-2">
	<h6 class="mb-0">Progress stats</h6>
	<span class="text-muted">Boxes with progress bars</span>
</div>

<div class="row">
	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center mb-3">
				<div class="flex-fill">
					<h6 class="mb-0">Server maintenance</h6>
					<span class="text-muted">Until 1st of June</span>
				</div>

				<i class="ph-gear ph-2x text-indigo opacity-75 ms-3"></i>
			</div>

			<div class="progress mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-indigo" style="width: 67%"></div>
			</div>

			<div>
				<span class="float-end">67%</span>
				Re-indexing
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center mb-3">
				<div class="flex-fill">
					<h6 class="mb-0">Services status</h6>
					<span class="text-muted">April, 19th</span>
				</div>

				<i class="ph-activity ph-2x text-danger opacity-75 ms-3"></i>
			</div>

			<div class="progress mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-danger" style="width: 80%"></div>
			</div>
				                
			<div>
				<span class="float-end">80%</span>
				Partly operational
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center mb-3">
				<i class="ph-gear ph-2x text-primary opacity-75 me-3"></i>

				<div class="flex-fill">
					<h6 class="mb-0">Server maintenance</h6>
					<span class="text-muted">Until 1st of June</span>
				</div>
			</div>

			<div class="progress mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-primary" style="width: 67%"></div>
			</div>
				                
			<div>
				<span class="float-end">67%</span>
				Re-indexing
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body">
			<div class="d-flex align-items-center mb-3">
				<i class="ph-activity ph-2x text-success opacity-75 me-3"></i>

				<div class="flex-fill">
					<h6 class="mb-0">Services status</h6>
					<span class="text-muted">April, 19th</span>
				</div>
			</div>

			<div class="progress mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-success" style="width: 80%"></div>
			</div>
				                
			<div>
				<span class="float-end">80%</span>
				Partly operational
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-primary text-white">
			<div class="d-flex align-items-center mb-3">
				<div class="flex-fill">
					<h6 class="mb-0">Server maintenance</h6>
					<span class="opacity-75">Until 1st of June</span>
				</div>

				<i class="ph-gear ph-2x ms-3"></i>
			</div>

			<div class="progress bg-primary mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-white" style="width: 67%"></div>
			</div>

			<div>
				<span class="float-end">67%</span>
				Re-indexing
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-danger text-white">
			<div class="d-flex align-items-center mb-3">
				<div class="flex-fill">
					<h6 class="mb-0">Services status</h6>
					<span class="opacity-75">April, 19th</span>
				</div>

				<i class="ph-activity ph-2x ms-3"></i>
			</div>

			<div class="progress bg-danger mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-white" style="width: 80%"></div>
			</div>

			<div>
				<span class="float-end">80%</span>
				Partly operational
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-success text-white">
			<div class="d-flex align-items-center mb-3">
				<i class="ph-gear ph-2x me-3"></i>

				<div class="flex-fill">
					<h6 class="mb-0">Server maintenance</h6>
					<span class="opacity-75">Until 1st of June</span>
				</div>
			</div>

			<div class="progress bg-success mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-white" style="width: 67%"></div>
			</div>

			<div>
				<span class="float-end">67%</span>
				Re-indexing
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-xl-3">
		<div class="card card-body bg-indigo text-white">
			<div class="d-flex align-items-center mb-3">
				<i class="ph-activity ph-2x me-3"></i>

				<div class="flex-fill">
					<h6 class="mb-0">Services status</h6>
					<span class="opacity-75">April, 19th</span>
				</div>
			</div>

			<div class="progress bg-indigo mb-2" style="height: 0.125rem;">
				<div class="progress-bar bg-white" style="width: 80%"></div>
			</div>

			<div>
				<span class="float-end">80%</span>
				Partly operational
			</div>
		</div>
	</div>
</div>
<!-- /statistics with progress bar -->

				