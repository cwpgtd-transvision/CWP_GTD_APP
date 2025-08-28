<%@ Control Language="C#" ClassName="Add_menu" %>

<script runat="server">

</script>
 <asp:HiddenField runat="server" ID="MenuHidenId" />
<div class="tab-pane fade show active" id="js-tab1">
    <div class="card card-custom">
        <div class="card-header card-hearder-custom d-flex align-items-center py-0">
            <h6 class="mb-0">Add Menu</h6>
            <div class="ms-auto my-auto">
                <button type="button" id="btnadd" class="btn btn-light">+ Add</button>
                <button type="button" id="btnback" style="display: none" class="btn btn-light">Back</button>
            </div>
        </div>
        <div class="card-body" id="divadd" style="display: none">
            <div class="row">
                <div class="col-md-3 mb-3">
                    <label class="form-label">Menu Name<span class="text-danger">*</span> :</label>
                    <input type="text" id="txtmenuname" class="form-control" placeholder="Enter The Menu Name">
                </div>
                <div class="col-md-3 mb-3">
                    <label class="form-label">Menu Type<span class="text-danger">*</span> :</label>
                    <select class="form-select" id="ddlMenutype">
                        <option value="0" selected="selected">Select Menu Type</option>
                        <option value="1" data-text="Direct Link">Direct Link</option>
                        <option value="2" data-text="Menu with DropDownList">Menu with DropDownList</option>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label class="form-label ">URL<span class="text-danger">*</span> :</label>
                    <input type="text" id="txtUrl" class="form-control" placeholder="Enter URL">
                </div>

                <div class="col-md-3 mb-3">
                    <label class="form-label">Class<span class="text-danger">*</span> :</label>
                    <input type="text" id="txtClass" class="form-control" placeholder="Enter Class">
                </div>
                <div class="col-md-3 mb-3">
                    <label class="form-label">Style :</label>
                    <input type="text" id="txtStyle" class="form-control" placeholder="Enter the Style">
                </div>

                <div class="col-md-3 d-flex  justify-content-start mb-3">
                    <div id="rdlStatus">
                        <label class="form-label d-block">Status<span class="text-danger">*</span> :</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="dr_li" id="dr_li_c" checked value="Active">
                            <label class="form-check-label" for="dr_li_c">Active</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="dr_li" id="dr_li_u" value="Inactive">
                            <label class="form-check-label" for="dr_li_u">Inactive</label>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 mb-3">
                    <label class="form-label">Menu Order<span class="text-danger">*</span> :</label>
                    <div class="input-group">
                        <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                            <i class="ph-minus ph-sm"></i>
                        </button>
                        <input class="form-control form-control-number text-center" type="number" id="txtMenuorder" name="number" min="1">
                        <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                            <i class="ph-plus ph-sm"></i>
                        </button>
                    </div>
                </div>

                <div class="col-md-3 mb-3">
                    <label class="form-label">Remarks :</label>
                    <textarea class="form-control" id="txtremarks" placeholder="Enter remarks" rows="3"></textarea>
                </div>
            </div>

            <div class="row mb-3">
                <div class="text-end">
                    <button type="button" id="btnSave" class="btn btn-primary my-1 me-2">Save</button>
                    <button type="button" id="btnUpdate" class="btn btn-success my-1 me-2" style="display: none">Update</button>
                    <button type="button" id="btnLogview" class="btn btn-dark my-1 me-2">LogView</button>
                </div>
            </div>
        </div>
        <div class="card-body " id="divrow">
            <div id="bindata">
                <table id="MenuTable" class="table datatable-button-init-basic table-striped table-bordered">
                    <thead>
                        <tr id="tableHeadRow"></tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="modal_scrollable" tabindex="-1" role="dialog" aria-labelledby="logModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog modal-xl" role="document">
                <div class="modal-content">

                    <div class="modal-header bg-primary text-white border-0">
                        <h5 class="modal-title" id="logModalLabel">Menu Log View</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="text-end">
                            <div id="customSearchContainer" style="margin-bottom: 10px;"></div>
                        </div>
                        <div class="divtable row">
                            <table id="Menu_LogTable" class="table table-striped table-bordered">
                                <thead>
                                    <tr id="tableHeadRow_Log"></tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="mt-2"></div>
                        <button type="button" class="btn btn-secondary close" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





