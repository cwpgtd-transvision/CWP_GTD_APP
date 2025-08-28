 <div class="card card-custom">
     <div class="card-header card-hearder-custom d-flex align-items-center py-0">
         <h6 class="mb-0">Add Deep Nested Sub Menu</h6>
         <div class="ms-auto my-auto py-sm-1">
             <button type="button" id="btnDeepOrder" class="btn btn-light">Re-Order</button>
             <button type="button" id="btnadd3" class="btn btn-light">+ Add</button>
             <button type="button" id="btnback3" style="display: none" class="btn btn-light">Back</button>
         </div>
     </div>
     <div class="card-body" id="divadd3" style="display: none">
         <div class="row">
             <div class="col-md-3 mb-3">
                 <label class="form-label">Nested Sub Menu<span class="text-danger">*</span> :</label>
                 <select class="form-select" id="ddlNestedSubMenu">
                     <option value="0" selected="selected">Select Nested Sub Menu</option>
                 </select>
             </div>
             <div class="col-md-3 mb-3">
                 <label class="form-label">Deep Nested Submenu Name<span class="text-danger">*</span> :</label>
                 <input type="text" id="txtdeepnestedsubmenuname" class="form-control" placeholder="Enter The Deep Nested Sub Menu Name">
             </div>
             <div class="col-md-3 mb-3">
                 <label class="form-label ">Deep Nested Sub URL<span class="text-danger">*</span> :</label>
                 <input type="text" id="txtDeepnestedSubUrl" class="form-control" placeholder="Enter URL">
             </div>

             <div class="col-md-3 mb-3">
                 <label class="form-label">Deep Nested Sub Menu Class<span class="text-danger">*</span> :</label>
                 <input type="text" id="txtDeepNestedSubClass" class="form-control" placeholder="Enter Class">
             </div>
             <div class="col-md-3 mb-3">
                 <label class="form-label">Deep Nested Sub Menu Style :</label>
                 <input type="text" id="txtDeepNestedSubStyle" class="form-control" placeholder="Enter the Style">
             </div>
             <div class="col-md-3 mb-3" style="display: none;">
                 <label class="form-label">Deep Nested Sub Menu Order<span class="text-danger">*</span> :</label>
                 <div class="input-group">
                     <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                         <i class="ph-minus ph-sm"></i>
                     </button>
                     <input class="form-control form-control-number text-center" type="number" id="txtDeepNestedSubMenuorder" name="number" min="1">
                     <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                         <i class="ph-plus ph-sm"></i>
                     </button>
                 </div>
             </div>

             <div class="col-md-3 mb-3">
                 <div id="rdlDeepNestedSubStatus">
                     <label class="form-label d-block">Status<span class="text-danger">*</span> :</label>
                     <div class="form-check form-check-inline mt-2 mb-2">
                         <input class="form-check-input" type="radio" name="dr_li3" id="dr_li_c3" checked value="Active">
                         <label class="form-check-label" for="dr_li_c">Active</label>
                     </div>
                     <div class="form-check form-check-inline mt-2 mb-2">
                         <input class="form-check-input" type="radio" name="dr_li3" id="dr_li_u3" value="Inactive">
                         <label class="form-check-label" for="dr_li_u">Inactive</label>
                     </div>
                 </div>
             </div>

             <div class="col-md-3 mb-3">
                 <label class="form-label">Deep Nested Sub Menu Remarks :</label>
                 <textarea class="form-control" id="txtDeepNestedSubremarks" placeholder="Enter remarks" rows="3"></textarea>
             </div>
         </div>
         <div class="row mb-3">
             <div class="text-end">
                 <button type="button" id="btnDeepNestedSubMenuSave" class="btn btn-primary my-1 me-2">Save</button>
                 <button type="button" id="btnDeepNestedSubMenuUpdate" class="btn btn-primary my-1 me-2" style="display: none">Update</button>
                 <button type="button" id="btnDeepNestedSubMenuLogview" class="btn btn-dark my-1 me-2">LogView</button>
                 <button id="btnclear3" class="btn btn-secondary" type="button">Clear</button>
             </div>
         </div>
     </div>
     <div class="card-body " id="divrow3">
         <div id="bindata3">
             <table id="DeepNestedSubMenuTable" class="table datatable-button-init-basic table-striped table-bordered">
                 <thead>
                     <tr id="tableHeadRow3"></tr>
                 </thead>
                 <tbody></tbody>
             </table>
         </div>
     </div>
     <div class="modal fade" id="modal_scrollable3" tabindex="-1" role="dialog" aria-labelledby="logModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-scrollable modal-dialog modal-xl" role="document">
             <div class="modal-content">

                 <div class="modal-header">
                     <h5 class="modal-title" id="logModalLabel3">Deep Nested Sub Menu Log View</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                 </div>
                 <div class="modal-body">
                     <div class="text-end">
                         <div id="customSearchContainer3" class="mb-2"></div>
                     </div>
                     <div class="divtable row">
                         <table id="DeepNested_LogTable" class="table table-striped table-bordered">
                             <thead>
                                 <tr id="tableHeadRow_Log3"></tr>
                             </thead>
                             <tbody></tbody>
                         </table>
                     </div>
                 </div>
                 <div class="modal-footer">
                     <div class="mt-2"></div>
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 </div>
             </div>
         </div>
     </div>
     <div class="modal fade" id="deepSubMenuOrderModal" tabindex="-1" aria-labelledby="deepSubMenuOrderModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-scrollable modal-lg">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="deepSubMenuOrderModalLabel">Reorder Deep Sub Menus</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>
                 <div class="modal-body">
                     <ul class="list-group list-group-borderless media-list-container py-2 dropdown-menu-sortable" style="font-weight: bold; font-size: 16px" id="deepSubMenuOrder">
                     </ul>
                     <div class="modal-footer">
                         <button id="btnSaveDeepSubMenuOrder" type="button" class="btn btn-primary">Save Order</button>
                         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>