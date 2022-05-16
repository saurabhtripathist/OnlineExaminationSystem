<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="editcategory.aspx.cs" Inherits="Online_Examination_System.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <div class=" container">
                <a class="btn btn-primary mt-1" href="admincategory.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>

            <div class="btn-group mt-1">
                <asp:Button ID="btn_panelcategorylist" runat="server" Text="Edit Category" CssClass="btn btn-primary rounded-2 text-white" BorderStyle="None" CausesValidation="False" />
            </div>
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Category Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_categoryedit" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_category" runat="server" ErrorMessage="Enter category" ControlToValidate="txt_categoryedit" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_editcategory" runat="server" Text="Edit Category" CssClass="btn btn-danger" BorderStyle="None" ForeColor="White" OnClick="btn_editcategory_Click"/>
                        </div>
                        <asp:Panel ID="panel_editcategory_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_categoryeditwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
        </div>
    </div>

</asp:Content>
