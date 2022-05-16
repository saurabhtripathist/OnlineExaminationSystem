<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="resetpass.aspx.cs" Inherits="Online_Examination_System.WebForm23" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
     <div class="col-md-12">
            <div class="card mx-auto mt-2">
            <div class="card-header bg-primary text-white m-2 p-3 rounded-2">
                Reset Password
            </div>
                <div class=" container">
                <a class="btn btn-primary mt-0" href="adminindex.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                </a>
            </div>
            
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Current Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_admipresentpass" runat="server" CssClass="form-control"  placeholder="Enter Current Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_admipresentpass" runat="server" ErrorMessage="Enter Password" ControlToValidate="txt_admipresentpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">New Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminnewpass" runat="server" CssClass="form-control"  placeholder="Enter New Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminnewpass" runat="server" ErrorMessage="Enter new password" ControlToValidate="txt_adminnewpass" ForeColor="red" Display="Dynamic" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Re-enter New password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminnewpassrpeat" runat="server" CssClass="form-control" placeholder="Re-enter New Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminpassrepeat" runat="server" ErrorMessage="Re-enter new password" ControlToValidate="txt_adminnewpassrpeat" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="reqcompre_adminpassrepeat" runat="server" ErrorMessage="Password do no match." ControlToValidate="txt_adminnewpassrpeat" ControlToCompare="txt_adminnewpass" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="col-md-2">
                        <asp:Button ID="btn_resetpass" runat="server" Text="Reset Password" CssClass="btn bg-danger"  BorderStyle="None" ForeColor="White" OnClick="btn_resetpass_Click" />
                    </div>
                    <asp:Panel ID="panel_resetpass_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_resetpasswarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
