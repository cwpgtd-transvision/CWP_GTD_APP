<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="highCharts.aspx.cs" Inherits="templates_HighChartsExamples_highCharts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Page content -->
    <div class="content-inner custom-ui-highcharts">

        <!-- Page header -->
        <div class="page-header">
            <div class="page-header-content d-lg-flex">
                <div class="d-flex">
                    <h4 class="page-title mb-0">HighCharts - <span class="fw-normal">Graphs</span>
                    </h4>
                </div>
            </div>
        </div>

        <div class="content">

            <!-- Line and Spline charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Line Chart</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="Linecontainer1"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>

                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Spline Charts</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="splinecontainer1"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->

                </div>
            </div>


            <!-- Line and Spline charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Area Comparison Chart</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="areacontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>

                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Percentage Stacked Area Chart</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="areacontainer1"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->

                </div>
            </div>

            <!-- Line and Area charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Line with drag in the chart to zoom in and inspect the data Chart</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="linecontainerZoomInOut"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>

                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Area with drag in the chart to zoom in and inspect the data Chart</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="areacontainerZoomInOut"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->

                </div>
            </div>

            <!-- Bar charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Bar Chart</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="BarGraphcontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>

                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Stacked Bar Chart</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="StackedBarGraphcontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->

                </div>
            </div>

            <!-- Colomn charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Column Chart</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="ColumnGraphcontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>

                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Column Comparision Chart</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="ColumnComparisionGraphcontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->

                </div>
            </div>

            <!-- Colomn charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Column 3d Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="3dcolumncontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Column Comparision 3d Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="3dcolumnComarisioncontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>

            <!-- Colomn Drilldown ANd Lable Rotated charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Column drolldown Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="columndrolldowngraphcontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Column With Rotated Lable Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="ColumnWithRotatedLablescontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>

            <!-- Pie charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Pie Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="PieChartcontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Pie 3D Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="3dPieChartcontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>

            <!-- Pie charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Donut Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="Donutcontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Donut 3D Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="Donut3dcontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>

            <!-- Pie DrillDown charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Donut DrillDown Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="DonutDrillDowncontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Donut 3D DrillDown Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="Donut3DDrillDowncontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>

            <!-- Pie 3d DrillDown and semi donut charts -->
            <div class="row">
                <div class="col-xl-6">
                    <!-- Sales stats -->
                    <div class="card">
                        <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                            <h5 class="py-sm-2 my-sm-1">Pie DrillDown Graph</h5>
                        </div>
                        <div class="card-body pb-0">
                            <div id="PieDrillDowncontainer"></div>
                        </div>
                    </div>
                    <!-- /sales stats -->
                </div>

                <div class="col-xl-6">
                    <!-- Traffic sources -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="mb-0">Semi Donut 3D DrillDown Graph</h5>
                        </div>

                        <div class="card-body pb-0">
                            <div id="SemiDonut3DDrillDowncontainer"></div>
                        </div>

                    </div>
                    <!-- /traffic sources -->
                </div>
            </div>
           <div class="row">
    <div class="col-xl-6">
        <!-- Sales stats -->
        <div class="card">
            <div class="card-header d-sm-flex align-items-sm-center py-sm-0">
                <h5 class="py-sm-2 my-sm-1">Cylinder Graph</h5>
            </div>
            <div class="card-body pb-0">
                <div id="Cylindercontainer"></div>
            </div>
        </div>
        <!-- /sales stats -->
    </div>

    <div class="col-xl-6">
        <!-- Traffic sources -->
        <div class="card">
            <div class="card-header d-flex align-items-center">
                <h5 class="mb-0">Cylinder Comparision Graph</h5>
            </div>

            <div class="card-body pb-0">
                <div id="CylinderComparisioncontainer"></div>
            </div>

        </div>
        <!-- /traffic sources -->
    </div>
</div>
        </div>
    </div>


</asp:Content>

