<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="editsubject.aspx.cs" Inherits="Online_Examination_System.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
     <div class=" col-md-12">
        <div class="card">
            <div class=" container">
                <a class="btn btn-primary mt-1" href="subject.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>

            <div class="btn-group mt-1">
                <asp:Button ID="btn_panelsubjectlist" runat="server" Text="Edit Subject" CssClass="btn btn-primary rounded-2" BorderStyle="None" CausesValidation="False" />
            </div>
            <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_categoryedit" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_categoryedit" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Subject Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_subjectedit" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_subject" runat="server" ErrorMessage="Enter subject" ControlToValidate="txt_subjectedit" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_editsubject" runat="server" Text="Edit Subject" CssClass="btn btn-success" BorderStyle="None" ForeColor="White" OnClick="btn_editsubject_Click" />
                        </div>
                        <asp:Panel ID="panel_editsubject_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_editsubject_warning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
        </div>
    </div>

</asp:Content>
