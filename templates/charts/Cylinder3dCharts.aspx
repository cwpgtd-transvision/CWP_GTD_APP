<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cylinder3dCharts.aspx.cs" Inherits="Cylinder3dCharts" %>

<!-- 3d Cylinder charts -->
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