<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Handsontable.aspx.cs" Inherits="Handsontable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-inner">
        <div class="page-header">
            <div class="page-header-content d-lg-flex">
                <div class="d-flex">
                    <h4 class="page-title mb-0">Handsontable - <span class="fw-normal">Demo</span></h4>
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
</asp:Content>
