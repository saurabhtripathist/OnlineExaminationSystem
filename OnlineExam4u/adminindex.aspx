<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminindex.aspx.cs" Inherits="Online_Examination_System.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-12">
    <div class="text-white bg-primary rounded-3 m-1 text-center col-xl-2 col-sm-4 pb-0">
       <h4>Dashboard</h4>
    </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary h-auto mt-5">
            <div class="card-body">
                <div class="mr-5"> Total <asp:Label ID="lbltotalexam" runat="server"></asp:Label> Exams</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="exam.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="bi bi-chevron-double-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary h-auto mt-5">
            <div class="card-body">
                <div class="mr-5">Total <asp:Label ID="lbltotalquestion" runat="server"></asp:Label> Questions</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="question.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                   <i class="bi bi-chevron-double-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary h-auto mt-5 ">
            <div class="card-body">
                <div class="mr-5">Total <asp:Label ID="lbltotalstudents" runat="server"></asp:Label> Students</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="studentList.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="bi bi-chevron-double-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_index_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_indexwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
