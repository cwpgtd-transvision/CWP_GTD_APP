<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Home1.aspx.cs" Inherits="Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!-- Autocomple Needful JS -->
    <script src="../../../assets/js/vendor/forms/inputs/autocomplete.min.js"></script>
    <script src="../../../assets/demo/pages/form_autocomplete.js"></script>

	<!-- Select and multiselect needful JS -->
		<script src="../../../assets/demo/pages/form_layouts.js"></script>
	<script src="../../../assets/js/vendor/forms/selects/select2.min.js"></script>
	<script src="../../../assets/demo/pages/form_select2.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Body Section--%>
    <%--Add Here All Form Stuff Code For Individual Form CodeNot Any Reference--%>


				<!-- Page header -->
				<div class="page-header">
					<div class="page-header-content d-lg-flex">
						<div class="d-flex">
							<h4 class="page-title mb-0">
								General - <span class="fw-normal">Components</span>
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

					<!-- Daterange picker -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Daterange picker</h5>
						</div>

						<div class="card-body">
							<p class="mb-4">This date range picker component creates a dropdown menu from which a user can select a range of dates. If invoked with no options, it will present two calendars to choose a start and end date from. Optionally, you can provide a list of date ranges the user can select from instead of choosing dates from the calendars. Features include limiting the selectable date range, localizable strings and date formats, a single date picker mode, a time picker, and predefined date ranges.</p>

							<div class="row">
								<div class="col-lg-6">
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Basic usage</div>
										<p class="mb-3">Daterange picker with minimum configuration. You can customize it and limit the selectable date range, localize strings and date formats, show a single date picker mode, a time picker, and predefined date ranges.</p>

										<div class="input-group">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
											<input type="text" class="form-control daterange-basic" value="01/01/2020 - 01/31/2020"> 
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Display week numbers</div>
										<p class="mb-3">By default, date picker displays only day grid with day names. You can optionally display localized week numbers at the start of each week on the calendars. To do that, set <code>showWeekNumbers</code> to <code>true</code>.</p>

										<div class="input-group">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
											<input type="text" class="form-control daterange-weeknumbers" value="03/18/2020 - 03/23/2020"> 
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Display time picker</div>
										<p class="mb-3">In addition to days and weeks, you can also show 2 select boxes with time range. To show them, set <code>timePicker</code> option to <code>true</code>. Also use <code>timePickerIncrement</code> to change minutes increment and <code>timePicker24Hour</code> to change time format.</p>

										<div class="input-group">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
											<input type="text" class="form-control daterange-time" value="03/18/2020 - 03/23/2020"> 
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Single date picker</div>
										<p class="mb-3">Show only a single calendar to choose one date, instead of a range picker with two calendars. The start and end dates provided to your callback will be the same single date chosen. Just set <code>singleDatePicker</code> to <code>true</code>.</p>

										<div class="input-group">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
											<input type="text" class="form-control daterange-single" value="03/18/2020">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Text field attachment</div>
										<p class="mb-3">Another example of basic range picker, but attached to a regular input field to demonstrate flexibility of configuration. You can attach it to any element: button or inline text, input field or heading. No extra config requred.</p>

										<input type="text" class="form-control daterange-basic" value="03/18/2020 - 03/23/2020"> 
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Button class options</div>
										<p class="mb-3">Use 3 options to customize action buttons: <code>buttonClasses</code> to change classes in both apply and cancel buttons, <code>applyButtonClasses</code> to update classes in Apply button and <code>cancelButtonClasses</code> to update classes in Cancel button.</p>

										<div class="input-group">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
											<input type="text" class="form-control daterange-buttons" value="03/18/2020 - 03/23/2020">
										</div>
									</div>
								</div>

								<div class="col-lg-6">
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Show picker on right</div>
										<p class="mb-3">Default alignment of date picker if left. Use <code>opens</code> option with <code>'left'/'right'/'center'</code> values to change the alignment to right or center relalatively to the HTML element it's attached to. In RTL direction alignment is mirrored.</p>

										<div class="input-group">
											<input type="text" class="form-control daterange-left" value="03/18/2020 - 03/23/2020"> 
											<span class="input-group-text"><i class="ph-calendar"></i></span>
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Display date dropdowns</div>
										<p class="mb-3">Daterange picker doesn't allow you to quickly jump to specific year or month by default. Set <code>showDropdowns</code> option to <code>true</code> to display 2 select boxes with a list of years and months in the header area.</p>

										<div class="input-group">
											<input type="text" class="form-control daterange-datemenu" value="03/18/2020 - 03/23/2020"> 
											<span class="input-group-text"><i class="ph-calendar"></i></span>
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">10 minute increments</div>
										<p class="mb-3">As mentioned yearlier, minutes selection list is displayed with 30 minutes increment. You can modify this value with <code>timePickerIncrement</code> option. This example demonstrates 10 minutes increment.</p>

										<div class="input-group">
											<input type="text" class="form-control daterange-increments" value="08/01/2020 1:00 PM - 08/01/2020 1:30 PM">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Localization (ru)</div>
										<p class="mb-3">Combination of daterange picker's <code>locale</code> and <code>ranges</code> options allow you to provide localized strings for buttons and labels, customize the date format, and change the first day of week for the calendars.</p>

										<div class="input-group">
											<input type="text" class="form-control daterange-locale" value="08/01/2020 1:00 PM - 08/01/2020 1:30 PM">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Pre-defined ranges &amp; callback</div>
										<p class="mb-3">Daterange picker can also have pre-defined date ranges displayed as a list of ranges in menu format and an ability to select a custom range. Calendars are hidden by default and shown only when custom range is selected.</p>

										<div class="input-group">
											<input type="text" class="form-control daterange-predefined" placeholder="Select dates">
											<span class="input-group-text"><i class="ph-calendar"></i></span>
										</div>
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Date picker attached to the button</div>
										<p class="mb-3">The following example demonstrates daterange picker attached to the button. The logic is similar to input field, but selected date range is appended to <code>&lt;span></code> element inside the button, to avoid overriding of other child elements.</p>

										<button type="button" class="btn btn-danger daterange-ranges">
											<i class="ph-calendar me-2"></i>
											<span></span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /daterange picker -->


					<!-- Date picker -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Date picker</h5>
						</div>

						<div class="card-body">
							<p class="mb-4">Date picker is a remake of widely used <a href="https://github.com/uxsolutions/bootstrap-datepicker" target="_blank">Bootstrap Datepicker</a> written from scratch using vanilla JS to reproduce similar usability. Works in 3 modes: dropdown, inline and range. Also supports keyboard operations, localization, customization via SCSS/CSS and is dependency free. This specific version includes a few additions, custom design and re-uses Bootstrap classes for seamless integration with Bootstrap framework.</p>

							<div class="row">
								<div class="col-lg-6">
									
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Past Month Picker</div>
										<p>Need to use this class <code>datepicker-pick-level_Month_Default_PastMonth</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-pick-level_Month_Default_PastMonth" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Future Month Picker</div>
										<p>Need to use this class <code>datepicker-pick-level_Month_Default_FutureMonth</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-pick-level_Month_Default_FutureMonth" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Past year Picker</div>
										<p>Need to use this class <code>datepicker-pick-level_Year_Default_PastYear</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-pick-level_Year_Default_PastYear" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Future year Picker</div>
										<p>Need to use this class <code>datepicker-pick-level_Year_Default_FutureYear</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-pick-level_Year_Default_FutureYear" placeholder="MM-YYYY" readonly />
									</div>
									
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Basic usage</div>
										<p class="mb-3">By default, Datepicker object is attached to an <code>&lt;input></code> element that is configured as a regular date picker displayed in dropdown. Aside from a couple of exceptions, config options can be updated dynamically using the <code>setOptions()</code> method.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-basic" placeholder="Pick a date">
										</div>
									</div>


									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Show week numbers</div>
										<p class="mb-3">If <code>calendarWeeks</code> option is set to <code>true</code>, week numbers will be displayed in the first column of days grid. Week numbers use ISO week-numbering year, which has 52 or 53 full weeks. That is 364 or 371 days instead of the usual 365 or 366 days.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-week-numbers" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Clearing selected date</div>
										<p class="mb-3">Depending on specific use case, date picker can have a clear button that allows you to clear selected date in both input field and date picker itself. To show clear button, set <code>clearBtn</code> option to <code>true</code> in date picker configuration.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-clear-date" value="11/25/2021" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Disable week days</div>
										<p class="mb-3">Date picker can have certain week days disabled. That's especially useful when you need to prevent users from selecting weekend days for instance. Use <code>daysOfWeekDisabled</code> option with an array of day numbers starting from <code>0</code> (Sunday).</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-weekdays-disabled" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Disable specific dates</div>
										<p class="mb-3">Date picker can also have specific dates disabled. Useful when you need to disable public holidays or days with no available time slots. Supports array of date strings, date objects, time values or mix of those. Bear in mind date formatting.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-dates-disabled" value="01/12/2022" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Highlight week days</div>
										<p class="mb-3">Date picker can also have week days highlighted with different color. Although you can highlight up to 6 days, they all can have only 1 general style. Use <code>daysOfWeekHighlighted</code> option with an array of numbers starting from <code>0</code> (Sunday).</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-days-highlighted" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Date range</div>
										<p class="mb-3">Date range picker is essentially a wrapper/controller of 2 date pickers, which cannot be attached to elements that contain less than 2 <code>&lt;input></code> elements. Range picker supports almost all options from regular date picker and are applied to its start- and end-date pickers.</p>

										<div class="input-group datepicker-range">
											<input type="text" class="form-control" placeholder="From">
											<input type="text" class="form-control" placeholder="To">
										</div>
									</div>
								</div>

								<div class="col-lg-6">

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Normal Date Picker</div>
										<p>Need to use this class <code>datepicker-date-format_default</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-date-format_default" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Future Date Picker</div>
										<p>Need to use this class <code>datepicker-date-format_default_Futuredate</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-date-format_default_Futuredate" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Past Date Picker</div>
										<p>Need to use this class <code>datepicker-date-format_default_Past</code></p>
										<label class="form-label">Select Month</label>
										<input type="text" class="form-control datepicker-date-format_default_Past" placeholder="MM-YYYY" readonly />
									</div>
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Date format</div>
										<p class="mb-3">Date format can be easily changed in <code>format</code> config option. It must be declared using the combination of the predefined tokens and separators. Alternatively to format string you can use object that contains custom parser and formatter functions.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-date-format" placeholder="Enter date in yyyy-mm-dd format">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Multiple dates</div>
										<p class="mb-3">Regular date picker can be easily turned into multiple date picker with <code>maxNumberOfDates</code> option. Default value is <code>1</code>, no limit is applied if <code>0</code> is set. Additionally use <code>dateDelimiter</code> option to change dates separator in the input field.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-multiple-dates" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Minimum date</div>
										<p class="mb-3">By default, date picker doesn't have minimum limit of selectable date and is infinite. To set minimum date that user can select, use <code>minDate</code> config option. You can use <code>String</code>, <code>Date</code> or <code>Number</code> date types.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-date-min" placeholder="Min date is 01/01/2022">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Maximum date</div>
										<p class="mb-3">By default, date picker doesn't have maximum limit of selectable date and is infinite. To set maximum date that user can select, use <code>maxDate</code> config option. You can use <code>String</code>, <code>Date</code> or <code>Number</code> date types.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-date-max" placeholder="Max date is 01/01/2022">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Limit pick level</div>
										<p class="mb-3">The level that the date picker allows to pick. Default value of <code>pickLevel</code> option is <code>0</code>, which corresponds to date. You can also use <code>1</code> to set month and <code>2</code> to set year. This example allows you to pick only a month and a year.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-pick-level" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Default view</div>
										<p class="mb-3">The view displayed when the date picker opens. Default view can be changed with <code>startView</code> option, where allowed values are <code>0</code> (days, default), <code>1</code> (months), <code>2</code> (years) and <code>3</code> (decades). In this example start view is set to years.</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-default-view" placeholder="Pick a date">
										</div>
									</div>


									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Start day of the week</div>
										<p class="mb-3">Default start day of the week is Sunday, but this differs per country. You can change it to Monday by setting <code>weekStart</code> option value to <code>6</code>. The count starts from <code>0</code> (Sunday) to <code>6</code> (Saturday).</p>

										<div class="input-group">
											<span class="input-group-text">
												<i class="ph-calendar"></i>
											</span>
											<input type="text" class="form-control datepicker-start-day" placeholder="Pick a date">
										</div>
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Date range one side</div>
										<p class="mb-3">When <code>allowOneSidedRange</code> option is <code>false</code>, if the user selects a date on one side while the other side is blank, the date range picker complements the blank side with the same date as the selected side. The same is applied to the other side automatically.</p>

										<div class="input-group datepicker-range-one-side">
											<input type="text" class="form-control" placeholder="From">
											<input type="text" class="form-control" placeholder="To">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /pickadate picker -->

					<!-- Autocomplete -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Autocomplete</h5>
						</div>

						<div class="card-body">
							<div class="mb-4">Autocomplete (<code>autoComplete.js</code>) is a simple, pure vanilla Javascript library progressively designed for speed, high versatility, and seamless integration with a wide range of projects & systems. It has no dependencies, includes powerful search engine with two different modes, is highly customizable and works with regular inputs (text field, textarea and contentEditable elements).</div>

							<div class="row">
								<div class="col-lg-6">
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Basic usage</div>
										<p class="mb-3">Simple example of search field with autocomplete. Includes a few overrides of default options to make it work like a regular suggestion engine: highlight of matching bit and display selected item in the field value.</p>
										<input type="search" class="form-control" id="autocomplete_basic" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Disable selection</div>
										<p class="mb-3">By default, autocomplete displays the list of mathing results, but doesn't update input value when menu item is selected. This can be changed via <code>selection</code> input event. This example shows the default behaviour.</p>
										<input type="search" class="form-control" id="autocomplete_selection" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Threshold</div>
										<p class="mb-3">Threshold option is responsible for setting threshold value of the minimum characters length where <code>autoComplete.js</code> engine starts. In this example threshold value is set to <code>3</code>. Type <strong>nia</strong> to see it in action</p>
										<input type="search" class="form-control" id="autocomplete_threshold" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Debounce</div>
										<p class="mb-3">Debounce option is responsible for setting delay time duration (in milliseconds) that counts after typing is done for <code>autoComplete.js</code> engine to start. Default value is <code>0</code>, in this example it's set to <code>500ms</code>.</p>
										<input type="search" class="form-control" id="autocomplete_debounce" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Search engine</div>
										<p class="mb-3">SearchEngine option is responsible for setting the Search engine Type/Mode or custom engine. Supports <code>strict</code> (default) and <code>loose</code> modes. In this example <code>searchEngine</code> option is set to <code>loose</code>.</p>
										<input type="search" class="form-control" id="autocomplete_engine" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Open list on focus</div>
										<p class="mb-3">The library includes <code>onfocus</code> event, which provides extra customization of search results. In this example results list is triggered on focus when suggestion is selected. Choose some country and then click on input field.</p>
										<input type="search" class="form-control" id="autocomplete_focus" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Multiple choices</div>
										<p class="mb-3">With additional configuration of <code>query</code> option and <code>selection</code> event, search field can support multiple selection separated by comma. Example below demonstrates this behaviour.</p>
										<input type="search" class="form-control" id="autocomplete_multiple" autocomplete="new-search" placeholder="Search country">
									</div>
								</div>

								<div class="col-lg-6">
									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Counter</div>
										<p class="mb-3">Display total number of matches and current count of maximum displayed items set in JS configuration. Works in combination with <code>maxResults</code> option that sets the limit of items displayed in the menu.</p>
										<input type="search" class="form-control" id="autocomplete_count" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">No results</div>
										<p class="mb-3">The message that is shown to the user when search query doesn't match any data entry can be easily customized via <code>resultsList</code> set of options. Type <strong>"Sweden"</strong> to see it in action</p>
										<input type="search" class="form-control" id="autocomplete_empty" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Disabled highlight</div>
										<p class="mb-3">By default, autocomplete doesn't highlight matching characters in the list of results, but shows the list of general matches. To change this behaviour, set <code>highlight</code> option to <code>true</code> in <code>resultItem</code> option.</p>
										<input type="search" class="form-control" id="autocomplete_highlight" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">External data source</div>
										<p class="mb-3">This example loads external JSON file with a list of countries. You can easily customize appearance of results and selection, add dynamic placeholders or loading indicators in <code>data</code> configuration.</p>
										<input type="search" class="form-control" id="autocomplete_external_source" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Ignore duplicates</div>
										<p class="mb-3">External data set includes duplicated value - <strong>Austria</strong>. This example filters out all duplicates in data set and returns a single value. This behaviour can be easily achieved with <code>filter</code> configuration option</p>
										<input type="search" class="form-control" id="autocomplete_duplicates" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4">
										<div class="fw-bold border-bottom pb-2 mb-2">Recent searches</div>
										<p class="mb-3">Results list can include search history in a simple list format. You can customize its appearance in <code>resultsList</code> option and <code>selection</code> event. Select some country and then trigger the menu again.</p>
										<input type="search" class="form-control" id="autocomplete_recent" autocomplete="new-search" placeholder="Search country">
									</div>

									<div class="mb-4 mb-lg-0">
										<div class="fw-bold border-bottom pb-2 mb-2">Start with</div>
										<p class="mb-3">The data can be filtered in a way that the list will include only the exact query starting from the 1st word. If you type <strong>A</strong>, United <strong>A</strong>rab Emirates will be ignored since the 1st letter in the 1st word doesn't contain that query.</p>
										<input type="search" class="form-control" id="autocomplete_start" autocomplete="new-search" placeholder="Search country">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /autocomplete -->

					
					<!-- Single select -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Single select</h5>
						</div>

						<div class="card-body">
							<p class="mb-4">Single select2 select is a jQuery based replacement for browser default select boxes. Is re-uses look and feel from regular selects, but significantly extends default functionality by applying custom style to the menu (similar to dropdown menu), adding filtering, supporting remote data sets and many other features. Check out some examples of single select with various options below:</p>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Basic examples</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Basic select</label>
									<div class="col-lg-9">
										<select class="form-control select" data-minimum-results-for-search="Infinity">
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Fixed select width</label>
									<div class="col-lg-9">
										<select class="form-control select" data-width="250" data-minimum-results-for-search="Infinity">
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Select with search</label>
									<div class="col-lg-9">
										<select class="form-control select">
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Select with placeholder</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a State..." class="form-control select">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Select with icons</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a state..." class="form-control select-icons">
											<option value="slack" data-icon="slack-logo">Slack</option>
											<option value="instagram" data-icon="instagram-logo">Instagram</option>
											<option value="telegram" data-icon="telegram-logo">Telegram</option>
											<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
											<option value="twitter" data-icon="twitter-logo">Twitter</option>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Disabled items</label>
									<div class="col-lg-9">
										<select class="form-control select">
											<optgroup label="Mountain Time Zone">
												<option value="AZ" disabled>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID" disabled>Idaho</option>
												<option value="WY" disabled>Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR" disabled>Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY" disabled>Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Disabled select</label>
									<div class="col-lg-9">
										<select class="form-control select" disabled>
											<option value="AZ">Arizona</option>
											<option value="CO">Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
										</select>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Input group</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Left addon</label>
									<div class="col-lg-9">
										<div class="input-group">
											<span class="input-group-text">@</span>
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Right addon</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<span class="input-group-text">0.00</span>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Left button</label>
									<div class="col-lg-9">
										<div class="input-group">
											<button type="button" class="btn btn-success">Button</button>
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Right button</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<button type="button" class="btn btn-success">Button</button>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Multiple selects</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<select class="form-control select" data-width="1%">
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Mix with text input</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select flex-grow-0" data-minimum-results-for-search="Infinity" data-width="auto">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</select>
											<input type="text" class="form-control" placeholder="Input placeholder">
										</div>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Sizing</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Large size</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a State..." class="form-control form-control-lg select" data-container-css-class="select-lg">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Default size</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a State..." class="form-control select">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Small size</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a State..." class="form-control form-control-sm select" data-container-css-class="select-sm">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>
							</div>


							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Advanced examples</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Minimum input</label>
									<div class="col-lg-9">
										<select data-placeholder="Enter 'as'" class="form-control select" data-minimum-input-length="2" data-minimum-results-for-search="Infinity">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>

										<div class="form-text">Select2 supports a minimum input setting which is useful for large remote datasets where short search terms are not very useful. Simply specify a number of input characters using <code>minimumInputLength</code> option</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Customizing how results are matched</label>
									<div class="col-lg-9">
										<select class="form-control select-matched-customize">
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>

										<div class="form-text">Example of how matched results can be customized. Unlike other dropdowns on this page, this one matches options only if the term appears in the beginning of the string as opposed to anywhere</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Loading array data</label>
									<div class="col-lg-9">
										<div class="mb-3">
											<p>1. Example below loads array:</p>
											<select class="form-control select-data-array"></select>
										</div>

										<div>
											<p>2. Example below loads array with selected option:</p>
											<select class="form-control select-data-array">
												<option value="2" selected>duplicate</option>
											</select>
										</div>	

										<div class="form-text">Select2 provides a way to load the data from a local array. You can provide initial selections with array data by providing the option tag for the selected values, similar to how it would be done for a standard select.</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Loading remote data</label>
									<div class="col-lg-9">
										<select class="form-control select-remote-data">
											<option value="3620194" selected>select2/select2</option>
										</select>

										<div class="form-text">Select2 comes with AJAX support built in, using jQuery's AJAX methods. In this example, we can search for repositories using GitHub's API. Example also includes infinite scrolling feature</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Diacritics support</label>
									<div class="col-lg-9">
										<select data-placeholder="Type 'aero'" class="form-control select-search">
											<option>Aeróbics</option>
											<option>Aeróbics en Agua</option>
											<option>Aerografía</option>
											<option>Aeromodelaje</option>
											<option>Águilas</option>
											<option>Ajedrez</option>
											<option>Ala Delta</option>
											<option>Álbumes de Música</option>
											<option>Alusivos</option>
											<option>Análisis de Escritura a Mano</option>
										</select>

										<div class="form-text">Select2's default matcher will ignore diacritics, making it easier for users to filter results in international selects. Type <strong>"aero"</strong> into the select above</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Clearing results</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a state" class="form-control select" data-allow-clear="true">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL" selected>Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>

										<div class="form-text">Whether or not a clear button is displayed when the select box has a selection. The button, when clicked, resets the value of the select box back to the placeholder</div>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Programmatic access</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Set and get value</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" class="form-control select-access-value">
												<option></option>
												<option value="CA">California</option>
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-set">Set to California</button>
												<button type="button" class="btn btn-light access-get">Alert selected value</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Enable and disable menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" class="form-control select-access-enable">
												<option></option>
												<option value="CA">California</option>
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-disable">Disable</button>
												<button type="button" class="btn btn-light access-enable">Enable</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Destroy and create menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" class="form-control select-access-create">
												<option></option>
												<option value="CA">California</option>
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-destroy">Destroy</button>
												<button type="button" class="btn btn-light access-create">Create</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Open and close menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" class="form-control select-access-open">
												<option></option>
												<option value="CA">California</option>
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-open">Open</button>
												<button type="button" class="btn btn-light access-close">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /single select -->


					<!-- Multiple select -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Multiple select</h5>
						</div>

						<div class="card-body">
							<p class="mb-4">Multiple Select2 select is a very extensive alternative to regular multiple select, where selected options are displayed as inline list of pills. It also supports various features such as remote data sets, programmatic control, internationalization, tagging, grouping, real time filtering and more. Check out some examples of multiple select with various options below:</p>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Basic examples</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Multiple select</label>
									<div class="col-lg-9">
										<select multiple="multiple" class="form-control select">
											<optgroup label="Mountain Time Zone">
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA" selected>Iowa</option>
												<option value="KS" selected>Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Fixed width select</label>
									<div class="col-lg-9">
										<select multiple="multiple" class="form-control select" data-width="400">
											<optgroup label="Mountain Time Zone">
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS" selected>Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">With placeholder</label>
									<div class="col-lg-9">
										<select data-placeholder="Select a State..." multiple="multiple" class="form-control select">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">With icons</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Select a state..." class="form-control select-icons">
											<option value="slack" data-icon="slack-logo" selected>Slack</option>
											<option value="instagram" data-icon="instagram-logo">Instagram</option>
											<option value="telegram" data-icon="telegram-logo" selected>Telegram</option>
											<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
											<option value="twitter" data-icon="twitter-logo">Twitter</option>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Disabled search</label>
									<div class="col-lg-9">
										<select class="form-control select-multiple-search-disabled" multiple="multiple">
											<option value="AZ" selected>Arizona</option>
											<option value="CO">Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
											<option value="IL" selected>Illinois</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Disable menu items</label>
									<div class="col-lg-9">
										<select multiple="multiple" class="form-control select">
											<optgroup label="Mountain Time Zone">
												<option value="AZ" disabled>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID" disabled>Idaho</option>
												<option value="WY" selected>Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR" selected>Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY" disabled>Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Disabled select</label>
									<div class="col-lg-9">
										<select multiple="multiple" class="form-control select" disabled>
											<option value="AZ" selected>Arizona</option>
											<option value="CO">Colorado</option>
											<option value="ID" selected>Idaho</option>
											<option value="WY" selected>Wyoming</option>
										</select>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Input group</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Left addon</label>
									<div class="col-lg-9">
										<div class="input-group">
											<span class="input-group-text">@</span>
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ" selected>Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Right addon</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ" selected>Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<span class="input-group-text">0.00</span>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Left button</label>
									<div class="col-lg-9">
										<div class="input-group">
											<button type="button" class="btn btn-success">Button</button>
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ" selected>Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Right button</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ" selected>Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<button type="button" class="btn btn-success">Button</button>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Multiple selects</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ" selected>Arizona</option>
													<option value="CO" selected>Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="ID">Idaho</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL" selected>Alabama</option>
													<option value="AR" selected>Arkansas</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Mix with text input</label>
									<div class="col-lg-9">
										<div class="input-group">
											<select class="form-control select" data-placeholder="Select state" multiple data-width="1%">
												<option></option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO" selected>Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</select>
											<input type="text" class="form-control" placeholder="Input placeholder">
										</div>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Sizing</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Large size</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Select a State..." class="form-control form-control-lg select" data-container-css-class="select-lg">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID" selected>Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA" selected>Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Default size</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Select a State..." class="form-control select">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL" selected>Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Small size</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Select a State..." class="form-control form-control-sm select" data-container-css-class="select-sm">
											<option></option>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY" selected>Kentucky</option>
											</optgroup>
										</select>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Advanced examples</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Tagging support</label>
									<div class="col-lg-9">
										<select class="form-control select" multiple="multiple" data-tags="true">
											<option value="AZ">Arizona</option>
											<option value="CO" selected>Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
											<option value="AL" selected>Alabama</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
										</select>

										<div class="form-text">Select2 can be used to quickly set up fields used for tagging. When tagging is enabled the user can select from pre-existing tags or create a new tag by picking the first choice</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Maximum input length</label>
									<div class="col-lg-9">
										<select class="form-control select" multiple="multiple" data-tags="true" data-maximum-input-length="5">
											<option value="AZ">Arizona</option>
											<option value="CO" selected>Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
											<option value="AL" selected>Alabama</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
										</select>

										<div class="form-text">Select2 can be set a limit on the number of characters that can be entered per tag. You would not be able to enter any input of more than 5 characters long</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Auto tokenization</label>
									<div class="col-lg-9">
										<select class="form-control select" multiple="multiple" data-tags="true" data-token-separators="[',', ' ']">
											<option value="AZ">Arizona</option>
											<option value="CO">Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
											<option value="AL" selected>Alabama</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
										</select>

										<div class="form-text">Select2 supports ability to add choices automatically as the user is typing into the search field. Try typing in the search field below and entering a space or a comma</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Limiting the number of selections</label>
									<div class="col-lg-9">
										<select class="form-control select" multiple="multiple" data-maximum-selection-length="3">
											<option value="AZ">Arizona</option>
											<option value="CO">Colorado</option>
											<option value="ID">Idaho</option>
											<option value="WY">Wyoming</option>
											<option value="AL">Alabama</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY" selected>Kentucky</option>
										</select>

										<div class="form-text">Select2 multi-value select boxes can set restrictions regarding the maximum number of options selected. The select below is declared with <code>maximumSelectionLength</code> option</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Diacritics support</label>
									<div class="col-lg-9">
										<select class="form-control select" data-placeholder="Type 'aero'" multiple="multiple">
											<option>Aeróbics</option>
											<option>Aeróbics en Agua</option>
											<option>Aerografía</option>
											<option>Aeromodelaje</option>
											<option>Águilas</option>
											<option>Ajedrez</option>
											<option>Ala Delta</option>
											<option>Álbumes de Música</option>
											<option>Alusivos</option>
											<option>Análisis de Escritura a Mano</option>
										</select>

										<div class="form-text">Select2's default matcher will ignore diacritics, making it easier for users to filter results in international selects. Type <strong>"aero"</strong> into the select above</div>
									</div>
								</div>
							</div>

							<div class="mb-4">
								<div class="fw-bold border-bottom pb-2 mb-3">Programmatic access</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Reacting to external value changes</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" multiple="multiple" class="form-control select-access-multiple-value">
												<option value="AK">Alaska</option>
												<option value="CA">California</option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light change-to-ca">Select California</button>
												<button type="button" class="btn btn-light change-to-ak-co">Select Alaska and Colorado</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Enable and disable menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" multiple="multiple" class="form-control select-access-multiple-enable">
												<option value="AK">Alaska</option>
												<option value="CA">California</option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-multiple-disable">Disable</button>
												<button type="button" class="btn btn-light access-multiple-enable">Enable</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Destroy and create menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" multiple="multiple" class="form-control select-access-multiple-create">
												<option value="AK">Alaska</option>
												<option value="CA">California</option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-multiple-destroy">Destroy</button>
												<button type="button" class="btn btn-light access-multiple-create">Create</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Clear selection</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select states" multiple="multiple" class="form-control select-access-multiple-clear">
												<option value="AK">Alaska</option>
												<option value="CA">California</option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-multiple-clear">Clear selection</button>
											</div>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-form-label col-lg-3">Open and close menu</label>
									<div class="col-lg-9">
										<div class="d-md-flex">
											<select data-placeholder="Select something" multiple="multiple" class="form-control select-access-multiple-open">
												<option value="AK">Alaska</option>
												<option value="CA">California</option>
												<option value="AZ" selected>Arizona</option>
												<option value="CO">Colorado</option>
												<option value="ID">Idaho</option>
												<option value="WY" selected>Wyoming</option>
												<option value="CT">Connecticut</option>
											</select>

											<div class="btn-group flex-shrink-0 ms-md-3">
												<button type="button" class="btn btn-light access-multiple-open">Open</button>
												<button type="button" class="btn btn-light access-multiple-close">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /multiple select -->

					
					<!-- Basic layout -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Basic layout</h5>
						</div>

						<div class="card-body">
							Create horizontal forms with the grid by adding the <code>.row</code> class to form groups and using the <code>.col-*-*</code> classes to specify the width of your labels and controls. Be sure to add <code>.col-form-label</code> to your <code>&lt;label></code>s as well so they’re vertically centered with their associated form controls. Checkboxes and radios require wrapper with <code>.form-check-horizontal</code> class.
						</div>

						<div class="card-body border-top">
							<form action="#">
								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Name:</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" placeholder="Eugene Kopyov">
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Password:</label>
									<div class="col-lg-9">
										<input type="password" class="form-control" placeholder="Your strong password">
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your state:</label>
									<div class="col-lg-9">
										<select class="form-control form-control-select2">
											<optgroup label="Alaskan/Hawaiian Time Zone">
												<option value="AK">Alaska</option>
												<option value="HI">Hawaii</option>
											</optgroup>
											<optgroup label="Pacific Time Zone">
												<option value="CA">California</option>
												<option value="NV">Nevada</option>
												<option value="WA">Washington</option>
											</optgroup>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
											<optgroup label="Eastern Time Zone">
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Gender:</label>
									<div class="col-lg-9">
										<div class="form-check-horizontal">
											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender" checked>
												<span class="form-check-label">Male</span>
											</label>

											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender">
												<span class="form-check-label">Female</span>
											</label>
										</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your avatar:</label>
									<div class="col-lg-9">
										<input type="file" class="form-control">
										<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Tags:</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Enter tags" class="form-control form-control-select2-icons">
											<option value="slack" data-icon="slack-logo" selected>Slack</option>
											<option value="instagram" data-icon="instagram-logo" selected>Instagram</option>
											<option value="telegram" data-icon="telegram-logo">Telegram</option>
											<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
											<option value="twitter" data-icon="twitter-logo">Twitter</option>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your message:</label>
									<div class="col-lg-9">
										<textarea rows="3" cols="3" class="form-control" placeholder="Enter your message here"></textarea>
									</div>
								</div>

								<div class="text-end">
									<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
								</div>
							</form>
						</div>
					</div>
					<!-- /basic layout -->


					<!-- Right labels -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Right aligned labels</h5>
						</div>

						<div class="card-body">
							To avoid large white space between labels and form elements on wide screens, labels can be aligned to the right with <code>.text-[breakpoint]-end</code> class. UX guidelines suggest this layout as it brings the label closer to the field to make scanning the form faster and easier. But it doesn't work for all use cases (heavy multi column forms, forms in popups etc) as it also creates a large white space on the left side.
						</div>

						<div class="card-body border-top">
							<form action="#">
								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Name:</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" placeholder="Eugene Kopyov">
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Password:</label>
									<div class="col-lg-9">
										<input type="password" class="form-control" placeholder="Your strong password">
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Your state:</label>
									<div class="col-lg-9">
										<select class="form-control form-control-select2">
											<optgroup label="Alaskan/Hawaiian Time Zone">
												<option value="AK">Alaska</option>
												<option value="HI">Hawaii</option>
											</optgroup>
											<optgroup label="Pacific Time Zone">
												<option value="CA">California</option>
												<option value="NV">Nevada</option>
												<option value="WA">Washington</option>
											</optgroup>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
											<optgroup label="Eastern Time Zone">
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Gender:</label>
									<div class="col-lg-9">
										<div class="form-check-horizontal">
											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender" checked>
												<span class="form-check-label">Male</span>
											</label>

											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender">
												<span class="form-check-label">Female</span>
											</label>
										</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Your avatar:</label>
									<div class="col-lg-9">
										<input type="file" class="form-control">
										<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Tags:</label>
									<div class="col-lg-9">
										<select multiple="multiple" data-placeholder="Enter tags" class="form-control form-control-select2-icons">
											<option value="slack" data-icon="slack-logo" selected>Slack</option>
											<option value="instagram" data-icon="instagram-logo" selected>Instagram</option>
											<option value="telegram" data-icon="telegram-logo">Telegram</option>
											<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
											<option value="twitter" data-icon="twitter-logo">Twitter</option>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label text-lg-end">Your message:</label>
									<div class="col-lg-9">
										<textarea rows="3" cols="3" class="form-control" placeholder="Enter your message here"></textarea>
									</div>
								</div>

								<div class="text-end">
									<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
								</div>
							</form>
						</div>
					</div>
					<!-- /right labels -->


					<!-- Legend -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Fieldsets with legend</h5>
						</div>

						<div class="card-body">
							The <code>&lt;legend></code> HTML element represents a caption for the content of its parent <code>&lt;fieldset></code>. According to standards, it must be used inside field set, but thanks to helper classes, the look and feel can be justified and legends and regular text dividers can look the same. If you care about accessibility in your project, always use recommended markup structure to fully support screen readers.
						</div>

						<div class="card-body border-top">
							<form action="#">
								<fieldset>
									<legend class="fs-base fw-bold border-bottom pb-2 mb-3">Mandatory fields</legend>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Name:</label>
										<div class="col-lg-9">
											<input type="text" class="form-control" placeholder="Eugene Kopyov">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Password:</label>
										<div class="col-lg-9">
											<input type="password" class="form-control" placeholder="Your strong password">
										</div>
									</div>
								</fieldset>

								<fieldset>
									<legend class="fs-base fw-bold border-bottom pb-2 mb-3">Optional fields</legend>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Your state:</label>
										<div class="col-lg-9">
											<select class="form-control form-control-select2">
												<optgroup label="Alaskan/Hawaiian Time Zone">
													<option value="AK">Alaska</option>
													<option value="HI">Hawaii</option>
												</optgroup>
												<optgroup label="Pacific Time Zone">
													<option value="CA">California</option>
													<option value="NV">Nevada</option>
													<option value="WA">Washington</option>
												</optgroup>
												<optgroup label="Mountain Time Zone">
													<option value="AZ">Arizona</option>
													<option value="CO">Colorado</option>
													<option value="WY">Wyoming</option>
												</optgroup>
												<optgroup label="Central Time Zone">
													<option value="AL">Alabama</option>
													<option value="AR">Arkansas</option>
													<option value="KY">Kentucky</option>
												</optgroup>
												<optgroup label="Eastern Time Zone">
													<option value="CT">Connecticut</option>
													<option value="DE">Delaware</option>
													<option value="FL">Florida</option>
												</optgroup>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Gender:</label>
										<div class="col-lg-9">
											<div class="form-check-horizontal">
												<label class="form-check form-check-inline">
													<input type="radio" class="form-check-input" name="gender" checked>
													<span class="form-check-label">Male</span>
												</label>

												<label class="form-check form-check-inline">
													<input type="radio" class="form-check-input" name="gender">
													<span class="form-check-label">Female</span>
												</label>
											</div>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Your avatar:</label>
										<div class="col-lg-9">
											<input type="file" class="form-control">
											<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
										</div>
									</div>
								</fieldset>

								<fieldset>
									<legend class="fs-base fw-bold border-bottom pb-2 mb-3">Additional information</legend>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Tags:</label>
										<div class="col-lg-9">
											<select multiple="multiple" data-placeholder="Enter tags" class="form-control form-control-select2-icons">
												<option value="slack" data-icon="slack-logo" selected>Slack</option>
												<option value="instagram" data-icon="instagram-logo" selected>Instagram</option>
												<option value="telegram" data-icon="telegram-logo">Telegram</option>
												<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
												<option value="twitter" data-icon="twitter-logo">Twitter</option>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-lg-3 col-form-label">Your message:</label>
										<div class="col-lg-9">
											<textarea rows="3" cols="3" class="form-control" placeholder="Enter your message here"></textarea>
										</div>
									</div>
								</fieldset>

								<div class="text-end">
									<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
								</div>
							</form>
						</div>
					</div>
					<!-- /legend -->


					<!-- Static mode -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Static mode</h5>
						</div>

						<div class="card-body">
							Static elements in horizontal form require additional classes or attributes to keep the spacing and styling consistent. If you want to have <code>&lt;input readonly></code> elements in your form styled as plain text for instance, use the <code>.form-control-plaintext</code> class to remove the default form field styling and preserve the correct margin and padding.
						</div>

						<div class="card-body border-top">
							<form action="#">
								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Name:</label>
									<div class="col-lg-9">
										<div class="form-control form-control-plaintext">Eugene Kopyov</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Password:</label>
									<div class="col-lg-9">
										<input type="password" class="form-control" readonly value="Your password">
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your state:</label>
									<div class="col-lg-9">
										<select class="form-control form-control-select2" disabled>
											<optgroup label="Alaskan/Hawaiian Time Zone">
												<option value="AK">Alaska</option>
												<option value="HI">Hawaii</option>
											</optgroup>
											<optgroup label="Pacific Time Zone">
												<option value="CA">California</option>
												<option value="NV" selected>Nevada</option>
												<option value="WA">Washington</option>
											</optgroup>
											<optgroup label="Mountain Time Zone">
												<option value="AZ">Arizona</option>
												<option value="CO">Colorado</option>
												<option value="WY">Wyoming</option>
											</optgroup>
											<optgroup label="Central Time Zone">
												<option value="AL">Alabama</option>
												<option value="AR">Arkansas</option>
												<option value="KY">Kentucky</option>
											</optgroup>
											<optgroup label="Eastern Time Zone">
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
											</optgroup>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Gender:</label>
									<div class="col-lg-9">
										<div class="form-check-horizontal">
											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender-disabled" disabled checked>
												<span class="form-check-label">Male</span>
											</label>

											<label class="form-check form-check-inline">
												<input type="radio" class="form-check-input" name="gender-disabled" disabled>
												<span class="form-check-label">Female</span>
											</label>
										</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your avatar:</label>
									<div class="col-lg-9">
										<input type="file" class="form-control" disabled>
										<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Tags:</label>
									<div class="col-lg-9">
										<select multiple="multiple" disabled data-placeholder="Enter tags" class="form-control form-control-select2-icons">
											<option value="slack" data-icon="slack-logo" selected>Slack</option>
											<option value="instagram" data-icon="instagram-logo" selected>Instagram</option>
											<option value="telegram" data-icon="telegram-logo">Telegram</option>
											<option value="whatsapp" data-icon="whatsapp-logo">Whatsapp</option>
											<option value="twitter" data-icon="twitter-logo">Twitter</option>
										</select>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-lg-3 col-form-label">Your message:</label>
									<div class="col-lg-9">
										<div class="form-control form-control-plaintext">
											<p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.</p>
										</div>
									</div>
								</div>

								<div class="text-end">
									<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
								</div>
							</form>
						</div>
					</div>
					<!-- /static mode -->


					<!-- Centered form -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Centered form</h5>
						</div>

						<div class="card-body">
							Horizontal form can have a %-based width and aligned to the center. Use a regular grid markup with offsetting classes as a form wrapper. Mind the breakpoint in <code>.col-*</code> classes to ensure the proper width is used on small screens. This example is using <code>lg</code> breakpoint, which means on desktop screens the form has 33.3% width and 100% on small screens.
						</div>

						<div class="card-body border-top">
							<div class="row">
								<div class="col-lg-8 offset-lg-2">
									<form action="#">
										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Enter your name:</label>
											<div class="col-lg-8">
												<input type="text" class="form-control" placeholder="Eugene Kopyov">
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Enter your password:</label>
											<div class="col-lg-8">
												<input type="password" class="form-control" placeholder="Your strong password">
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Select your state:</label>
											<div class="col-lg-8">
												<select data-placeholder="Select your state" class="form-control form-control-select2">
													<option></option>
													<optgroup label="Alaskan/Hawaiian Time Zone">
														<option value="AK">Alaska</option>
														<option value="HI">Hawaii</option>
													</optgroup>
													<optgroup label="Pacific Time Zone">
														<option value="CA">California</option>
														<option value="OR">Oregon</option>
														<option value="WA">Washington</option>
													</optgroup>
													<optgroup label="Mountain Time Zone">
														<option value="AZ">Arizona</option>
														<option value="CO">Colorado</option>
														<option value="WY">Wyoming</option>
													</optgroup>
													<optgroup label="Central Time Zone">
														<option value="AL">Alabama</option>
														<option value="KS">Kansas</option>
														<option value="KY">Kentucky</option>
													</optgroup>
													<optgroup label="Eastern Time Zone">
														<option value="CT">Connecticut</option>
														<option value="DE">Delaware</option>
														<option value="WV">West Virginia</option>
													</optgroup>
												</select>
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Attach screenshot:</label>
											<div class="col-lg-8">
												<input type="file" class="form-control">
												<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Your message:</label>
											<div class="col-lg-8">
												<textarea rows="3" cols="3" class="form-control" placeholder="Enter your message here"></textarea>
											</div>
										</div>

										<div class="text-end">
											<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /centered form -->


					<!-- Centered card -->
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="card">
								<div class="card-header">
									<h5 class="mb-0">Centered card</h5>
								</div>

								<div class="card-body">
									Here the logic is similar to previous example, but instead of wrapping the form in grid containers, the grid is applied to the card that contains the form. Form elements in this case always have 100% width and form width is controlled by grid columns width.
								</div>

								<div class="card-body border-top">
									<form action="#">
										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Enter your name:</label>
											<div class="col-lg-8">
												<input type="text" class="form-control" placeholder="Eugene Kopyov">
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Enter your password:</label>
											<div class="col-lg-8">
												<input type="password" class="form-control" placeholder="Your strong password">
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Select your state:</label>
											<div class="col-lg-8">
												<select data-placeholder="Select your state" class="form-control form-control-select2">
													<option></option>
													<optgroup label="Alaskan/Hawaiian Time Zone">
														<option value="AK">Alaska</option>
														<option value="HI">Hawaii</option>
													</optgroup>
													<optgroup label="Pacific Time Zone">
														<option value="CA">California</option>
														<option value="NV">Nevada</option>
														<option value="WA">Washington</option>
													</optgroup>
													<optgroup label="Mountain Time Zone">
														<option value="AZ">Arizona</option>
														<option value="CO">Colorado</option>
														<option value="ID">Idaho</option>
													</optgroup>
													<optgroup label="Central Time Zone">
														<option value="AL">Alabama</option>
														<option value="IA">Iowa</option>
														<option value="KS">Kansas</option>
													</optgroup>
													<optgroup label="Eastern Time Zone">
														<option value="CT">Connecticut</option>
														<option value="DE">Delaware</option>
														<option value="WV">West Virginia</option>
													</optgroup>
												</select>
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Attach screenshot:</label>
											<div class="col-lg-8">
												<input type="file" class="form-control">
												<div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
											</div>
										</div>

										<div class="row mb-3">
											<label class="col-lg-4 col-form-label">Your message:</label>
											<div class="col-lg-8">
												<textarea rows="3" cols="3" class="form-control" placeholder="Enter your message here"></textarea>
											</div>
										</div>

										<div class="text-end">
											<button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /centered card -->
					<!-- Checkboxes -->
	            	<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Checkboxes</h5>
						</div>

	                	<div class="card-body">
	                		<div class="mb-3">
	                			<h6>Native checkboxes</h6>
		        				<p class="mb-3">The HTML input element <code>&lt;input type=checkbox></code> is an input element to enter an array of different values. The <code>value</code> attribute is used to define the value submitted by the checkbox. The <code>checked</code> attribute is used to indicate whether this item is selected. The <code>indeterminate</code> attribute is used to indicate that the checkbox is in an indeterminate state (on most platforms, this draws a horizontal line across the checkbox).</p>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center">
													<input type="checkbox" id="dc_ls_c" checked>
													<label class="ms-2" for="dc_ls_c">Checked</label>
												</div>

												<div class="d-flex align-items-center mb-2">
													<input type="checkbox" id="dc_ls_u">
													<label class="ms-2" for="dc_ls_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="checkbox" id="dc_ls_cd" checked disabled>
													<label class="ms-2" for="dc_ls_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="checkbox" id="dc_ls_ud" disabled>
													<label class="ms-2" for="dc_ls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked stretched</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center">
													<input type="checkbox" id="dc_lss_c" checked>
													<label class="ms-auto" for="dc_lss_c">Checked</label>
												</div>

												<div class="d-flex align-items-center mb-2">
													<input type="checkbox" id="dc_lss_u">
													<label class="ms-auto" for="dc_lss_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="checkbox" id="dc_lss_cd" checked disabled>
													<label class="ms-auto" for="dc_lss_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="checkbox" id="dc_lss_ud" disabled>
													<label class="ms-auto" for="dc_lss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center flex-row-reverse">
													<input type="checkbox" id="dc_rs_c" checked>
													<label class="me-2" for="dc_rs_c">Checked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse mb-2">
													<input type="checkbox" id="dc_rs_u">
													<label class="me-2" for="dc_rs_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="checkbox" id="dc_rs_cd" checked disabled>
													<label class="me-2" for="dc_rs_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="checkbox" id="dc_rs_ud" disabled>
													<label class="me-2" for="dc_rs_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked stretched</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center flex-row-reverse">
													<input type="checkbox" id="dc_rss_c" checked>
													<label class="me-auto" for="dc_rss_c">Checked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse mb-2">
													<input type="checkbox" id="dc_rss_u">
													<label class="me-auto" for="dc_rss_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="checkbox" id="dc_rss_cd" checked disabled>
													<label class="me-auto" for="dc_rss_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="checkbox" id="dc_rss_ud" disabled>
													<label class="me-auto" for="dc_rss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline</p>
											<div class="border p-3 rounded">
												<div class="d-inline-flex align-items-center me-3">
													<input type="checkbox" id="dc_li_c" checked>
													<label class="ms-2" for="dc_li_c">Checked</label>
												</div>

												<div class="d-inline-flex align-items-center">
													<input type="checkbox" id="dc_li_u">
													<label class="ms-2" for="dc_li_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline</p>
											<div class="border p-3 rounded">
												<div class="d-inline-flex flex-row-reverse align-items-center me-3">
													<input type="checkbox" id="dc_ri_c" checked>
													<label class="me-2" for="dc_ri_c">Checked</label>
												</div>

												<div class="d-inline-flex flex-row-reverse align-items-center">
													<input type="checkbox" id="dc_ri_u">
													<label class="me-2" for="dc_ri_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="mb-3">
		                		<h6>Custom CSS checkboxes</h6>
		        				<p class="mb-3">For even more customization and cross browser consistency, use our completely custom form elements to replace the browser defaults. They’re built on top of semantic and accessible markup, so they’re solid replacements for any default form control. Custom checkboxes can also utilize the <code>:indeterminate</code> pseudo class when manually set via JavaScript (there is no available HTML attribute for specifying it).</p>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check mb-2">
													<input type="checkbox" class="form-check-input" id="cc_ls_c" checked>
													<label class="form-check-label" for="cc_ls_c">Checked</label>
												</div>

												<div class="form-check mb-3">
													<input type="checkbox" class="form-check-input" id="cc_ls_u">
													<label class="form-check-label" for="cc_ls_u">Unchecked</label>
												</div>

												<div class="form-check mb-2">
													<input type="checkbox" class="form-check-input" id="cc_ls_cd" checked disabled>
													<label class="form-check-label" for="cc_ls_cd">Checked disabled</label>
												</div>

												<div class="form-check">
													<input type="checkbox" class="form-check-input" id="cc_ls_ud" disabled>
													<label class="form-check-label" for="cc_ls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked stretched checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check text-end mb-2">
													<input type="checkbox" class="form-check-input" id="cc_lss_c" checked>
													<label class="form-check-label" for="cc_lss_c">Checked</label>
												</div>

												<div class="form-check text-end mb-3">
													<input type="checkbox" class="form-check-input" id="cc_lss_u">
													<label class="form-check-label" for="cc_lss_u">Unchecked</label>
												</div>

												<div class="form-check text-end mb-2">
													<input type="checkbox" class="form-check-input" id="cc_lss_cd" checked disabled>
													<label class="form-check-label" for="cc_lss_cd">Checked disabled</label>
												</div>

												<div class="form-check text-end">
													<input type="checkbox" class="form-check-input" id="cc_lss_ud" disabled>
													<label class="form-check-label" for="cc_lss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-reverse mb-2">
													<input type="checkbox" class="form-check-input" id="cc_rs_c" checked>
													<label class="form-check-label" for="cc_rs_c">Checked</label>
												</div>

												<div class="form-check form-check-reverse mb-3">
													<input type="checkbox" class="form-check-input" id="cc_rs_u">
													<label class="form-check-label" for="cc_rs_u">Unchecked</label>
												</div>

												<div class="form-check form-check-reverse mb-2">
													<input type="checkbox" class="form-check-input" id="cc_rs_cd" checked disabled>
													<label class="form-check-label" for="cc_rs_cd">Checked disabled</label>
												</div>

												<div class="form-check form-check-reverse">
													<input type="checkbox" class="form-check-input" id="cc_rs_ud" disabled>
													<label class="form-check-label" for="cc_rs_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
		        					</div>

		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked stretched checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-reverse text-start mb-2">
													<input type="checkbox" class="form-check-input" id="cc_rss_c" checked>
													<label class="form-check-label" for="cc_rss_c">Checked</label>
												</div>

												<div class="form-check form-check-reverse text-start mb-3">
													<input type="checkbox" class="form-check-input" id="cc_rss_u">
													<label class="form-check-label" for="cc_rss_u">Unchecked</label>
												</div>

												<div class="form-check form-check-reverse text-start mb-2">
													<input type="checkbox" class="form-check-input" id="cc_rss_cd" checked disabled>
													<label class="form-check-label" for="cc_rss_cd">Checked disabled</label>
												</div>

												<div class="form-check form-check-reverse text-start">
													<input type="checkbox" class="form-check-input" id="cc_rss_ud" disabled>
													<label class="form-check-label" for="cc_rss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
		        					</div>
		        				</div>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline">
													<input type="checkbox" class="form-check-input" id="cc_li_c" checked>
													<label class="form-check-label" for="cc_li_c">Checked</label>
												</div>

												<div class="form-check form-check-inline">
													<input type="checkbox" class="form-check-input" id="cc_li_u">
													<label class="form-check-label" for="cc_li_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline checkboxes</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-check-reverse">
													<input type="checkbox" class="form-check-input" id="cc_ri_c" checked>
													<label class="form-check-label" for="cc_ri_c">Checked</label>
												</div>

												<div class="form-check form-check-inline form-check-reverse">
													<input type="checkbox" class="form-check-input" id="cc_ri_u">
													<label class="form-check-label" for="cc_ri_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>
								</div>

		        				<div class="row">
		        					<div class="col-lg-6">
		        						<div class="mb-3">
			        						<p class="fw-semibold">Colors</p>

											<div class="border px-3 pt-3 pb-2 rounded">
												<div class="row">
													<div class="col-md-6">
														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-secondary" checked>
															<span class="form-check-label">Secondary</span>
														</label>

														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-danger" checked>
															<span class="form-check-label">Danger</span>
														</label>

														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-success" checked>
															<span class="form-check-label">Success</span>
														</label>
													</div>

													<div class="col-md-6">
														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-warning" checked>
															<span class="form-check-label">Warning</span>
														</label>

														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-info" checked>
															<span class="form-check-label">Info</span>
														</label>

														<label class="form-check mb-2">
															<input type="checkbox" class="form-check-input form-check-input-dark" checked>
															<span class="form-check-label">Dark</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
		        						<div class="mb-3">
			        						<p class="fw-semibold">Inversed checkbox</p>

											<div class="p-3 bg-dark rounded">
												<div class="row">
													<div class="col-md-6">
														<label class="form-check text-white mb-2">
															<input type="checkbox" class="form-check-input form-check-input-white" checked>
															<span class="form-check-label">Checked</span>
														</label>

														<label class="form-check text-white mb-2">
															<input type="checkbox" class="form-check-input form-check-input-white">
															<span class="form-check-label">Unchecked</span>
														</label>

														<label class="form-check text-white">
															<input type="checkbox" class="form-check-input form-check-input-white" checked disabled>
															<span class="form-check-label">Disabled</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div>
								<h6>Checkbox switches</h6>
		                		<p class="mb-3">A switch has the markup of a custom checkbox but uses the <code>.form-switch</code> class to render a toggle switch. Switches also support the <code>disabled</code> attribute, but unlike custom checkboxes don't support <code>indeterminate</code> state. Supports 6 alternative colors and is ready for dark backgrounds.</p>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-switch mb-2">
													<input type="checkbox" class="form-check-input" id="sc_ls_c" checked>
													<label class="form-check-label" for="sc_ls_c">Checked</label>
												</div>

												<div class="form-check form-switch mb-3">
													<input type="checkbox" class="form-check-input" id="sc_ls_u">
													<label class="form-check-label" for="sc_ls_u">Unchecked</label>
												</div>

												<div class="form-check form-switch mb-2">
													<input type="checkbox" class="form-check-input" id="sc_ls_cd" checked disabled>
													<label class="form-check-label" for="sc_ls_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch">
													<input type="checkbox" class="form-check-input" id="sc_ls_ud" disabled>
													<label class="form-check-label" for="sc_ls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
		        							<p class="fw-semibold">Left stacked stretched switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch text-end mb-2">
													<input type="checkbox" class="form-check-input" id="sc_lss_c" checked>
													<label class="form-check-label" for="sc_lss_c">Checked</label>
												</div>

												<div class="form-check form-switch text-end mb-3">
													<input type="checkbox" class="form-check-input" id="sc_lss_u">
													<label class="form-check-label" for="sc_lss_u">Unchecked</label>
												</div>

												<div class="form-check form-switch text-end mb-2">
													<input type="checkbox" class="form-check-input" id="sc_lss_cd" checked disabled>
													<label class="form-check-label" for="sc_lss_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch text-end">
													<input type="checkbox" class="form-check-input" id="sc_lss_ud" disabled>
													<label class="form-check-label" for="sc_lss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
			        						<p class="fw-semibold">Right stacked switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch form-check-reverse mb-2">
													<input type="checkbox" class="form-check-input" id="sc_rs_c" checked>
													<label class="form-check-label" for="sc_rs_c">Checked</label>
												</div>

												<div class="form-check form-switch form-check-reverse mb-3">
													<input type="checkbox" class="form-check-input" id="sc_rs_u">
													<label class="form-check-label" for="sc_rs_u">Unchecked</label>
												</div>

												<div class="form-check form-switch form-check-reverse mb-2">
													<input type="checkbox" class="form-check-input" id="sc_rs_cd" checked disabled>
													<label class="form-check-label" for="sc_rs_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch form-check-reverse">
													<input type="checkbox" class="form-check-input" id="sc_rs_ud" disabled>
													<label class="form-check-label" for="sc_rs_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
			        						<p class="fw-semibold">Right stacked stretched switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch form-check-reverse text-start mb-2">
													<input type="checkbox" class="form-check-input" id="sc_rss_c" checked>
													<label class="form-check-label" for="sc_rss_c">Checked</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start mb-3">
													<input type="checkbox" class="form-check-input" id="sc_rss_u">
													<label class="form-check-label" for="sc_rss_u">Unchecked</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start mb-2">
													<input type="checkbox" class="form-check-input" id="sc_rss_cd" checked disabled>
													<label class="form-check-label" for="sc_rss_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start">
													<input type="checkbox" class="form-check-input" id="sc_rss_ud" disabled>
													<label class="form-check-label" for="sc_rss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-switch">
													<input type="checkbox" class="form-check-input" id="sc_li_c" checked>
													<label class="form-check-label" for="sc_li_c">Checked</label>
												</div>

												<div class="form-check form-check-inline form-switch">
													<input type="checkbox" class="form-check-input" id="sc_li_u">
													<label class="form-check-label" for="sc_li_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-switch form-check-reverse">
													<input type="checkbox" class="form-check-input" id="sc_ri_c" checked>
													<label class="form-check-label" for="sc_ri_c">Checked</label>
												</div>

												<div class="form-check form-check-inline form-switch form-check-reverse">
													<input type="checkbox" class="form-check-input" id="sc_ri_u">
													<label class="form-check-label" for="sc_ri_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<p class="fw-semibold">Color options</p>

										<div class="border px-3 pt-3 pb-2 rounded mb-3">
											<div class="row">
												<div class="col-lg-6">
													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-secondary" id="sc_r_secondary" checked>
														<label class="form-check-label" for="sc_r_secondary">Secondary</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-danger" id="sc_r_danger" checked>
														<label class="form-check-label" for="sc_r_danger">Danger</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-success" id="sc_r_success" checked>
														<label class="form-check-label" for="sc_r_success">Success</label>
													</div>
												</div>

												<div class="col-lg-6">
													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-warning" id="sc_r_warning" checked>
														<label class="form-check-label" for="sc_r_warning">Warning</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-info" id="sc_r_info" checked>
														<label class="form-check-label" for="sc_r_info">Info</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="checkbox" class="form-check-input form-check-input-dark" id="sc_r_dark" checked>
														<label class="form-check-label" for="sc_r_dark">Dark</label>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<p class="fw-semibold">Inversed colors</p>

										<div class="p-3 bg-dark rounded">
											<div class="row">
												<div class="col-md-6">
													<label class="form-check form-switch text-white mb-2">
														<input type="checkbox" class="form-check-input form-check-input-white" checked>
														<span class="form-check-label">Checked</span>
													</label>

													<label class="form-check form-switch text-white mb-2">
														<input type="checkbox" class="form-check-input form-check-input-white">
														<span class="form-check-label">Unchecked</span>
													</label>

													<label class="form-check form-switch text-white">
														<input type="checkbox" class="form-check-input form-check-input-white" checked disabled>
														<span class="form-check-label">Disabled</span>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
	                	</div>
	                </div>
	                <!-- /checkboxes -->


					<!-- Radios -->
	            	<div class="card">
						<div class="card-header">
							<h5 class="card-title">Radios</h5>
							<span class="card-subtitle text-muted">Native, custom and switches. Left and right alignment</span>
						</div>

	                	<div class="card-body">
	                		<div class="mb-3">
	                			<h6>Native radios</h6>
		        				<p class="mb-3">Radio button is an element that can be turned on and off. Radio buttons are almost always grouped together in groups. Only one radio button within the same <code>radiogroup</code> may be selected at a time. The user can switch which radio button is turned on by selecting it with the mouse or keyboard. Other radio buttons in the same group are turned off. A label, specified with the <code>label</code> attribute may be added beside the radio button.</p>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center">
													<input type="radio" name="dr_ls" id="dr_ls_c" checked>
													<label class="ms-2" for="dr_ls_c">Checked</label>
												</div>

												<div class="d-flex align-items-center mb-2">
													<input type="radio" name="dr_ls" id="dr_ls_u">
													<label class="ms-2" for="dr_ls_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="radio" id="dr_ls_cd" checked disabled>
													<label class="ms-2" for="dr_ls_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="radio" id="dr_ls_ud" disabled>
													<label class="ms-2" for="dr_ls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked stretched</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center">
													<input type="radio" name="dr_ls_r" id="dr_ls_r_c" checked>
													<label class="ms-auto" for="dr_ls_r_c">Checked</label>
												</div>

												<div class="d-flex align-items-center mb-2">
													<input type="radio" name="dr_ls_r" id="dr_ls_r_u">
													<label class="ms-auto" for="dr_ls_r_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="radio" id="dr_ls_r_cd" checked disabled>
													<label class="ms-auto" for="dr_ls_r_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center disabled">
													<input type="radio" id="dr_ls_r_ud" disabled>
													<label class="ms-auto" for="dr_ls_r_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center flex-row-reverse">
													<input type="radio" name="dr_rs" id="dr_rs_c" checked>
													<label class="me-2" for="dr_rs_c">Checked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse mb-2">
													<input type="radio" name="dr_rs" id="dr_rs_u">
													<label class="me-2" for="dr_rs_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="radio" id="dr_rs_cd" checked disabled>
													<label class="me-2" for="dr_rs_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="radio" id="dr_rs_ud" disabled>
													<label class="me-2" for="dr_rs_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked stretched</p>
											<div class="border p-3 rounded">
												<div class="d-flex align-items-center flex-row-reverse">
													<input type="radio" name="dr_rls" id="dr_rls_c" checked>
													<label class="me-auto" for="dr_rls_c">Checked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse mb-2">
													<input type="radio" name="dr_rls" id="dr_rls_u">
													<label class="me-auto" for="dr_rls_u">Unchecked</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="radio" id="dr_rls_cd" checked disabled>
													<label class="me-auto" for="dr_rls_cd">Checked disabled</label>
												</div>

												<div class="d-flex align-items-center flex-row-reverse disabled">
													<input type="radio" id="dr_rls_ud" disabled>
													<label class="me-auto" for="dr_rls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline</p>
											<div class="border p-3 rounded">
												<div class="d-inline-flex align-items-center me-3">
													<input type="radio" name="dr_li" id="dr_li_c" checked>
													<label class="ms-2" for="dr_li_c">Checked</label>
												</div>

												<div class="d-inline-flex align-items-center">
													<input type="radio" name="dr_li" id="dr_li_u">
													<label class="ms-2" for="dr_li_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline</p>
											<div class="border p-3 rounded">
												<div class="d-inline-flex flex-row-reverse align-items-center me-3">
													<input type="radio" name="dr_ri" id="dr_ri_c" checked>
													<label class="me-2" for="dr_ri_c">Checked</label>
												</div>

												<div class="d-inline-flex flex-row-reverse align-items-center">
													<input type="radio" name="dr_ri" id="dr_ri_u">
													<label class="me-2" for="dr_ri_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="mb-3">
								<h6>Custom CSS radios</h6>
		        				<p class="mb-3">Custom radios use the same approach as checkboxes, they share the same set of colors and styles. Both can be easily customized in <code>_variables-core.scss</code> file simply by changing shared variable values. Here are the examples of label alignment, single radio with no text label is also supported.</p>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked radios</p>

											<div class="border p-3 rounded">
												<div class="form-check mb-2">
													<input type="radio" class="form-check-input" name="cr-l" id="cr_l_s_s" checked>
													<label class="form-check-label" for="cr_l_s_s">Selected</label>
												</div>

												<div class="form-check mb-3">
													<input type="radio" class="form-check-input" name="cr-l" id="cr_l_s_u">
													<label class="form-check-label" for="cr_l_s_u">Unselected</label>
												</div>

												<div class="form-check mb-2">
													<input type="radio" class="form-check-input" id="cr_l_s_sd" checked disabled>
													<label class="form-check-label" for="cr_l_s_sd">Selected disabled</label>
												</div>

												<div class="form-check">
													<input type="radio" class="form-check-input" id="cr_l_s_ud" disabled>
													<label class="form-check-label" for="cr_l_s_ud">Unselected disabled</label>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked stretched radios</p>

											<div class="border p-3 rounded">
												<div class="form-check text-end mb-2">
													<input type="radio" class="form-check-input" name="cr_l_s" id="cr_lr_s_s" checked>
													<label class="form-check-label" for="cr_lr_s_s">Selected</label>
												</div>

												<div class="form-check text-end mb-3">
													<input type="radio" class="form-check-input" name="cr_l_s" id="cr_lr_s_u">
													<label class="form-check-label" for="cr_lr_s_u">Unselected</label>
												</div>

												<div class="form-check text-end mb-2">
													<input type="radio" class="form-check-input" id="cr_lr_s_sd" checked disabled>
													<label class="form-check-label" for="cr_lr_s_sd">Selected disabled</label>
												</div>

												<div class="form-check text-end">
													<input type="radio" class="form-check-input" id="cr_lr_s_ud" disabled>
													<label class="form-check-label" for="cr_lr_s_ud">Unselected disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

		        				<div class="row">
		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked radios</p>

											<div class="border p-3 rounded">
												<div class="form-check text-end form-check-reverse mb-2">
													<input type="radio" class="form-check-input" name="cr-r" id="cr_r_s_s" checked>
													<label class="form-check-label" for="cr_r_s_s">Selected</label>
												</div>

												<div class="form-check text-end form-check-reverse mb-3">
													<input type="radio" class="form-check-input" name="cr-r" id="cr_r_s_u">
													<label class="form-check-label" for="cr_r_s_u">Unselected</label>
												</div>

												<div class="form-check text-end form-check-reverse mb-2">
													<input type="radio" class="form-check-input" id="cr_r_s_sd" checked disabled>
													<label class="form-check-label" for="cr_r_s_sd">Selected disabled</label>
												</div>

												<div class="form-check text-end form-check-reverse">
													<input type="radio" class="form-check-input" id="cr_r_s_ud" disabled>
													<label class="form-check-label" for="cr_r_s_ud">Unselected disabled</label>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right stacked stretched radios</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-reverse text-start mb-2">
													<input type="radio" class="form-check-input" name="cr_r_s" id="cr_rl_s_s" checked>
													<label class="form-check-label" for="cr_rl_s_s">Selected</label>
												</div>

												<div class="form-check form-check-reverse text-start mb-3">
													<input type="radio" class="form-check-input" name="cr_r_s" id="cr_rl_s_u">
													<label class="form-check-label" for="cr_rl_s_u">Unselected</label>
												</div>

												<div class="form-check form-check-reverse text-start mb-2">
													<input type="radio" class="form-check-input" id="cr_rl_s_sd" checked disabled>
													<label class="form-check-label" for="cr_rl_s_sd">Selected disabled</label>
												</div>

												<div class="form-check form-check-reverse text-start">
													<input type="radio" class="form-check-input" id="cr_rl_s_ud" disabled>
													<label class="form-check-label" for="cr_rl_s_ud">Unselected disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline radios</p>
											<div class="border p-3 rounded">
												<div class="form-check form-check-inline">
													<input type="radio" class="form-check-input" name="cr-i-l" id="cr_l_i_s" checked>
													<label class="form-check-label" for="cr_l_i_s">Selected</label>
												</div>

												<div class="form-check form-check-inline">
													<input type="radio" class="form-check-input" name="cr-i-l" id="cr_l_i_u">
													<label class="form-check-label" for="cr_l_i_u">Unselected</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline radios</p>
											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-check-reverse">
													<input type="radio" class="form-check-input" name="cr-i-r" id="cr_r_i_s" checked>
													<label class="form-check-label" for="cr_r_i_s">Selected</label>
												</div>

												<div class="form-check form-check-inline form-check-reverse">
													<input type="radio" class="form-check-input" name="cr-i-r" id="cr_r_i_u">
													<label class="form-check-label" for="cr_r_i_u">Unselected</label>
												</div>
											</div>
										</div>
									</div>
								</div>

		        				<div class="row">
		        					<div class="col-lg-6">
		        						<div class="mb-3">
			        						<p class="fw-semibold">Contextual colors</p>
											<div class="border px-3 pt-3 pb-2 rounded">
												<div class="row">
													<div class="col-md-6">
														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-secondary" name="radio_contextual_colors" checked>
															<span class="form-check-label">Secondary</span>
														</label>

														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-danger" name="radio_contextual_colors">
															<span class="form-check-label">Danger</span>
														</label>

														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-success" name="radio_contextual_colors">
															<span class="form-check-label">Success</span>
														</label>
													</div>

													<div class="col-md-6">
														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-warning" name="radio_contextual_colors">
															<span class="form-check-label">Warning</span>
														</label>

														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-info" name="radio_contextual_colors">
															<span class="form-check-label">Info</span>
														</label>

														<label class="form-check mb-2">
															<input type="radio" class="form-check-input form-check-input-dark" name="radio_contextual_colors">
															<span class="form-check-label">Dark</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>

		        					<div class="col-lg-6">
		        						<div class="mb-3">
			        						<p class="fw-semibold">Inversed radio</p>
											<div class="p-3 bg-dark rounded">
												<div class="row">
													<div class="col-md-6">
														<label class="form-check text-white mb-2">
															<input type="radio" class="form-check-input form-check-input-white" name="radio_inverse_colors" checked>
															<span class="form-check-label">Checked</span>
														</label>

														<label class="form-check text-white mb-2">
															<input type="radio" class="form-check-input form-check-input-white" name="radio_inverse_colors">
															<span class="form-check-label">Unchecked</span>
														</label>

														<label class="form-check text-white">
															<input type="radio" class="form-check-input form-check-input-white" name="radio_inverse_colors" disabled>
															<span class="form-check-label">Disabled</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div>
		                		<h6>Radio switches</h6>
		                		<p class="mb-3">You can also use normal radio buttons as switches, all default colors and shapes are supported as well. Use same class names, but different input type and other attributes like <code>name</code>, <code>id</code> and <code>value</code>. None of these examples requires JS, all inputs are designed with pure CSS.</p>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left stacked switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-switch mb-2">
													<input type="radio" class="form-check-input" name="sr-ls" id="sr_ls_c" checked>
													<label class="form-check-label" for="sr_ls_c">Checked</label>
												</div>

												<div class="form-check form-switch mb-3">
													<input type="radio" class="form-check-input" name="sr-ls" id="sr_ls_u">
													<label class="form-check-label" for="sr_ls_u">Unchecked</label>
												</div>

												<div class="form-check form-switch mb-2">
													<input type="radio" class="form-check-input" id="sr_ls_cd" checked disabled>
													<label class="form-check-label" for="sr_ls_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch">
													<input type="radio" class="form-check-input" id="sr_ls_ud" disabled>
													<label class="form-check-label" for="sr_ls_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
		        							<p class="fw-semibold">Left stacked stretched switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch text-end mb-2">
													<input type="radio" class="form-check-input" name="sr_lss" id="sr_lss_c" checked>
													<label class="form-check-label" for="sr_lss_c">Checked</label>
												</div>

												<div class="form-check form-switch text-end mb-3">
													<input type="radio" class="form-check-input" name="sr_lss" id="sr_lss_u">
													<label class="form-check-label" for="sr_lss_u">Unchecked</label>
												</div>

												<div class="form-check form-switch text-end mb-2">
													<input type="radio" class="form-check-input" id="sr_lss_cd" checked disabled>
													<label class="form-check-label" for="sr_lss_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch text-end">
													<input type="radio" class="form-check-input" id="sr_lss_ud" disabled>
													<label class="form-check-label" for="sr_lss_ud">Unchecked disabled</label>
												</div>	
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
			        						<p class="fw-semibold">Right stacked switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch form-check-reverse mb-2">
													<input type="radio" class="form-check-input" name="sr-rs" id="sr_rs_c" checked>
													<label class="form-check-label" for="sr_rs_c">Checked</label>
												</div>

												<div class="form-check form-switch form-check-reverse mb-3">
													<input type="radio" class="form-check-input" name="sr-rs" id="sr_rs_u">
													<label class="form-check-label" for="sr_rs_u">Unchecked</label>
												</div>

												<div class="form-check form-switch form-check-reverse mb-2">
													<input type="radio" class="form-check-input" id="sr_rs_cd" checked disabled>
													<label class="form-check-label" for="sr_rs_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch form-check-reverse">
													<input type="radio" class="form-check-input" id="sr_rs_ud" disabled>
													<label class="form-check-label" for="sr_rs_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
			        						<p class="fw-semibold">Right stacked stretched switches</p>

			        						<div class="border p-3 rounded">
												<div class="form-check form-switch form-check-reverse text-start mb-2">
													<input type="radio" class="form-check-input" name="sr-rss" id="sr_rss_c" checked>
													<label class="form-check-label" for="sr_rss_c">Checked</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start mb-3">
													<input type="radio" class="form-check-input" name="sr-rss" id="sr_rss_u">
													<label class="form-check-label" for="sr_rss_u">Unchecked</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start mb-2">
													<input type="radio" class="form-check-input" id="sr_rss_cd" checked disabled>
													<label class="form-check-label" for="sr_rss_cd">Checked disabled</label>
												</div>

												<div class="form-check form-switch form-check-reverse text-start">
													<input type="radio" class="form-check-input" id="sr_rss_ud" disabled>
													<label class="form-check-label" for="sr_rss_ud">Unchecked disabled</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Left inline switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-switch">
													<input type="radio" class="form-check-input" name="sr-li" id="sr_li_c" checked>
													<label class="form-check-label" for="sr_li_c">Checked</label>
												</div>

												<div class="form-check form-check-inline form-switch">
													<input type="radio" class="form-check-input" name="sr-li" id="sr_li_u">
													<label class="form-check-label" for="sr_li_u">Unchecked</label>
												</div>

												<div class="mt-2 ms-auto my-auto d-inline-flex align-items-center gap-3">
													View Type:
													<label class="custom-switch mb-0">
														<input type="checkbox" id="togBtn" />
														<div class="slider round">
															<span class="on">Buyers</span>
															<span class="off">Sellers</span>
														</div>
													</label>

													<label class="form-check form-switch form-check-reverse mb-0">
														<input type="checkbox" id="SwitchOnbarOffbar" class="form-check-input">
														<span class="form-check-label">OnBar/OffBar :</span>
													</label>
												</div>

											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="mb-3">
											<p class="fw-semibold">Right inline switches</p>

											<div class="border p-3 rounded">
												<div class="form-check form-check-inline form-switch form-check-reverse">
													<input type="radio" class="form-check-input" name="sr-ri" id="sr_ri_c" checked>
													<label class="form-check-label" for="sr_ri_c">Checked</label>
												</div>

												<div class="form-check form-check-inline form-switch form-check-reverse">
													<input type="radio" class="form-check-input" name="sr-ri" id="sr_ri_u">
													<label class="form-check-label" for="sr_ri_u">Unchecked</label>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<p class="fw-semibold">Color options</p>

										<div class="border px-3 pt-3 pb-2 rounded mb-3">
											<div class="row">
												<div class="col-lg-6">
													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-secondary" name="radio-switch-colors" id="sr_r_secondary" checked>
														<label class="form-check-label" for="sr_r_secondary">Secondary</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-danger" name="radio-switch-colors" id="sr_r_danger">
														<label class="form-check-label" for="sr_r_danger">Danger</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-success" name="radio-switch-colors" id="sr_r_success">
														<label class="form-check-label" for="sr_r_success">Success</label>
													</div>
												</div>

												<div class="col-lg-6">
													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-warning" name="radio-switch-colors" id="sr_r_warning">
														<label class="form-check-label" for="sr_r_warning">Warning</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-info" name="radio-switch-colors" id="sr_r_info">
														<label class="form-check-label" for="sr_r_info">Info</label>
													</div>

													<div class="form-check form-switch mb-2">
														<input type="radio" class="form-check-input form-check-input-dark" name="radio-switch-colors" id="sr_r_dark">
														<label class="form-check-label" for="sr_r_dark">Dark</label>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<p class="fw-semibold">Inversed colors</p>

										<div class="p-3 bg-dark rounded">
											<div class="row">
												<div class="col-md-6">
													<label class="form-check form-switch text-white mb-2">
														<input type="radio" class="form-check-input form-check-input-white" name="radio-switch-white" checked>
														<span class="form-check-label">Checked</span>
													</label>

													<label class="form-check form-switch text-white mb-2">
														<input type="radio" class="form-check-input form-check-input-white" name="radio-switch-white">
														<span class="form-check-label">Unchecked</span>
													</label>

													<label class="form-check form-switch text-white">
														<input type="radio" class="form-check-input form-check-input-white" checked disabled>
														<span class="form-check-label">Disabled</span>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
	                	</div>
	                </div>
	                <!-- /radio switches -->

					<!-- Bordered alerts -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Bordered alerts</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">All alerts have border by default and depending on use case and/or alert location, border can be removed or made stronger for a stronger appearance. Use border color helper classes to change border color if necessary. Use <code>.alert-dismissible</code> to add a close button functionality and <code>.alert-link</code> utility class to quickly provide matching colored links within any alert.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Examples</div>

							<div class="row">
								<div class="col-lg-6">
									<p>Primary alert</p>
									<div class="alert alert-primary alert-dismissible fade show">
										<span class="fw-semibold">Morning!</span> We're glad to <a href="#" class="alert-link">see you again</a> and wish you a nice day.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Danger alert</p>
									<div class="alert alert-danger alert-dismissible fade show">
										<span class="fw-semibold">Oh snap!</span> Change a few things up and <a href="#" class="alert-link">try submitting again</a>.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Success alert</p>
									<div class="alert alert-success alert-dismissible fade show">
										<span class="fw-semibold">Well done!</span> You successfully read <a href="#" class="alert-link">this important</a> alert message.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>
								</div>

								<div class="col-lg-6">
									<p>Warning alert</p>
									<div class="alert alert-warning alert-dismissible fade show">
										<span class="fw-semibold">Warning!</span> Better <a href="#" class="alert-link">check yourself</a>, you're not looking too good.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Info alert</p>
									<div class="alert alert-info alert-dismissible fade show">
										<span class="fw-semibold">Heads up!</span> This alert needs your attention, but it's not <a href="#" class="alert-link">super important</a>.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Custom color</p>
									<div class="alert alert-purple alert-dismissible fade show">
										<span class="fw-semibold">Surprise!</span> This is a super-duper nice looking <a href="#" class="alert-link">alert</a> with custom color.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>
								</div>
							</div>
						</div>
					</div>
					<!-- /bordered alerts -->


					<!-- Basic alerts with left icon -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Left icon</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">Alerts with <code>left</code> aligned block and inline icons. Block icon is a separate element that requires background color and text color utility classes, along with <code>.alert-icon</code> class that adds necessary styling. Alert container requires <code>.alert-icon-[left|right]</code> class depending on icon alignment. Inline icon inherits color from contextual alert class and doesn't require any additions.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Inline icon</div>
							<div class="row">
								<div class="col-lg-6">
									<p>Primary alert</p>
									<div class="alert alert-primary alert-dismissible fade show">
										<i class="ph-bell-ringing me-2"></i>
										<span class="fw-semibold">Morning!</span> We're glad to <a href="#" class="alert-link">see you again</a> and wish you a nice day.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Danger alert</p>
									<div class="alert alert-danger alert-dismissible fade show">
										<i class="ph-x-circle me-2"></i>
										<span class="fw-semibold">Oh snap!</span> Change a few things up and <a href="#" class="alert-link">try submitting again</a>.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Success alert</p>
									<div class="alert alert-success alert-dismissible fade show">
										<i class="ph-check-circle me-2"></i>
										<span class="fw-semibold">Well done!</span> You successfully read <a href="#" class="alert-link">this important</a> alert message.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>
								</div>

								<div class="col-lg-6">
									<p>Warning alert</p>
									<div class="alert alert-warning alert-dismissible fade show">
										<i class="ph-warning-circle me-2"></i>
										<span class="fw-semibold">Warning!</span> Better <a href="#" class="alert-link">check yourself</a>, you're not looking too good.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Info alert</p>
									<div class="alert alert-info alert-dismissible fade show">
										<i class="ph-info me-2"></i>
										<span class="fw-semibold">Heads up!</span> This alert needs your attention, but it's not <a href="#" class="alert-link">super important</a>.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>

									<p>Custom color</p>
									<div class="alert alert-indigo alert-dismissible fade show">
										<i class="ph-gear me-2"></i>
										<span class="fw-semibold">Surprise!</span> This is a super-duper nice looking <a href="#" class="alert-link">alert</a> with custom color.
										<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								    </div>
								</div>
							</div>
						</div>
					</div>
					<!-- /basic alerts with left icon -->

					<!-- Basic badges -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Default badges</h5>
						</div>

						<div class="card-body">
							Badge component allows you to easily highlight new or unread items, label and categorize using keywords that describe them, notify users about some useful information and mark items depending on the priority. Badges don't have background color by default and require <code>.bg-*</code> color utility classes, some of them also require <code>.text-*</code> classes to match color contrast ratio.
						</div>

						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<th colspan="3" class="table-light">Basic examples</th>
									</tr>
									<tr>
										<td style="width: 25%;">Primary badge</td>
										<td style="width: 20%;"><span class="badge bg-primary">Primary</span></td>
										<td>Primary color. To use, add <code>.bg-primary</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Secondary badge</td>
										<td><span class="badge bg-secondary">Secondary</span></td>
										<td>Secondary color. To use, add <code>.bg-secondary</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Danger badge</td>
										<td><span class="badge bg-danger">Danger</span></td>
										<td>Red badge in danger context. To use, add <code>.bg-danger</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Success badge</td>
										<td><span class="badge bg-success">Success</span></td>
										<td>Green badge in success context. To use, add <code>.bg-success</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Warning badge</td>
										<td><span class="badge bg-warning">Warning</span></td>
										<td>Orange badge in warning context. To use, add <code>.bg-warning</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Info badge</td>
										<td><span class="badge bg-info">Info</span></td>
										<td>Cyan badge in info context. To use, add <code>.bg-info</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Light badge</td>
										<td><span class="badge bg-light text-body">Light</span></td>
										<td>Light color. To use, add <code>.bg-light</code> and <code>.text-body</code> classes to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Dark badge</td>
										<td><span class="badge bg-dark">Dark</span></td>
										<td>Dark color. To use, add <code>.bg-dark</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Transparent badge</td>
										<td><span class="badge text-body">Transparent</span></td>
										<td>Badge with transparent background. To use, add <code>.text-body</code> class to the base <code>.badge</code> container</td>
									</tr>

									<tr>
										<th colspan="3" class="table-light">Additional colors</th>
									</tr>
									<tr>
										<td>Pink badge color</td>
										<td><span class="badge bg-pink">Pink</span></td>
										<td>Pink color. To use, add <code>.bg-pink</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Purple badge color</td>
										<td><span class="badge bg-purple">Purple</span></td>
										<td>Purple color. To use, add <code>.bg-purple</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Indigo badge color</td>
										<td><span class="badge bg-indigo">Indigo</span></td>
										<td>Indigo color. To use, add <code>.bg-indigo</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Teal badge color</td>
										<td><span class="badge bg-teal">Teal</span></td>
										<td>Teal color. To use, add <code>.bg-teal</code> class to the base <code>.badge</code> container</td>
									</tr>
									<tr>
										<td>Yellow badge color</td>
										<td><span class="badge bg-yellow text-black">Yellow</span></td>
										<td>Yellow color. To use, add <code>.bg-yellow</code> and <code>.text-black</code> classes to the base <code>.badge</code> container</td>
									</tr>

									<tr>
										<th colspan="3" class="table-light">Optional styles</th>
									</tr>
									<tr>
										<td>Roundless badge</td>
										<td><span class="badge bg-success rounded-0">Roundless badge</span></td>
										<td>This badge doesn't have rounded borders. To use, add <code>.rounded-0</code> class to the <code>.badge</code> element</td>
									</tr>
									<tr>
										<td>Block badge</td>
										<td><span class="badge bg-danger d-block">Block badge</span></td>
										<td>This badge fills 100% width of a parent element. To use, add <code>.d-block</code> or <code>.w-100</code> class to the <code>.badge</code> element</td>
									</tr>
									<tr>
										<td>Linked badge</td>
										<td><a href="#" class="badge bg-primary">Linked badge</a></td>
										<td>You can also use badges as a link in an <code>&lt;a></code> element</td>
									</tr>
									<tr>
										<td>Label with dropdown</td>
										<td>
											<div class="dropdown">
												<a href="#" class="badge bg-indigo d-inline-flex align-items-center dropdown-toggle" data-bs-toggle="dropdown">Dropdown</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-danger rounded-pill me-2"></span>
														High priority
													</a>
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-info rounded-pill me-2"></span>
														Normal priority
													</a>
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-primary rounded-pill me-2"></span>
														Low priority
													</a>
												</div>
											</div>
										</td>
										<td>Dropdown menu attached to the badge</td>
									</tr>

									<tr class="table-border-solid">
										<td>Icon in badge</td>
										<td>
											<span class="badge bg-warning p-1">
												<i class="ph-star"></i>
											</span>
										</td>
										<td>Badge with icon. To use, add <code>.p-1</code> and color classes to <code>.badge</code> element</td>
									</tr>
									<tr>
										<td>Icon in linked badge</td>
										<td>
											<a href="#" class="badge bg-primary p-1">
												<i class="ph-gear"></i>
											</a>
										</td>
										<td>Linked badge with icon. To use, add <code>.p-1</code> and color classes to <code>.badge</code> link element</td>
									</tr>
									<tr>
										<td>Icon in rounded badge</td>
										<td>
											<span class="badge bg-pink rounded-pill p-1">
												<i class="ph-bell"></i>
											</span>
										</td>
										<td>Rounded linked icon. Usage is the same, but with additional <code>.rounded-pill</code> class</td>
									</tr>
									<tr>
										<td>Icon in linked rounded badge</td>
										<td>
											<a href="#" class="badge bg-secondary rounded-pill p-1">
												<i class="ph-map-pin"></i>
											</a>
										</td>
										<td>The same as above, but inside link element</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /basic badges -->

					<!-- Pill badges -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Pill badges</h5>
						</div>

						<div class="card-body">
							Rounded badges is a classic style of numeric values, mostly used as counters. All badges have minimum width that equals badge height, which means the badge is displayed as a perfect circle if the value consists of 1 digit and grows horizontally. No custom badge classes are required, just use global <code>.rounded-pill</code> utility class in <code>.badge</code> element.
						</div>

						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<th colspan="3" class="table-light">Basic examples</th>
									</tr>
									<tr>
										<td style="width: 25%;">Primary pill badge</td>
										<td style="width: 20%;"><span class="badge bg-primary rounded-pill">32</span></td>
										<td>Primary color. Use <code>.bg-primary</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Secondary pill badge</td>
										<td><span class="badge bg-secondary rounded-pill">78</span></td>
										<td>Secondary color. Use <code>.bg-secondary</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Danger pill badge</td>
										<td><span class="badge bg-danger rounded-pill">34</span></td>
										<td>Red color in danger context. Use <code>.bg-danger</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Success pill badge</td>
										<td><span class="badge bg-success rounded-pill">65</span></td>
										<td>Green color in success context. Use <code>.bg-success</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Warning pill badge</td>
										<td><span class="badge bg-warning rounded-pill">76</span></td>
										<td>Orange color in warning context. Use <code>.bg-warning</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Info pill badge</td>
										<td><span class="badge bg-info rounded-pill">98</span></td>
										<td>Cyan color in info context. Use <code>.bg-info</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Light pill badge</td>
										<td><span class="badge bg-light text-body rounded-pill">24</span></td>
										<td>Light color. Use <code>.bg-light.text-body</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Dark pill badge</td>
										<td><span class="badge bg-dark rounded-pill">72</span></td>
										<td>Dark color. Use <code>.bg-dark</code> and <code>.rounded-pill</code> classes</td>
									</tr>

									<tr>
										<th colspan="3" class="table-light">Additional colors</th>
									</tr>
									<tr>
										<td>Pink badge color</td>
										<td><span class="badge bg-pink rounded-pill">48</span></td>
										<td>Pink color. Use <code>.bg-pink</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Purple badge color</td>
										<td><span class="badge bg-purple rounded-pill">54</span></td>
										<td>Purple color. Use <code>.bg-purple</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Indigo badge color</td>
										<td><span class="badge bg-indigo rounded-pill">20</span></td>
										<td>Indigo color. Use <code>.bg-indigo</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Teal badge color</td>
										<td><span class="badge bg-teal rounded-pill">86</span></td>
										<td>Teal color. Use <code>.bg-teal</code> and <code>.rounded-pill</code> classes</td>
									</tr>
									<tr>
										<td>Yellow badge color</td>
										<td><span class="badge bg-yellow text-dark rounded-pill">42</span></td>
										<td>Yellow color. To use, add <code>.bg-yellow.text-dark</code> and <code>.rounded-pill</code> classes</td>
									</tr>

									<tr>
										<th colspan="3" class="table-light">Pill badge options</th>
									</tr>
									<tr>
										<td>Linked badge</td>
										<td><a href="#" class="badge bg-danger rounded-pill">22</a></td>
										<td>Linked badge. Use <code>.badge</code> and other badge classes in <code>&lt;a></code> element</td>
									</tr>
									<tr>
										<td>Badge with dropdown</td>
										<td>
											<div class="droppdown">
												<a href="#" class="badge bg-primary rounded-pill d-inline-flex align-items-center dropdown-toggle" data-bs-toggle="dropdown">57</a>

												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-danger rounded-pill me-2"></span>
														High priority
													</a>
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-info rounded-pill me-2"></span>
														Normal priority
													</a>
													<a href="#" class="dropdown-item">
														<span class="border border-width-4 border-primary rounded-pill me-2"></span>
														Low priority
													</a>
												</div>
											</div>
										</td>
										<td>Dropdown menu attached to the <code>badge</code> element.</td>
									</tr>

									
								</tbody>
							</table>
						</div>
					</div>
					<!-- /pill badges -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Buttons</h5>
						</div>

						<div class="card-body">


							<!-- Light button -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Light button</h6>
										<p class="mb-3">Light button is considered default in the UI. Use <code>.btn.btn-light</code> classes in anchor, button or input element</p>

										<div>
											<button type="button" class="btn btn-light">Default button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Light with icon</h6>
										<p class="mb-3">Light button can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<button type="button" class="btn btn-light">
												<i class="ph-check-circle me-2"></i>
												With icon
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Light with menu</h6>
										<p class="mb-3">Light button also supports dropdown menus in various directions. Use <code>.dropdown-toggle</code> to display directional arrow</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /light button -->


							<!-- Solid button -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid button</h6>
										<p class="mb-3">Solid button supports 14 predefined colors. Use <code>.btn.btn-[color]</code> classes in anchor, button or input element</p>

										<div>
											<button type="button" class="btn btn-primary">Default button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid with icon</h6>
										<p class="mb-3">Solid button can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<button type="button" class="btn btn-primary">
												<i class="ph-check-square-offset me-2"></i>
												With icon
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid with menu</h6>
										<p class="mb-3">Solid button also supports dropdown menus in various directions. Use <code>.dropdown-toggle</code> to display directional arrow</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /solid button -->


							<!-- Outline buttons -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline button</h6>
										<p class="mb-3">Use <code>.btn.btn-outline-[color]</code> classes on button element to remove background color in default state</p>

										<div>
											<button type="button" class="btn btn-outline-primary">Default button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline with icon</h6>
										<p class="mb-3">Outline button can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<button type="button" class="btn btn-outline-primary">
												<i class="ph-check-square-offset me-2"></i>
												With icon
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline with menu</h6>
										<p class="mb-3">Outline button also supports dropdown menus in various directions. Use <code>.dropdown-toggle</code> to display directional arrow</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /outline buttons -->


							<!-- Outline static -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Static outline button</h6>
										<p class="mb-3">Static outline button has no background color in all states. Use <code>.link-[color]</code> and <code>.border-[color]</code> classes on <code>.btn</code> element</p>

										<div>
											<button type="button" class="btn link-primary border-primary">Default button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid with icon</h6>
										<p class="mb-3">Static outline button can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<button type="button" class="btn link-primary border-primary">
												<i class="ph-check-square-offset me-2"></i>
												With icon
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid with menu</h6>
										<p class="mb-3">Static outline button also supports dropdown menus in various directions. Use <code>.dropdown-toggle</code> to display directional arrow</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn link-primary border-primary dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /static outline -->

							<!-- Border options -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Transparent border</h6>
										<p class="mb-3">Use <code>.border-transparent</code> class in addition to <code>.btn-outline-[color]</code> to make border transparent in all button states
										</p>

										<div>
											<button type="button" class="btn btn-outline-primary border-transparent">Transparent border</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Default border</h6>
										<p class="mb-3">All outline buttons have <code>1px</code> border width by default and don't require any additional border utility classes</p>

										<div>
											<button type="button" class="btn btn-outline-primary">Default border</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Thick border</h6>
										<p class="mb-3">You can control border width in outline buttons with our <code>.border-width-[size]</code> utility classes. Here border width is 2px</p>

										<div>
											<button type="button" class="btn btn-outline-primary border-width-2">Thick border</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /border options -->

							 <!-- Border options in flat button -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Transparent border</h6>
										<p class="mb-3">Use <code>.border-transparent</code> class in addition to <code>.btn-flat-[color]</code> to make border transparent in all button states</p>

										<div>
											<button type="button" class="btn btn-flat-primary border-transparent">Transparent border</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Default border</h6>
										<p class="mb-3">All flat buttons have 1px border width by default and don't require any additional border utility classes</p>

										<div>
											<button type="button" class="btn btn-flat-primary border-primary">Default border</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Thick border</h6>
										<p class="mb-3">You can control border width in flat buttons with our <code>.border-width-[size]</code> utility classes. Here border width is 2px</p>

										<div>
											<button type="button" class="btn btn-flat-primary border-primary border-width-2">Thick border</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /border options in flat button -->

							<!-- Link button -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Link button</h6>
										<p class="mb-3">Link button has same size as other buttons, but background and border colors are transparent and text color is similar to text link color</p>

										<div>
											<button type="button" class="btn btn-link">Link button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Link button with icon</h6>
										<p class="mb-3">Link button can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<button type="button" class="btn btn-link">
												<i class="ph-check-square-offset me-2"></i>
												With icon
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Link button with menu</h6>
										<p class="mb-3">Link button also supports dropdown menus in various directions. Use <code>.dropdown-toggle</code> to display directional arrow</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-link dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /link button -->

							<!-- Solid button sizes -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid button sizes</h6>
										<p class="mb-3">Use <code>.btn-[color].btn-[sm|lg]</code> classes to control solid button size. Default button size doesn't require additional class names</p>

										<div class="mb-2">
											<button type="button" class="btn btn-primary btn-lg">
												<i class="ph-chats ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-danger">
												<i class="ph-chats me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-success btn-sm">
												<i class="ph-chats ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Solid button with label</h6>
										<p class="mb-3">Use <code>.btn-[color].btn-[sm|lg]</code> and <code>.btn-labeled.btn-labeled-[start|end]</code> classes to control labeled solid button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-primary btn-labeled btn-labeled-start btn-lg">
												<span class="btn-labeled-icon bg-black bg-opacity-20">
													<i class="ph-map-pin ph-lg"></i>
												</span>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-danger btn-labeled btn-labeled-start">
												<span class="btn-labeled-icon bg-black bg-opacity-20">
													<i class="ph-map-pin"></i>
												</span>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-success btn-labeled btn-labeled-start btn-sm">
												<span class="btn-labeled-icon bg-black bg-opacity-20">
													<i class="ph-map-pin ph-sm"></i>
												</span>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Rounded solid button</h6>
										<p class="mb-3">Use <code>.btn-[color].btn-[sm|lg]</code> and <code>.rounded-pill</code> classes to control rounded solid button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-primary btn-lg rounded-pill">
												<i class="ph-at ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-danger rounded-pill">
												<i class="ph-at me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-success btn-sm rounded-pill">
												<i class="ph-at ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /solid button sizes -->

							<!-- Outline button sizes -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline button sizes</h6>
										<p class="mb-3">Use <code>.btn-outline-[color].btn-[sm|lg]</code> classes to control outline button size. Default button size doesn't require additional class names</p>

										<div class="mb-2">
											<button type="button" class="btn btn-outline-primary btn-lg">
												<i class="ph-chats ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-outline-danger">
												<i class="ph-chats me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-success btn-sm">
												<i class="ph-chats ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline button with label</h6>
										<p class="mb-3">Use <code>.btn-outline-[color].btn-[sm|lg]</code> and <code>.btn-labeled.btn-labeled-[start|end]</code> classes to control labeled outline button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-outline-primary btn-labeled btn-labeled-start btn-lg">
												<span class="btn-labeled-icon bg-primary text-white">
													<i class="ph-map-pin ph-lg"></i>
												</span>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-outline-danger btn-labeled btn-labeled-start">
												<span class="btn-labeled-icon bg-danger text-white">
													<i class="ph-map-pin"></i>
												</span>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-success btn-labeled btn-labeled-start btn-sm">
												<span class="btn-labeled-icon bg-success text-white">
													<i class="ph-map-pin ph-sm"></i>
												</span>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Rounded outline button</h6>
										<p class="mb-3">Use <code>.btn-outline-[color].btn-[sm|lg]</code> and <code>.rounded-pill</code> classes to control rounded outline button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-outline-primary btn-lg rounded-pill">
												<i class="ph-at ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-outline-danger rounded-pill">
												<i class="ph-at me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-success btn-sm rounded-pill">
												<i class="ph-at ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /outline button sizes -->

							<!-- Flat button sizes -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Default button sizes</h6>
										<p class="mb-3">Use <code>.btn-flat-[color].btn-[sm|lg]</code> classes to control flat button size. Default button size doesn't require additional class names</p>

										<div class="mb-2">
											<button type="button" class="btn btn-flat-primary btn-lg">
												<i class="ph-chats ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-flat-danger">
												<i class="ph-chats me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-flat-success btn-sm">
												<i class="ph-chats ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Labeled button sizes</h6>
										<p class="mb-3">Use <code>.btn-flat-[color].btn-[sm|lg]</code> and <code>.btn-labeled.btn-labeled-[start|end]</code> classes to control labeled flat button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-flat-primary btn-labeled btn-labeled-start btn-lg">
												<span class="btn-labeled-icon bg-primary text-white">
													<i class="ph-map-pin ph-lg"></i>
												</span>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-flat-danger btn-labeled btn-labeled-start">
												<span class="btn-labeled-icon bg-danger text-white">
													<i class="ph-map-pin"></i>
												</span>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-flat-success btn-labeled btn-labeled-start btn-sm">
												<span class="btn-labeled-icon bg-success text-white">
													<i class="ph-map-pin ph-sm"></i>
												</span>
												Small button
											</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Outline button sizes</h6>
										<p class="mb-3">Use <code>.btn-flat-[color].btn-[sm|lg]</code> and <code>.rounded-pill</code> classes to control rounded flat button size</p>

										<div class="mb-2">
											<button type="button" class="btn btn-flat-primary btn-lg rounded-pill">
												<i class="ph-at ph-lg me-2"></i>
												Large button
											</button>
										</div>
										<div class="mb-2">
											<button type="button" class="btn btn-flat-danger rounded-pill">
												<i class="ph-at me-2"></i>
												Default button
											</button>
										</div>
										<div>
											<button type="button" class="btn btn-flat-success btn-sm rounded-pill">
												<i class="ph-at ph-sm me-2"></i>
												Small button
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /flat button sizes -->

							<!-- Button colors -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Light button</h6>
										<p class="mb-3">Use <code>.btn-[light|outline-light|flat-light]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-light my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-light my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-light my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Dark button</h6>
										<p class="mb-3">Use <code>.btn-[dark|outline-dark|flat-dark]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-dark my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-dark my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-dark my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Primary button</h6>
										<p class="mb-3">Use <code>.btn-[primary|outline-primary|flat-primary]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-primary my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-primary my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-primary my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Secondary button</h6>
										<p class="mb-3">Use <code>.btn-[secondary|outline-secondary|flat-secondary]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-secondary my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-secondary my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-secondary my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Danger button</h6>
										<p class="mb-3">Use <code>.btn-[danger|outline-danger|flat-danger]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-danger my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-danger my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-danger my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Success button</h6>
										<p class="mb-3">Use <code>.btn-[success|outline-success|flat-success]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-success my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-success my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-success my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Warning button</h6>
										<p class="mb-3">Use <code>.btn-[warning|outline-warning|flat-warning]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-warning my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-warning my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-warning my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Info button</h6>
										<p class="mb-3">Use <code>.btn-[info|outline-info|flat-info]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-info my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-info my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-info my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Indigo button</h6>
										<p class="mb-3">Use <code>.btn-[indigo|outline-indigo|flat-indigo]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-indigo my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-indigo my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-indigo my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Pink button</h6>
										<p class="mb-3">Use <code>.btn-[pink|outline-pink|flat-pink]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-pink my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-pink my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-pink my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Purple button</h6>
										<p class="mb-3">Use <code>.btn-[purple|outline-purple|flat-purple]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-purple my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-purple my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-purple my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Yellow button</h6>
										<p class="mb-3">Use <code>.btn-[yellow|outline-yellow|flat-yellow]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-yellow my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-yellow my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-yellow my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Teal button</h6>
										<p class="mb-3">Use <code>.btn-[teal|outline-teal|flat-teal]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-teal my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-teal my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-teal my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body bg-dark text-white">
										<h6 class="fw-semibold">White button</h6>
										<p class="mb-3">Use <code>.btn-[white|outline-white|flat-white]</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-white my-1 me-2">Button</button>
											<button type="button" class="btn btn-outline-white my-1 me-2">Button</button>
											<button type="button" class="btn btn-flat-white my-1 me-2">Button</button>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Link button</h6>
										<p class="mb-3">Use <code>.btn-link</code> class with the base <code>.btn</code> in any input, anchor or button element</p>

										<div>
											<button type="button" class="btn btn-link my-1 me-2">Button</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /button colors -->

							<!-- Button dropdown types -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Button dropdown</h6>
										<p class="mb-3">Use <code>.dropdown-toggle</code> class to show directional arrow in button dropdown and <code>data-bs-toggle="dropdown"</code> to trigger the menu</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Menu with icon</h6>
										<p class="mb-3">Button with dropdown can be used with text, icons or combination of both. There is no limit in number of icons per button</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
													<i class="ph-gear me-2"></i>
													Dropdown
												</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Segmented button</h6>
										<p class="mb-3">A split button with dropdown. Use additional <code>.dropdown-toggle-split</code> class for proper spacing around the dropdown caret</p>

										<div>
											<div class="btn-group">
												<button type="button" class="btn btn-primary">
													<i class="ph-gear me-2"></i>
													Segmented
												</button>
												<button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown"></button>
												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /button dropdown types -->


							<!-- Additional dropdown alignment -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Button dropup</h6>
										<p class="mb-3">Trigger dropdown menus above elements by adding <code>.dropup</code> to the parent element of dropdown toggler</p>

										<div>
											<div class="btn-group dropup">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Dropup</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Drop right</h6>
										<p class="mb-3">Trigger dropdown menus at the right of the elements by adding <code>.dropend</code> to the parent element of dropdown toggler</p>

										<div>
											<div class="btn-group dropend">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Dropright menu</button>
												<div class="dropdown-menu">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<h6 class="fw-semibold">Drop left</h6>
										<p class="mb-3">Trigger dropdown menus at the left of the elements by adding <code>.dropstart</code> to the parent element of dropdown toggler</p>

										<div>
											<div class="btn-group dropstart">
												<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Dropleft menu</button>
												<div class="dropdown-menu dropdown-menu-end">
													<a href="#" class="dropdown-item">Action</a>
													<a href="#" class="dropdown-item">Another action</a>
													<a href="#" class="dropdown-item">One more action</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item">Separated line</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /additional dropdown alignment -->

							<!-- Button options -->
							<div class="row">
								<div class="col-lg-4">
									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Loading button</h6>
											<p class="text-muted mb-3">Custom loading state</p>

											<button type="button"
												data-initial-text="<i class='ph-spinner me-2'></i> Loading state"
												data-loading-text="<i class='ph-spinner spinner me-2'></i> Loading..."
												class="btn btn-light btn-loading">
												<i class="ph-spinner me-2"></i>
												Loading state
											</button>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Radio button group</h6>
											<p class="text-muted mb-3">Bootstrap <code>radio</code> button group</p>

											<div class="btn-group">
												<input type="radio" class="btn-check" name="options" id="option1"
													autocomplete="off" checked="">
												<label class="btn btn-primary" for="option1">Option 1</label>

												<input type="radio" class="btn-check" name="options" id="option2"
													autocomplete="off">
												<label class="btn btn-primary" for="option2">Option 2</label>

												<input type="radio" class="btn-check" name="options" id="option3"
													autocomplete="off">
												<label class="btn btn-primary" for="option3">Option 3</label>
											</div>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Justified link group</h6>
											<p class="text-muted mb-3">Justified <code>links</code> in button group</p>

											<div class="btn-group btn-group-justified">
												<a href="#" class="btn btn-secondary">Left</a>
												<a href="#" class="btn btn-secondary">Middle</a>
												<a href="#" class="btn btn-secondary">Right</a>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Button group</h6>
											<p class="text-muted mb-3">Group of buttons in <code>btn-group</code></p>

											<div class="btn-group">
												<button type="button" class="btn btn-primary">Left</button>
												<button type="button" class="btn btn-primary">Middle</button>
												<button type="button" class="btn btn-primary">Right</button>
											</div>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Single toggle button</h6>
											<p class="text-muted mb-3">Using <code>data-toggle="button"</code></p>

											<input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
											<label class="btn btn-light" for="btn-check">Single toggle</label>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Button group nesting</h6>
											<p class="text-muted mb-3">Example of nested button groups</p>

											<div class="btn-group">
												<button type="button" class="btn btn-teal">1</button>
												<button type="button" class="btn btn-teal">2</button>

												<div class="btn-group">
													<button type="button" class="btn btn-teal dropdown-toggle"
														data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
													<div class="dropdown-menu" style="">
														<a href="#" class="dropdown-item">Action</a>
														<a href="#" class="dropdown-item">Another action</a>
														<a href="#" class="dropdown-item">One more action</a>
														<div class="dropdown-divider"></div>
														<a href="#" class="dropdown-item">Separated line</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Button toolbar</h6>
											<p class="text-muted mb-3">Complex <code>btn-group</code> components</p>

											<div class="btn-toolbar">
												<div class="btn-group me-2">
													<button type="button" class="btn btn-light">1</button>
													<button type="button" class="btn btn-light">2</button>
													<button type="button" class="btn btn-light">3</button>
												</div>

												<div class="btn-group">
													<button type="button" class="btn btn-light">4</button>
													<button type="button" class="btn btn-light">5</button>
												</div>
											</div>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Checkbox button group</h6>
											<p class="text-muted mb-3">Bootstrap <code>checkbox</code> button group</p>

											<div class="btn-group">
												<input type="checkbox" class="btn-check" id="btn-group-check1"
													autocomplete="off" checked="">
												<label class="btn btn-primary" for="btn-group-check1">Option 1</label>

												<input type="checkbox" class="btn-check" id="btn-group-check2"
													autocomplete="off">
												<label class="btn btn-primary" for="btn-group-check2">Option 2</label>

												<input type="checkbox" class="btn-check" id="btn-group-check3"
													autocomplete="off">
												<label class="btn btn-primary" for="btn-group-check3">Option 3</label>
											</div>
										</div>
									</div>

									<div class="card card-body">
										<div class="">
											<h6 class="m-0 fw-semibold">Justified button group</h6>
											<p class="text-muted mb-3">Justified <code>buttons</code> in button group</p>

											<div class="btn-group d-flex">
												<button type="button" class="btn btn-secondary">Left</button>
												<button type="button" class="btn btn-secondary">Middle</button>
												<button type="button" class="btn btn-secondary">Right</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /button options -->

							
					<!-- Collapsed atate -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Collapsed state</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">The accordion component has two main states: collapsed and expanded. The chevron icon at the end of the accordion indicates which state the accordion is in. The chevron points down to indicate collapsed and up to indicate expanded. Starting in a collapsed state gives the user a high level overview of the available information. Accordions begin by default in the collapsed state with all content panels closed.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="accordion" id="accordion_collapsed">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item1">
											Accordion Item #1
										</button>
									</h2>
									<div id="collapsed_item1" class="accordion-collapse collapse" data-bs-parent="#accordion_collapsed">
										<div class="accordion-body">
											<span class="fw-semibold">This is the first item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item2">
											Accordion Item #2
										</button>
									</h2>
									<div id="collapsed_item2" class="accordion-collapse collapse" data-bs-parent="#accordion_collapsed">
										<div class="accordion-body">
											<span class="fw-semibold">This is the second item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item3">
											Accordion Item #3
										</button>
									</h2>
									<div id="collapsed_item3" class="accordion-collapse collapse" data-bs-parent="#accordion_collapsed">
										<div class="accordion-body">
											<span class="fw-semibold">This is the third item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /collapsed state -->
 

					<!-- Expanded state -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Expanded state</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">You can set one of the accordion items to be expanded by default. To render an accordion that’s expanded, add the <code>.open</code> class on the <code>.accordion</code>. For a consistent visual appearance and correct class name switching, you also need to remove <code>.collapsed</code> class from the active <code>.accordion-button</code> element. Note that only 1 accordion item can be expanded.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="accordion" id="accordion_expanded">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#expanded_item1">
											Accordion Item #1
										</button>
									</h2>
									<div id="expanded_item1" class="accordion-collapse collapse show" data-bs-parent="#accordion_expanded">
										<div class="accordion-body">
											<span class="fw-semibold">This is the first item's accordion body.</span> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#expanded_item2">
											Accordion Item #2
										</button>
									</h2>
									<div id="expanded_item2" class="accordion-collapse collapse" data-bs-parent="#accordion_expanded">
										<div class="accordion-body">
											<span class="fw-semibold">This is the second item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#expanded_item3">
											Accordion Item #3
										</button>
									</h2>
									<div id="expanded_item3" class="accordion-collapse collapse" data-bs-parent="#accordion_expanded">
										<div class="accordion-body">
											<span class="fw-semibold">This is the third item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /expanded state -->


					<!-- Always open -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Always open</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">Accordion component can be configured in a way that allows users independently expand each section of the accordion allowing for multiple sections to be open at once. To convert accordion to a list of collapsible elements, omit the <code>data-bs-parent</code> attribute on each <code>.accordion-collapse</code> to make accordion items stay open when another item is opened.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="accordion" id="accordion_collapsed">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#always_open1">
											Accordion Item #1
										</button>
									</h2>
									<div id="always_open1" class="accordion-collapse collapse show">
										<div class="accordion-body">
											<span class="fw-semibold">This is the first item's accordion body.</span> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#always_open2">
											Accordion Item #2
										</button>
									</h2>
									<div id="always_open2" class="accordion-collapse collapse show">
										<div class="accordion-body">
											<span class="fw-semibold">This is the second item's accordion body.</span> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#always_open3">
											Accordion Item #3
										</button>
									</h2>
									<div id="always_open3" class="accordion-collapse collapse show">
										<div class="accordion-body">
											<span class="fw-semibold">This is the third item's accordion body.</span> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /always open -->


					<!-- Flush -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Accordion as child component</h5>
						</div>

						<div class="card-body border-bottom">
							The accordion component can be used as a stand alone container with its own styles properties (e.g. border, background color etc) or within another component like card. In certain use cases you would want to remove default styling and display accordion as sub-component. Add <code>.accordion-flush</code> to remove the default <code>background-color</code>, some borders, and some rounded corners to render accordions edge-to-edge with their parent container.
						</div>

						<div class="accordion accordion-flush" id="accordion_flush">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#flush_item1">
										Accordion Item #1
									</button>
								</h2>
								<div id="flush_item1" class="accordion-collapse collapse show" data-bs-parent="#accordion_flush">
									<div class="accordion-body">
										<span class="fw-semibold">This is the first item's accordion body.</span> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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
										<span class="fw-semibold">This is the second item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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
										<span class="fw-semibold">This is the third item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /flush -->


						</div>
					</div>
				</div>
				<!-- /content area -->

				<!-- Page header -->
				<div class="page-header page-header-light shadow">
					<div class="page-header-content d-lg-flex">
						<div class="d-flex">
							<h4 class="page-title mb-0">
								Components - <span class="fw-normal">Collapsible</span>
							</h4>

							<a href="#page_header" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
								<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
							</a>
						</div>

						<div class="collapse d-lg-block my-lg-auto ms-lg-auto" id="page_header">
							<div class="d-sm-flex align-items-center mb-3 mb-lg-0 ms-lg-3">
								<div class="dropdown w-100 w-sm-auto">
									<a href="#" class="d-flex align-items-center text-body lh-1 dropdown-toggle py-sm-2" data-bs-toggle="dropdown" data-bs-display="static">
										<img src="../../../assets/images/brands/tesla.svg" class="w-32px h-32px me-2" alt="">
										<div class="me-auto me-lg-1">
											<div class="fs-sm text-muted mb-1">Customer</div>
											<div class="fw-semibold">Tesla Motors Inc</div>
										</div>
									</a>

									<div class="dropdown-menu dropdown-menu-lg-end w-100 w-lg-auto wmin-300 wmin-sm-350 pt-0">
										<div class="d-flex align-items-center p-3">
											<h6 class="fw-semibold mb-0">Customers</h6>
											<a href="#" class="ms-auto">
												View all
												<i class="ph-arrow-circle-right ms-1"></i>
											</a>
										</div>
										<a href="#" class="dropdown-item active py-2">
											<img src="../../../assets/images/brands/tesla.svg" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Tesla Motors Inc</div>
												<div class="fs-sm text-muted">42 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="../../../assets/images/brands/debijenkorf.svg" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">De Bijenkorf</div>
												<div class="fs-sm text-muted">49 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="../../../assets/images/brands/klm.svg" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Royal Dutch Airlines</div>
												<div class="fs-sm text-muted">18 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="../../../assets/images/brands/shell.svg" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">Royal Dutch Shell</div>
												<div class="fs-sm text-muted">54 users</div>
											</div>
										</a>
										<a href="#" class="dropdown-item py-2">
											<img src="../../../assets/images/brands/bp.svg" class="w-32px h-32px me-2" alt="">
											<div>
												<div class="fw-semibold">BP plc</div>
												<div class="fs-sm text-muted">23 users</div>
											</div>
										</a>
									</div>
								</div>

								<div class="vr d-none d-sm-block flex-shrink-0 my-2 mx-3"></div>

								<div class="d-inline-flex mt-3 mt-sm-0">
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
									<a href="#" class="btn btn-outline-primary btn-icon w-32px h-32px rounded-pill ms-3">
										<i class="ph-plus"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="page-header-content d-lg-flex border-top">
						<div class="d-flex">
							<div class="breadcrumb py-2">
								<a href="index.html" class="breadcrumb-item"><i class="ph-house"></i></a>
								<a href="#" class="breadcrumb-item">Components</a>
								<span class="breadcrumb-item active">Collapsible</span>
							</div>

							<a href="#breadcrumb_elements" class="btn btn-light align-self-center collapsed d-lg-none border-transparent rounded-pill p-0 ms-auto" data-bs-toggle="collapse">
								<i class="ph-caret-down collapsible-indicator ph-sm m-1"></i>
							</a>
						</div>

						<div class="collapse d-lg-block ms-lg-auto" id="breadcrumb_elements">
							<div class="d-lg-flex mb-2 mb-lg-0">
								<a href="#" class="d-flex align-items-center text-body py-2">
									<i class="ph-lifebuoy me-2"></i>
									Support
								</a>

								<div class="dropdown ms-lg-3">
									<a href="#" class="d-flex align-items-center text-body dropdown-toggle py-2" data-bs-toggle="dropdown">
										<i class="ph-gear me-2"></i>
										<span class="flex-1">Settings</span>
									</a>

									<div class="dropdown-menu dropdown-menu-end w-100 w-lg-auto">
										<a href="#" class="dropdown-item">
											<i class="ph-shield-warning me-2"></i>
											Account security
										</a>
										<a href="#" class="dropdown-item">
											<i class="ph-chart-bar me-2"></i>
											Analytics
										</a>
										<a href="#" class="dropdown-item">
											<i class="ph-lock-key me-2"></i>
											Privacy
										</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">
											<i class="ph-gear me-2"></i>
											All settings
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">

					<!-- Collapsible options -->
					<div class="mb-3">
						<h6 class="mb-0">
							Collapsible options
						</h6>
						<span class="text-muted d-block">Examples of elements and states</span>
					</div>

					<div class="row">
						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Inline or block element</h6>
								<p class="mb-3">In this example, collapsible JS plugin is attached to inline <code>&lt;span></code> element instead of button or link</p>

								<span class="fw-semibold cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapse-text">
									Toggle content
								</span>

								<div class="collapse" id="collapse-text">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Text links</h6>
								<p class="mb-3">Inline links with <code>href</code> attribute also can toggle the visibility of content, where href is an ID of collapsible container</p>

								<a href="#collapse-link" class="fw-semibold" data-bs-toggle="collapse">
									Toggle content
								</a>

								<div class="collapse" id="collapse-link">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Single or multiple icons</h6>
								<p class="mb-3">Content in block or inline elements can contain text, image, SVG, or icon. Here text link contains icon only</p>

								<a href="#collapse-icon" class="text-body" data-bs-toggle="collapse">
									<i class="ph-arrow-circle-down"></i>
								</a>

								<div class="collapse" id="collapse-icon">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Link with href</h6>
								<p class="mb-3">While not recommended from a semantic point of view, you can also use a link with the <code>href</code> attribute</p>

								<div>
									<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapse-link-collapsed">
										Toggle content
									</a>
								</div>

								<div class="collapse" id="collapse-link-collapsed">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Button with data attribute</h6>
								<p class="mb-3">We recommend using a button with the <code>data-bs-target</code> attribute, use of <code>data-bs-toggle="collapse"</code> is required</p>

								<div>
									<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapse-button-collapsed">
										Toggle content
									</button>
								</div>

								<div class="collapse" id="collapse-button-collapsed">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Input with data attribute</h6>
								<p class="mb-3">You can also use collapsible attached to <code>input type="button"</code>, although this tag is generally not recommended</p>

								<div>
									<input type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapse-input-collapsed" value="Toggle content">
								</div>

								<div class="collapse" id="collapse-input-collapsed">
									<div class="mt-3">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Open by default</h6>
								<p class="mb-3">Collapsible content can be expanded by default. Use <code>.show</code> in <code>.collapse</code> element to expand content</p>

								<div>
									<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapse-link-expanded">
										Toggle content
									</a>
								</div>

								<div class="collapse show" id="collapse-link-expanded">
									<div class="border rounded p-3 mt-3">
										Content
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Collapsible width</h6>
								<p class="mb-3">Add the <code>.collapse-horizontal</code> modifier class to <code>.collapse</code>and set a <code>width</code> on the immediate child element</p>

								<div>
									<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapse-button-expanded">
										Toggle content
									</button>
								</div>

								<div class="collapse collapse-horizontal show" id="collapse-button-expanded">
									<div class="border rounded p-3 mt-3 mb-0" style="width: 250px;">
										Content
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="card card-body">
								<h6 class="fw-semibold">Input with data attribute</h6>
								<p class="mb-2">A <code>button</code> or <code>a</code> can show and hide multiple elements by referencing them with a selector in its <code>href</code> or <code>data-bs-target</code> attribute</p>

								<div>
									<div class="btn-group btn-group-spaced">
										<button type="button" class="btn btn-primary mt-2" data-bs-toggle="collapse" data-bs-target="#multi-collapse-content1">
											First
										</button>
										<button type="button" class="btn btn-primary mt-2" data-bs-toggle="collapse" data-bs-target="#multi-collapse-content2">
											Second
										</button>
										<button type="button" class="btn btn-primary mt-2" data-bs-toggle="collapse" data-bs-target=".multi-collapse">
											All
										</button>
									</div>
								</div>

								<div class="row">
									<div class="col">
										<div class="collapse multi-collapse show" id="multi-collapse-content1">
											<div class="border rounded p-3 mt-3">
												First column
											</div>
										</div>
									</div>

									<div class="col">
										<div class="collapse multi-collapse show" id="multi-collapse-content2">
											<div class="border rounded p-3 mt-3">
												Second column
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /collapsible options -->


					<!-- Accordion markup -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Accordion markup</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">Collapsible content sections can be attached to any markup, in this example it's using markup from our Accordion component. The accordion component has two main states: collapsed and expanded. The chevron icon at the end of the accordion indicates which state the accordion is in. The chevron points down to indicate collapsed and up to indicate expanded.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="accordion">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item1">
											Collapsible Item #1
										</button>
									</h2>
									<div id="collapsed_item1" class="accordion-collapse collapse show">
										<div class="accordion-body">
											<span class="fw-semibold">This is the first item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item2">
											Collapsible Item #2
										</button>
									</h2>
									<div id="collapsed_item2" class="accordion-collapse collapse">
										<div class="accordion-body">
											<span class="fw-semibold">This is the second item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-semibold collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsed_item3">
											Collapsible Item #3
										</button>
									</h2>
									<div id="collapsed_item3" class="accordion-collapse collapse">
										<div class="accordion-body">
											<span class="fw-semibold">This is the third item's accordion body.</span> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /accordion markup -->
 

					<!-- Cards -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Cards</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">Content cards can be collapsible as well, and you can control what toggler triggers it: all elements in card header, card title text, icon or a specific element. Be sure to place the toggler outside <code>&lt;div class="collapse"></code> container. In the following example card title is a regular anchor element with <code>.text-body</code> class that is highlighted with different color in active state.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="card border shadow-none">
								<div class="card-header border-bottom-0">
									<h6 class="mb-0">
										<a data-bs-toggle="collapse" class="text-body" href="#collapsible-card1">Collapsible card #1</a>
									</h6>
								</div>

								<div id="collapsible-card1" class="collapse border-top show">
									<div class="card-body">
										Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
									</div>
								</div>
							</div>

							<div class="card border shadow-none">
								<div class="card-header border-bottom-0">
									<h6 class="mb-0">
										<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-card2">Collapsible card #2</a>
									</h6>
								</div>

								<div id="collapsible-card2" class="collapse border-top">
									<div class="card-body">
										Тon cupidatat skateboard dolor brunch. Тesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda.
									</div>
								</div>
							</div>

							<div class="card border shadow-none">
								<div class="card-header border-bottom-0">
									<h6 class="mb-0">
										<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-card3">Collapsible card #3</a>
									</h6>
								</div>

								<div id="collapsible-card3" class="collapse border-top">
									<div class="card-body">
										3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /cards -->


					<!-- Card group -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Card group</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">Card group is a list of cards that are displayed seamlessly as 1 component. All cards in this layout require a wrapper container with <code>.card-group-vertical</code> class, which cleans up all spacings and borders in children cards. Height collapse in horizontal card group is also supported. Toggler options are similar to previous example.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="card-group-vertical">
								<div class="card border shadow-none">
									<div class="card-header">
										<h6 class="mb-0">
											<a data-bs-toggle="collapse" class="text-body" href="#collapsible-card-group1">Collapsible card #1</a>
										</h6>
									</div>

									<div id="collapsible-card-group1" class="collapse show">
										<div class="card-body">
											Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
										</div>
									</div>
								</div>

								<div class="card border shadow-none">
									<div class="card-header">
										<h6 class="mb-0">
											<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-card-group2">Collapsible card #2</a>
										</h6>
									</div>

									<div id="collapsible-card-group2" class="collapse">
										<div class="card-body">
											Тon cupidatat skateboard dolor brunch. Тesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda.
										</div>
									</div>
								</div>

								<div class="card border shadow-none">
									<div class="card-header">
										<h6 class="mb-0">
											<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-card-group3">Collapsible card #3</a>
										</h6>
									</div>

									<div id="collapsible-card-group3" class="collapse">
										<div class="card-body">
											3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /card group -->


					<!-- Toggle indicator -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Toggle indicator</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">You can also add a visual indication of current collapsible state. The icon is not hardcoded, which means you can use any icon from the default pack, just make sure you add <code>.collapsible-indicator</code> class to icon element. This class looks for <code>.collapsed</code> class in parent container and rotates the icon depending on the state. Icon indicator can aligned to the left and right.</p>

							<div class="row">
								<div class="col-md-6">
									<div class="fw-bold border-bottom pb-2 mb-3">Left indicator example</div>

									<div class="card-group-vertical">
										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a data-bs-toggle="collapse" class="d-flex align-items-center text-body" href="#collapsible-card-indicator-left1">
														<i class="ph-caret-down collapsible-indicator me-2"></i>
														Collapsible card #1
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-left1" class="collapse show">
												<div class="card-body">
													Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
												</div>
											</div>
										</div>

										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a class="collapsed d-flex align-items-center text-body" data-bs-toggle="collapse" href="#collapsible-card-indicator-left2">
														<i class="ph-caret-down collapsible-indicator me-2"></i>
														Collapsible card #2
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-left2" class="collapse">
												<div class="card-body">
													Тon cupidatat skateboard dolor brunch. Тesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda.
												</div>
											</div>
										</div>

										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a class="collapsed d-flex align-items-center text-body" data-bs-toggle="collapse" href="#collapsible-card-indicator-left3">
														<i class="ph-caret-down collapsible-indicator me-2"></i>
														Collapsible card #3
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-left3" class="collapse">
												<div class="card-body">
													3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it.
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="fw-bold border-bottom pb-2 mb-3">Right indicator example</div>

									<div class="card-group-vertical">
										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a data-bs-toggle="collapse" class="d-flex align-items-center text-body" href="#collapsible-card-indicator-right1">
														Collapsible card #1
														<i class="ph-caret-down collapsible-indicator ms-auto"></i>
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-right1" class="collapse show">
												<div class="card-body">
													Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
												</div>
											</div>
										</div>

										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a class="collapsed d-flex align-items-center text-body" data-bs-toggle="collapse" href="#collapsible-card-indicator-right2">
														Collapsible card #2
														<i class="ph-caret-down collapsible-indicator ms-auto"></i>
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-right2" class="collapse">
												<div class="card-body">
													Тon cupidatat skateboard dolor brunch. Тesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda.
												</div>
											</div>
										</div>

										<div class="card border shadow-none">
											<div class="card-header">
												<h6 class="mb-0">
													<a class="collapsed d-flex align-items-center text-body" data-bs-toggle="collapse" href="#collapsible-card-indicator-right3">
														Collapsible card #3
														<i class="ph-caret-down collapsible-indicator ms-auto"></i>
													</a>
												</h6>
											</div>

											<div id="collapsible-card-indicator-right3" class="collapse">
												<div class="card-body">
													3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it.
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /toggle indicator -->


					<!-- Nested elements -->
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Nested elements</h5>
						</div>

						<div class="card-body">
							<p class="mb-3">All collapsible elements work independently, if ID's in toggle button and collapsible containers match. This allows you to have as many nested collapsible elements as we need. In this example we have a set of collapsible cards, each of them has another set of collapsible elements. All options from the examples above are fully supported.</p>

							<div class="fw-bold border-bottom pb-2 mb-3">Example</div>

							<div class="card border shadow-none">
								<div class="card-header">
									<h6 class="mb-0">
										<a data-bs-toggle="collapse" class="text-body" href="#collapsible-parent-card1">Collapsible card #1</a>
									</h6>
								</div>

								<div id="collapsible-parent-card1" class="collapse show">
									<div class="card-body">
										<p class="mb-3">Here goes some text content and a set of collapsible elements in the card #1</p>

										<div class="card-group-vertical">
											<div class="card border shadow-none">
												<div class="card-header">
													<a class="text-body" data-bs-toggle="collapse" href="#collapsible-child1-card1">Nested card #1</a>
												</div>

												<div id="collapsible-child1-card1" class="collapse show">
													<div class="card-body">
														Card content #1
													</div>
												</div>
											</div>

											<div class="card border shadow-none">
												<div class="card-header">
													<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-child1-card2">Nested card #2</a>
												</div>

												<div id="collapsible-child1-card2" class="collapse">
													<div class="card-body">
														Card content #2
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card border shadow-none">
								<div class="card-header">
									<h6 class="mb-0">
										<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-parent-card2">Collapsible card #2</a>
									</h6>
								</div>

								<div id="collapsible-parent-card2" class="collapse">
									<div class="card-body">
										<p class="mb-3">Here goes some text content and a set of collapsible elements in the card #2</p>

										<div class="card-group-vertical">
											<div class="card border shadow-none">
												<div class="card-header">
													<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-child2-card1">Nested card #1</a>
												</div>

												<div id="collapsible-child2-card1" class="collapse">
													<div class="card-body">
														Card content #1
													</div>
												</div>
											</div>

											<div class="card border shadow-none">
												<div class="card-header">
													<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-child2-card2">Nested card #2</a>
												</div>

												<div id="collapsible-child2-card2" class="collapse">
													<div class="card-body">
														Card content #2
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card border shadow-none">
								<div class="card-header">
									<h6 class="mb-0">
										<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-parent-card3">Collapsible card #3</a>
									</h6>
								</div>

								<div id="collapsible-parent-card3" class="collapse">
									<div class="card-body">
										<p class="mb-3">Here goes some text content and a set of collapsible elements in the card #3</p>

										<div class="card-group-vertical">
											<div class="card border shadow-none">
												<div class="card-header">
													<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-child3-card1">Nested card #1</a>
												</div>

												<div id="collapsible-child3-card1" class="collapse">
													<div class="card-body">
														Card content #1
													</div>
												</div>
											</div>

											<div class="card border shadow-none">
												<div class="card-header">
													<a class="collapsed text-body" data-bs-toggle="collapse" href="#collapsible-child3-card2">Nested card #2</a>
												</div>

												<div id="collapsible-child3-card2" class="collapse">
													<div class="card-body">
														Card content #2
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /nested elements -->

				</div>
				<!-- /content area -->
			

</asp:Content>

