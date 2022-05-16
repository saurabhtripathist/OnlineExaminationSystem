<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="studentList.aspx.cs" Inherits="Online_Examination_System.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
   
            <div class="btn-group m-1">
                <asp:Button ID="btn_panelresult" runat="server" Text="All students" CssClass="btn btn-primary text-white rounded-2  " BorderStyle="None" CausesValidation="False" />
            </div>
            <div class=" container">
            <a class="btn btn-primary mt-3 p-auto m-auto py-2" href="adminindex.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
            <br />
            
            <div class="card text-center mb-3 mt-auto">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gridallstudents" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gridallstudents_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_fname" HeaderText="First name" />
                                <asp:BoundField DataField="user_lname" HeaderText="Last name" />
                                <asp:BoundField DataField="user_email" HeaderText="Email" />
                                <asp:TemplateField HeaderText="Result">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="btn_viewquestion" runat="server" CssClass="btn btn-success" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "adminresult.aspx?uid=" + Eval("user_email") %>'>
                                           <i class="bi bi-info-circle" aria-hidden="true"></i> View Result
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="panel_studentlistshow_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_studentlistshowwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
