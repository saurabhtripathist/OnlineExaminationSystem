<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="Online_Examination_System.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontentplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <div class=" container">
                <a class="btn btn-primary mt-auto" href="index.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
            
     <h2 class="m-4">
            All <asp:Label ID="lbl_categorysubject" runat="server"></asp:Label> Category Subject</h2>
        <hr />
        <div class="row">
                <asp:Repeater ID="gridview_categoryitem" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header bg-primary text-white rounded-3"><%# Eval("subject_name") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btn_category" runat="server" CssClass="btn btn-success btn-sm" ForeColor="White" NavigateUrl='<%# "subjectexam.aspx?sid=" +  Eval("subject_id") %>'>Go to exams</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_subjectshow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_subjectshowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
</asp:Content>
