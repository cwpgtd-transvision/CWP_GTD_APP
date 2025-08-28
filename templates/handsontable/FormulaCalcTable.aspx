<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormulaCalcTable.aspx.cs" Inherits="templates_handsontable_FormulaCalcTable" %>


<div class="row">
    <div class="col-6">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Formula Caluctation Table</h5>
                <div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">

                    <h3 class="demo-preview">Datatable</h3>
                    <div id="FormulaCaluctatedDatatable"></div>
                    <h3 class="demo-preview">Formula Sheet</h3>
                    <div id="FormulaCaluctationDatatable"></div>

                </div>
            </div>
        </div>
    </div>

    <div class="col-6">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Save changes using a callback Table</h5>
                <div>
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