<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="examquestion.aspx.cs" Inherits="Online_Examination_System.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
        <div class="col-md-12">
        <div class="card">
             <div class=" container">
                <a class="btn btn-primary mt-1" href="exam.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
            
            <div class="btn-group mt-1">
                <asp:Button ID="btn_panelexamquestion" runat="server" Text="Exam Question" CssClass="btn btn-primary rounded-3 " BorderStyle="None" CausesValidation="False" />
            </div>
        </div>
        <div class="card text-center mb-3">
            <div class="card-body">
              
                <div class="table-responsive">
                    <asp:GridView ID="gridview_examquestion" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gridview_examquestion_PageIndexChanging" OnRowCommand="gridview_examquestion_RowCommand" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="Exam Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("exam_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("question_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Options">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btn_detailsexam" runat="server" CssClass="btn btn-info" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "detailsexamquestion.aspx?eid=" + Eval("exam_id") %>'>
                                           <i class="bi bi-info-circle" aria-hidden="true"></i> Details
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="btn_editexam" runat="server" CssClass="btn btn-primary" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "editquestion.aspx?qid=" + Eval("question_id") %>'>
                                           <i class="bi bi-pencil-square" aria-hidden="true"></i> Edit
                                    </asp:HyperLink>
                                    <asp:LinkButton ID="btn_deleteexam" runat="server" CssClass="btn btn-danger" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("question_id") %>' CommandName="deleteexamquestion">
                                           <i class="bi bi-trash" aria-hidden="true"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            There is no question. Add question
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="card-footer" HorizontalAlign="Center" Font-Bold="true" />
                    </asp:GridView>
                </div>
                <asp:Panel ID="panel_examquestion_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_examquestionwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
