  <div class="card card-custom">
      <div class="card-header card-hearder-custom d-flex align-items-center py-0">
          <h6 class="mb-0">Add Sub Menu</h6>
          <div class="ms-auto my-auto py-sm-1">
              <button id="btnSubOrder" type="button" class="btn btn-light me-2">Re-Order</button>
              <button type="button" id="btnadd1" class="btn btn-light">+ Add</button>
              <button type="button" id="btnback1" style="display: none" class="btn btn-light">Back</button>
          </div>
      </div>
      <div class="card-body" id="divadd1" style="display: none">
          <div class="row">
              <div class="col-md-3 mb-3">
                  <label class="form-label">Main Menu<span class="text-danger">*</span> :</label>
                  <select class="form-select" id="ddlmainMenu">
                      <option value="0" selected="selected">Select Main Menu</option>
                  </select>
              </div>
              <div class="col-md-3 mb-3">
                  <label class="form-label">Submenu Name<span class="text-danger">*</span> :</label>
                  <input type="text" id="txtsubmenuname" class="form-control" placeholder="Enter The Sub Menu Name">
              </div>
              <div class="col-md-3 mb-3">
                  <label class="form-label">Sub Menu Type<span class="text-danger">*</span> :</label>
                  <select class="form-select" id="ddlSubMenutype">
                      <option value="0" selected="selected">Select Sub Menu Type</option>
                      <option value="1" data-text="Direct Link">Direct Link</option>
                      <option value="2" data-text="Menu with DropDownList">Sub Menu with DropDownList</option>
                  </select>
              </div>
              <div class="col-md-3 mb-3">
                  <label class="form-label ">Sub URL<span class="text-danger">*</span> :</label>
                  <input type="text" id="txtSubUrl" class="form-control" placeholder="Enter URL">
              </div>

              <div class="col-md-3 mb-3">
                  <label class="form-label">Class<span class="text-danger">*</span> :</label>
                  <input type="text" id="txtSubClass" class="form-control" placeholder="Enter Class">
              </div>
              <div class="col-md-3 mb-3">
                  <label class="form-label">Style :</label>
                  <input type="text" id="txtSubStyle" class="form-control" placeholder="Enter the Style">
              </div>
              <div class="col-md-3 mb-3" style="display: none;">
                  <label class="form-label">Sub Menu Order<span class="text-danger">*</span> :</label>
                  <div class="input-group">
                      <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                          <i class="ph-minus ph-sm"></i>
                      </button>
                      <input class="form-control form-control-number text-center" type="number" id="txtSubMenuorder" name="number" min="1">
                      <button type="button" class="btn btn-light btn-icon" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                          <i class="ph-plus ph-sm"></i>
                      </button>
                  </div>
              </div>

              <div class="col-md-3 d-flex justify-content-start mb-3">
                  <div id="rdlSubStatus">
                      <label class="form-label d-block">Status<span class="text-danger">*</span> :</label>
                      <div class="form-check form-check-inline mt-2">
                          <input class="form-check-input" type="radio" name="dr_li1" id="dr_li_c1" checked value="Active">
                          <label class="form-check-label" for="dr_li_c">Active</label>
                      </div>
                      <div class="form-check form-check-inline mt-2">
                          <input class="form-check-input" type="radio" name="dr_li1" id="dr_li_u1" value="Inactive">
                          <label class="form-check-label" for="dr_li_u">Inactive</label>
                      </div>
                  </div>
              </div>

              <div class="col-md-3 mb-3">
                  <label class="form-label">Remarks :</label>
                  <textarea class="form-control" id="txtSubremarks" placeholder="Enter remarks" rows="3"></textarea>
              </div>
          </div>

          <div class="row">
              <div class="text-end">
                  <button type="button" id="btnSubMenuSave" class="btn btn-primary my-1 me-2">Save</button>
                  <button type="button" id="btnSubMenuUpdate" class="btn btn-primary my-1 me-2" style="display: none">Update</button>
                  <button type="button" id="btnSubMenuLogview" class="btn btn-dark my-1 me-2">LogView</button>
                  <button id="btnclear1" class="btn btn-secondary" type="button">Clear</button>
              </div>
          </div>
      </div>
      <div class="card-body " id="divrow1">
          <div id="bindata1">
              <table id="SubMenuTable" class="table datatable-button-init-basic table-striped table-bordered">
                  <thead>
                      <tr id="tableHeadRow1"></tr>
                  </thead>
                  <tbody></tbody>
              </table>
          </div>
      </div>
      <%--SubMenu Model view--%>
      <div class="modal fade" id="modal_scrollable1" tabindex="-1" role="dialog" aria-labelledby="logModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-dialog modal-xl" role="document">
              <div class="modal-content">

                  <div class="modal-header">
                      <h5 class="modal-title" id="logModalLabel1">Sub Menu Log View</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                      <div class="text-end">
                          <div id="customSearchContainer1" style="margin-bottom: 10px;"></div>
                      </div>
                      <div class="divtable row">
                          <table id="Menu_LogTable1" class="table table-striped table-bordered">
                              <thead>
                                  <tr id="tableHeadRow_Log1"></tr>
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

      <div class="modal fade" id="subMenuOrderModal" tabindex="-1" aria-labelledby="subMenuOrderModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-lg">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="subMenuOrderModalLabel">Reorder Sub Menus</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <ul class="list-group list-group-borderless media-list-container py-2 dropdown-menu-sortable" style="font-weight: bold; font-size: 16px" id="subMenuOrder">
                      </ul>
                      <div class="modal-footer">
                          <button id="btnSaveSubMenuOrder" type="button" class="btn btn-primary">Save Order</button>
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>