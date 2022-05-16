<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Online_Examination_System.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headcontentplaceholder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <h3 class="my-1 pb-1">Category</h3>
    <hr />
    <div class="row">
        <asp:Repeater ID="gridview_categorylist" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header bg-primary text-white rounded-1"><%# Eval("category_name") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btn_category" runat="server" CssClass="btn btn-success btn-sm" ForeColor="White" NavigateUrl='<%# "category.aspx?cid=" +  Eval("category_id") %>'>Go to subjects</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_categoryshow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_categoryshowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
