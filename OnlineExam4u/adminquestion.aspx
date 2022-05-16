﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminquestion.aspx.cs" Inherits="Online_Examination_System.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
           
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelallquestion" runat="server" Text="All Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" OnClick="btn_panelallquestion_Click" />
            </div>
        </div>
        <div class="card text-center mb-3">
            <div class="card-body">
             
                <div class="table-responsive">
                    <asp:GridView ID="gridview_examquestion" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gridview_examquestion_RowCommand" OnPageIndexChanging="gridview_examquestion_PageIndexChanging">
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
                                    <asp:HyperLink ID="btn_detailsexam" runat="server" CssClass="btn"  BorderStyle="None" ForeColor="White" NavigateUrl='<%# "detailsexamquestion.aspx?eid=" + Eval("exam_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="btn_editexam" runat="server" CssClass="btn"  BorderStyle="None" ForeColor="White" NavigateUrl='<%# "editquestion.aspx?qid=" + Eval("question_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                    </asp:HyperLink>
                                    <asp:LinkButton ID="btn_deleteexam" runat="server" CssClass="btn"  BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("exam_id") %>' CommandName="deletequestion">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            There is no question. Add question
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
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