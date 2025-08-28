<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Datatables.aspx.cs" Inherits="Datatables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<script src="../../../assets/js/vendor/tables/datatables/datatables.min.js"></script>
<script src="../../../assets/demo/pages/datatables_basic.js"></script>

<script src="../../../assets/demo/pages/datatables_sorting.js"></script>
<script src="../../../assets/demo/pages/datatables_data_sources.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Body Section--%>
    <%--Add Here All Form Stuff Code For Individual Form CodeNot Any Reference--%>


				<!-- Page header -->
				<div class="page-header">
					<div class="page-header-content d-lg-flex">
						<div class="d-flex">
							<h4 class="page-title mb-0">
								Home - <span class="fw-normal">Dashboard</span>
							</h4>

							<a href="#page_header" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
								<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
							</a>
						</div>

						<div class="collapse d-lg-block my-lg-auto ms-lg-auto" id="page_header">
							<div class="d-sm-flex align-items-center mb-3 mb-lg-0 ms-lg-3">
								<div class="d-inline-flex align-items-center">
									<a href="#" class="status-indicator-container ms-1">
										<img src="../../../assets/images/demo/users/face24.jpg" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-warning"></span>
									</a>
									<a href="#" class="status-indicator-container ms-1">
										<img src="../../../assets/images/demo/users/face1.jpg" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-success"></span>
									</a>
									<a href="#" class="status-indicator-container ms-1">
										<img src="../../../assets/images/demo/users/face3.jpg" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-danger"></span>
									</a>
									<a href="#" class="status-indicator-container ms-1">
										<img src="../../../assets/images/demo/users/face5.jpg" class="w-32px h-32px rounded-pill" alt="">
										<span class="status-indicator bg-success"></span>
									</a>

									<div class="vr flex-shrink-0 my-1 mx-3"></div>

									<a href="#" class="btn btn-primary btn-icon w-32px h-32px rounded-pill">
										<i class="ph-plus"></i>
									</a>

									<div class="dropdown ms-2">
										<a href="#" class="btn btn-light btn-icon w-32px h-32px rounded-pill" data-bs-toggle="dropdown">
											<i class="ph-dots-three-vertical"></i>
										</a>

										<div class="dropdown-menu dropdown-menu-end">
											<button type="button" class="dropdown-item">
												<i class="ph-briefcase me-2"></i>
												Customer details
											</button>
											<button type="button" class="dropdown-item">
												<i class="ph-folder-user me-2"></i>
												User directory
											</button>
											<button type="button" class="dropdown-item">
												<i class="ph-user-gear me-2"></i>
												Permissions
											</button>
											<div class="dropdown-divider"></div>
											<button type="button" class="dropdown-item">
												<i class="ph-users-four me-2"></i>
												Manage users
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content pt-0">
					
					<!-- Basic datatable -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Basic datatable</h5>
						</div>

						<div class="card-body">
							The <code>DataTables</code> is a highly flexible tool, based upon the foundations of progressive enhancement, and will add advanced interaction controls to any HTML table. DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function. Searching, ordering, paging etc goodness will be immediately added to the table, as shown in this example. <span class="fw-semibold">Datatables support all available table styling.</span>
						</div>

						<table class="table datatable-basic">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /basic datatable -->


					<!-- Pagination types -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Pagination types</h5>
						</div>

						<div class="card-body">
							The default page control (forward and backward buttons with up to 7 page numbers in-between) is fine for most situations, but in some cases you may wish to customise the options presented to the end user. This is done through DataTables' extensible pagination mechanism, the <code>pagingType</code> option. Supported pagination types are: <code>simple</code>, <code>simple_numbers</code>, <code>full</code> and <code>full_numbers</code>. This example shows <code>simple</code> pagination type.
						</div>

						<table class="table datatable-pagination">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /pagination types -->


					<!-- State saving -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">State saving</h5>
						</div>

						<div class="card-body">
							DataTables has the option of being able to <code>save the state</code> of a table: its paging position, ordering state etc., so that is can be restored when the user reloads a page, or comes back to the page after visiting a sub-page. This state saving ability is enabled by the <code>stateSave</code> option. The <code>duration</code> for which the saved state is valid can be set using the <code>stateDuration</code> initialisation parameter (2 hours by default).
						</div>

						<table class="table datatable-save-state">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /state saving -->


					<!-- Scrollable datatable -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Scrollable datatable</h5>
						</div>

						<div class="card-body">
							This example shows the DataTables table body <code>scrolling</code> in the <code>vertical</code> direction. This can generally be seen as an alternative method to pagination for displaying a large table in a fairly small vertical area, and as such pagination has been disabled here. Note that this is not mandatory, it will work just fine with pagination enabled as well!.
						</div>

						<table class="table datatable-scroll-y" width="100%">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-xls me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /scrollable datatable -->

					<!-- Default ordering -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Default ordering</h5>
						</div>

						<div class="card-body">
							With DataTables you can alter the ordering characteristics of the table at initialisation time. Using the <code>order</code> initialisation parameter, you can set the table to display the data in exactly the order that you want. The <code>order</code> parameter is an array of arrays where the first value of the inner array is the column to order on, and the second is <code>'asc'</code> or <code>'desc'</code> as required. The table below is ordered (descending) by the <code>DOB</code> column.
						</div>

						<table class="table datatable-sorting">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /default ordering -->


					<!-- Multi column ordering -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Multi column ordering</h5>
						</div>

						<div class="card-body">
							DataTables allows ordering by <code>multiple columns</code> at the same time, which can be activated in a number of different ways: - user shift click on a column; - on a per-column basis; - using the <code>columns.orderData</code> option. The example below shows the first column having a secondary order applied to the second column in the table, vice-versa for the second column being tied directly to the first and the salary column to the first name column.
						</div>

						<table class="table datatable-multi-sorting">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /multi column ordering -->


					<!-- Order direction sequence control -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Order direction sequence control</h5>
						</div>

						<div class="card-body">
							At times you may wish to change the default ordering direction sequence for columns to be <code>'descending'</code> rather than default <code>ascending</code>. This can be done through the use of the <code>columns.orderSequence</code> initialisation parameter. The example below shows: Columns 1, 2 - default ordering; Column 3 - ascending ordering only; Column 4 - descending ordering, followed by ascending and then ascending again; Column 5 - descending ordering only.
						</div>

						<table class="table datatable-sequence-control">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Job Title</th>
									<th>DOB</th>
									<th>Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Marth</td>
									<td><a href="#">Enright</a></td>
									<td>Traffic Court Referee</td>
									<td>22 Jun 1972</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Jackelyn</td>
									<td>Weible</td>
									<td><a href="#">Airline Transport Pilot</a></td>
									<td>3 Oct 1981</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Aura</td>
									<td>Hard</td>
									<td>Business Services Sales Representative</td>
									<td>19 Apr 1969</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Nathalie</td>
									<td><a href="#">Pretty</a></td>
									<td>Drywall Stripper</td>
									<td>13 Dec 1977</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sharan</td>
									<td>Leland</td>
									<td>Aviation Tactical Readiness Officer</td>
									<td>30 Dec 1991</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxine</td>
									<td><a href="#">Woldt</a></td>
									<td><a href="#">Business Services Sales Representative</a></td>
									<td>17 Oct 1987</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Sylvia</td>
									<td><a href="#">Mcgaughy</a></td>
									<td>Hemodialysis Technician</td>
									<td>11 Nov 1983</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Lizzee</td>
									<td><a href="#">Goodlow</a></td>
									<td>Technical Services Librarian</td>
									<td>1 Nov 1961</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Kennedy</td>
									<td>Haley</td>
									<td>Senior Marketing Designer</td>
									<td>18 Dec 1960</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Chantal</td>
									<td><a href="#">Nailor</a></td>
									<td>Technical Services Librarian</td>
									<td>10 Jan 1980</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Delma</td>
									<td>Bonds</td>
									<td>Lead Brand Manager</td>
									<td>21 Dec 1968</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Roland</td>
									<td>Salmos</td>
									<td><a href="#">Senior Program Developer</a></td>
									<td>5 Jun 1986</td>
									<td><span class="badge bg-secondary bg-opacity-10 text-secondary">Inactive</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Coy</td>
									<td>Wollard</td>
									<td>Customer Service Operator</td>
									<td>12 Oct 1982</td>
									<td><span class="badge bg-success bg-opacity-10 text-success">Active</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Maxwell</td>
									<td>Maben</td>
									<td>Regional Representative</td>
									<td>25 Feb 1988</td>
									<td><span class="badge bg-danger bg-opacity-10 text-danger">Suspended</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>Cicely</td>
									<td>Sigler</td>
									<td><a href="#">Senior Research Officer</a></td>
									<td>15 Mar 1960</td>
									<td><span class="badge bg-info bg-opacity-10 text-info">Pending</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /order direction sequence control -->


					<!-- Complex headers with sorting -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Complex headers with sorting</h5>
						</div>

						<div class="card-body">
							Complex headers (using colspan / rowspan) can be used to <code>group</code> columns of similar information in DataTables, creating a very powerful visual effect. In addition to the basic behaviour, DataTables can also take <code>colspan</code> and <code>rowspans</code> into account when working with hidden columns. The example below shows a header spanning multiple cells over the contact information with sorting, with one of the columns that the span covers being hidden.
						</div>

						<table class="table table-bordered datatable-complex-header">
							<thead>
								<tr>
		                            <th rowspan="2">Name</th>
		                            <th colspan="2">HR Information</th>
		                            <th colspan="3">Contact</th>
		                        </tr>
		                        <tr>
		                            <th>Position</th>
		                            <th>Salary</th>
		                            <th>Office</th>
		                            <th>Extn.</th>
		                            <th>E-mail</th>
		                        </tr>
							</thead>
							<tbody>
					            <tr>
	                                <td>Tiger Nixon</td>
		                            <td>System Architect</td>
		                            <td>$320,800</td>
		                            <td>Edinburgh</td>
		                            <td>5421</td>
		                            <td>t.nixon@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Garrett Winters</td>
		                            <td>Accountant</td>
		                            <td>$170,750</td>
		                            <td>Tokyo</td>
		                            <td>8422</td>
		                            <td>g.winters@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Ashton Cox</td>
		                            <td>Junior Technical Author</td>
		                            <td>$86,000</td>
		                            <td>San Francisco</td>
		                            <td>1562</td>
		                            <td>a.cox@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Cedric Kelly</td>
		                            <td>Senior Javascript Developer</td>
		                            <td>$433,060</td>
		                            <td>Edinburgh</td>
		                            <td>6224</td>
		                            <td>c.kelly@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Airi Satou</td>
		                            <td>Accountant</td>
		                            <td>$162,700</td>
		                            <td>Tokyo</td>
		                            <td>5407</td>
		                            <td>a.satou@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Brielle Williamson</td>
		                            <td>Integration Specialist</td>
		                            <td>$372,000</td>
		                            <td>New York</td>
		                            <td>4804</td>
		                            <td>b.williamson@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Herrod Chandler</td>
		                            <td>Sales Assistant</td>
		                            <td>$137,500</td>
		                            <td>San Francisco</td>
		                            <td>9608</td>
		                            <td>h.chandler@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Rhona Davidson</td>
		                            <td>Integration Specialist</td>
		                            <td>$327,900</td>
		                            <td>Tokyo</td>
		                            <td>6200</td>
		                            <td>r.davidson@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Colleen Hurst</td>
		                            <td>Javascript Developer</td>
		                            <td>$205,500</td>
		                            <td>San Francisco</td>
		                            <td>2360</td>
		                            <td>c.hurst@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Sonya Frost</td>
		                            <td>Software Engineer</td>
		                            <td>$103,600</td>
		                            <td>Edinburgh</td>
		                            <td>1667</td>
		                            <td>s.frost@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Jena Gaines</td>
		                            <td>Office Manager</td>
		                            <td>$90,560</td>
		                            <td>London</td>
		                            <td>3814</td>
		                            <td>j.gaines@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Quinn Flynn</td>
		                            <td>Support Lead</td>
		                            <td>$342,000</td>
		                            <td>Edinburgh</td>
		                            <td>9497</td>
		                            <td>q.flynn@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Charde Marshall</td>
		                            <td>Regional Director</td>
		                            <td>$470,600</td>
		                            <td>San Francisco</td>
		                            <td>6741</td>
		                            <td>c.marshall@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Haley Kennedy</td>
		                            <td>Senior Marketing Designer</td>
		                            <td>$313,500</td>
		                            <td>London</td>
		                            <td>3597</td>
		                            <td>h.kennedy@datatables.net</td>
		                        </tr>
		                        <tr>
		                            <td>Tatyana Fitzpatrick</td>
		                            <td>Regional Director</td>
		                            <td>$385,750</td>
		                            <td>London</td>
		                            <td>1965</td>
		                            <td>t.fitzpatrick@datatables.net</td>
		                        </tr>
					        </tbody>
						</table>
					</div>
					<!-- /complex headers with sorting -->
					
					<!-- HTML sourced data -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">HTML (DOM) sourced data</h5>
						</div>

						<div class="card-body">
							Basic example of a datatable with <code>HTML (DOM)</code> sourced data. The foundation for DataTables is progressive enhancement, so it is very adept at reading table information directly from the <code>DOM</code>. This example shows how easy it is to add searching, ordering and paging to your HTML table by simply running DataTables with basic configuration on it.
						</div>

						<table class="table datatable-html">
							<thead>
								<tr>
					                <th>Name</th>
					                <th>Position</th>
					                <th>Age</th>
					                <th>Start date</th>
					                <th>Salary</th>
					                <th class="text-center">Actions</th>
					            </tr>
							</thead>
							<tbody>
								<tr>
					                <td>Tiger Nixon</td>
					                <td>System Architect</td>
					                <td>61</td>
					                <td><a href="#">2011/04/25</a></td>
					                <td><span class="badge bg-info bg-opacity-10 text-info">$320,800</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Garrett Winters</td>
					                <td>Accountant</td>
					                <td>63</td>
					                <td><a href="#">2011/07/25</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$170,750</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Ashton Cox</td>
					                <td>Junior Technical Author</td>
					                <td>66</td>
					                <td><a href="#">2009/01/12</a></td>
					                <td><span class="badge bg-secondary bg-opacity-10 text-secondary">$86,000</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Cedric Kelly</td>
					                <td>Senior Javascript Developer</td>
					                <td>22</td>
					                <td><a href="#">2012/03/29</a></td>
					                <td><span class="badge bg-success bg-opacity-10 text-success">$433,060</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Airi Satou</td>
					                <td>Accountant</td>
					                <td>33</td>
					                <td><a href="#">2008/11/28</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$162,700</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Brielle Williamson</td>
					                <td>Integration Specialist</td>
					                <td>61</td>
					                <td><a href="#">2012/12/02</a></td>
					                <td><span class="badge bg-info bg-opacity-10 text-info">$372,000</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Herrod Chandler</td>
					                <td>Sales Assistant</td>
					                <td>59</td>
					                <td><a href="#">2012/08/06</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$137,500</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Rhona Davidson</td>
					                <td>Integration Specialist</td>
					                <td>55</td>
					                <td><a href="#">2010/10/14</a></td>
					                <td><span class="badge bg-secondary bg-opacity-10 text-secondary">$97,900</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Colleen Hurst</td>
					                <td>Javascript Developer</td>
					                <td>39</td>
					                <td><a href="#">2009/09/15</a></td>
					                <td><span class="badge bg-success bg-opacity-10 text-success">$405,500</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Sonya Frost</td>
					                <td>Software Engineer</td>
					                <td>23</td>
					                <td><a href="#">2008/12/13</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$103,600</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Jena Gaines</td>
					                <td>Office Manager</td>
					                <td>30</td>
					                <td><a href="#">2008/12/19</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$90,560</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Quinn Flynn</td>
					                <td>Support Lead</td>
					                <td>22</td>
					                <td><a href="#">2013/03/03</a></td>
					                <td><span class="badge bg-info bg-opacity-10 text-info">$342,000</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Charde Marshall</td>
					                <td>Regional Director</td>
					                <td>36</td>
					                <td><a href="#">2008/10/16</a></td>
					                <td><span class="badge bg-success bg-opacity-10 text-success">$470,600</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Haley Kennedy</td>
					                <td>Senior Marketing Designer</td>
					                <td>43</td>
					                <td><a href="#">2012/12/18</a></td>
					                <td><span class="badge bg-danger bg-opacity-10 text-danger">$113,500</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
					            <tr>
					                <td>Tatyana Fitzpatrick</td>
					                <td>Regional Director</td>
					                <td>19</td>
					                <td><a href="#">2010/03/17</a></td>
					                <td><span class="badge bg-info bg-opacity-10 text-info">$385,750</span></td>
									<td class="text-center">
										<div class="d-inline-flex">
											<div class="dropdown">
												<a href="#" class="text-body" data-bs-toggle="dropdown">
													<i class="ph-list"></i>
												</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<i class="ph-file-pdf me-2"></i>
														Export to .pdf
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-csv me-2"></i>
														Export to .csv
													</a>
													<a href="#" class="dropdown-item">
														<i class="ph-file-doc me-2"></i>
														Export to .doc
													</a>
												</div>
											</div>
										</div>
									</td>
					            </tr>
							</tbody>
						</table>
					</div>
					<!-- /HTML sourced data -->


					<!-- Javascript sourced data -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Javascript sourced data</h5>
						</div>

						<div class="card-body">
							At times you will wish to be able to create a table from dynamic information passed directly to DataTables, rather than having it read from the document. This is achieved using the <code>data</code> option in the initialisation object, passing in an <code>array</code> of data to be used. This examples shows the element being added by Javascript and then initialising the DataTable with a set of data from a Javascript <code>array</code>.
						</div>

						<table class="table datatable-js">
							<thead>
								<tr>
					                <th>Engine</th>
					                <th>Browser</th>
					                <th>Platform</th>
					                <th>Version</th>
					                <th>Grade</th>
					            </tr>
							</thead>
						</table>
					</div>
					<!-- /javascript sourced data -->


					<!-- Ajax sourced data -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Ajax sourced data</h5>
						</div>

						<div class="card-body">
							DataTables has the ability to read data from virtually any <code>JSON</code> data source that can be obtained by <code>Ajax</code>. This can be done, in its most simple form, by setting the <code>ajax</code> option to the address of the <code>JSON</code> data source. The example below shows DataTables loading data for a table from <code>arrays</code> as the data source (object parameters can also be used through the <code>columns.data</code> option).
						</div>

						<table class="table datatable-ajax">
							<thead>
								<tr>
					                <th>Name</th>
					                <th>Position</th>
					                <th>Location</th>
					                <th>Extn.</th>
					                <th>Start date</th>
					                <th>Salary</th>
					            </tr>
							</thead>
						</table>
					</div>
					<!-- /ajax sourced data -->


					<!-- Nested object data -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Nested object data</h5>
						</div>

						<div class="card-body">
							The information read from an <code>Ajax</code> data source can be arbitrarily complex, but still be displayed by DataTables through the <code>columns.data</code> option, which is particularly useful for working with <code>JSON</code> feeds in an already defined format. The <code>columns.data</code> option has the ability to read information not only from objects, but also from arrays using the same dotted object syntax as for objects.
						</div>

						<table class="table datatable-nested">
							<thead>
					            <tr>
					                <th>Name</th>
					                <th>Position</th>
					                <th>Office</th>
					                <th>Extn.</th>
					                <th>Start date</th>
					                <th>Salary</th>
					            </tr>
					        </thead>
						</table>
					</div>
					<!-- /nested object data -->


					<!-- Generated column content -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Generated content for a column</h5>
						</div>

						<div class="card-body">
							In some tables you might wish to have some content generated automatically. This examples shows the use of <code>columns.defaultContent</code> to create a button element in the last column of the table. A simple jQuery <code>click</code> event listener is used to watch for clicks on the row, and when activated uses the <code>row().data()</code> method to get the data for the row and show a bit of information about it in an alert box.
						</div>

						<table class="table datatable-generated">
							<thead>
					            <tr>
					                <th>Name</th>
					                <th>Position</th>
					                <th>Office</th>
					                <th>Extn.</th>
					                <th>Start date</th>
					                <th>Salary</th>
					            </tr>
					        </thead>
						</table>
					</div>
					<!-- /generated column content -->


					<div class="page-header">
						<div class="page-header-content d-lg-flex">
							<div class="d-flex">
								<h4 class="page-title mb-0">
									Home - <span class="fw-normal">Dashboard</span>
								</h4>

								<a href="#page_header" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
									<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="content pt-0 custom-ui-handsontable">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-5 col-lg-8 col-xl-8">Fully Functioned Table</h5>
                        <div class="col-xs-12 col-sm-7 col-lg-4 col-xl-4 button-custom-alignment">
                            <button id="exportExcel6" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                            <button id="exportCsv6" class="btn btn-info btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>CSV
                            </button>
                            <button id="exportPdf6" class="btn btn-danger btn-sm">
                                <i class="ph ph-file-pdf me-1 fs-lg"></i>PDF
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="FullyFunctionedDatatable"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-lg-12 col-xl-6">
            <div class="card">
                 <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-5 col-lg-6 col-xl-6">Basic Table</h5>
                        <div class="col-xs-12 col-sm-7 col-lg-6 col-xl-6 button-custom-alignment">
                            <button id="exportExcel" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                            <button id="exportCsv" class="btn btn-info btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>CSV
                            </button>
                            <button id="exportPdf" class="btn btn-danger btn-sm">
                                <i class="ph ph-file-pdf me-1 fs-lg"></i>PDF
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive custom-spacing">
                        <div id="basicTable"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12 col-xl-6">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-5 col-lg-6 col-xl-6">Save changes using a callback Table</h5>
                        <div class="col-xs-12 col-sm-7 col-lg-6 col-xl-6 button-custom-alignment">
                            <button id="exportExcel1" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                            <button id="exportCsv1" class="btn btn-info btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>CSV
                            </button>
                            <button id="exportPdf1" class="btn btn-danger btn-sm">
                                <i class="ph ph-file-pdf me-1 fs-lg"></i>PDF
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="example-controls-container">
                        <div class="controls">
                            <button id="load" class="btn btn-success btn-sm me-2"><i class="ph ph-database fs-lg me-1"></i> Load data</button>
                            <button id="save" class="btn btn-primary btn-sm me-2"><i class="ph ph-floppy-disk fs-lg me-1"></i>Save data</button>
                            <label class="d-inline-block v-middle">
                                <input type="checkbox" name="autosave" id="autosave" />
                                Autosave
                            </label>
                        </div>

                        <output class="console fs-xs pt-1 pb-3" id="output">Click "Load" to load data from server</output>
                    </div>
                    <div class="table-responsive">
                        <div id="SaveAndLoadDataTable" class="ht-theme-main"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-xl-6">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-12 col-lg-8 col-xl-8">Column And Row readonly Table</h5>
                        <div class="col-xs-12 col-sm-12 col-lg-4 col-xl-4">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="ColumnAndRowReadonlyTable"></div>
                    </div>
                </div>
            </div>
        </div>

       <div class="col-xs-12 col-xl-6">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-12 col-lg-8 col-xl-8">Column And Row Freeze Table</h5>
                        <div class="col-xs-12 col-sm-12 col-lg-4 col-xl-4">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="ColumnAndRowFreezeDatatable"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
       <div class="col-xs-12  col-xl-6">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-12 col-lg-8 col-xl-8">Formula Caluctation Table</h5>
                        <div class="col-xs-12 col-sm-12 col-lg-4 col-xl-4">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <h5 class="demo-preview">Datatable</h5>
                        <div id="FormulaCaluctatedDatatable"></div>
                        <h5 class="demo-preview mt-3">Formula Sheet</h5>
                        <div id="FormulaCaluctationDatatable"></div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-xl-6">
            <div class="card">
                <div class="card-header">
                    <div class="row justify-content-between align-items-center">
                        <h5 class="mb-0 col-xs-12 col-sm-12 col-lg-8 col-xl-8">Save changes using a callback Table</h5>
                        <div class="col-xs-12 col-sm-12 col-lg-4 col-xl-4">
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="RowAndColumnMurgeDatatable"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

				</div>
				<!-- /content area -->
			

</asp:Content>

