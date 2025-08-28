<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Picker.aspx.cs" Inherits="Picker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container-fluid">
        <div class="card mt-2">
            <div class="card-header card-hearder-custom d-flex align-items-center py-0">
                <h6 class="mb-0 py-2">Pickers</h6>
               

                </div>
                           <div class="card-body">
               <div class="row mb-2">
                    <div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" id="DatePicker" class="form-control datepicker-date-format_default" />
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" id="FutureDatePicker" class="form-control datepicker-date-format_default_Futuredate" />
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" id="PastDatePicker" class="form-control datepicker-date-format_default_Past" />
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Month_Default" id="MonthPicker" placeholder="Pick a Month">
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Month_Default_FutureMonth" id="FutureMonthPicker" placeholder="Pick a Month">
    </div>
</div>

<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Month_Default_PastMonth" id="PastMonthPicker" placeholder="Pick a Month">
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Year_Default" id="YearPicker" placeholder="Pick a Year">
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Year_Default_FutureYear" id="FutureYearPicker" placeholder="Pick a Year">
    </div>
</div>
<div class="col-md-3">
    <div class="input-group">
        <span class="input-group-text">
            <i class="ph-calendar"></i>
        </span>
        <input type="text" class="form-control datepicker-pick-level_Year_Default_PastYear" id="PastYearPicker" placeholder="Pick a Year">
    </div>
</div>

                   </div>
                   </div>
            </div>
            </div>
</asp:Content>

