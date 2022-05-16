<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="Online_Examination_System.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headcontentplaceholder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
     <div class=" container">
                <a class="btn btn-primary mt-auto" href="index.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back to Index
                </a>
            </div>
    <br />
     <div class="card-header bg-primary text-white rounded-3"">
        <h3>Result</h3>
     </div>
    <asp:TextBox ID="getemail" runat="server" Visible ="false"></asp:TextBox>
    <asp:GridView ID="gridmyresult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="gridmyresult_PageIndexChanging" PageSize="8">
        <Columns>
            <asp:BoundField DataField="exam_name" HeaderText="Exam Name" NullDisplayText="no exam name"/>
            <asp:BoundField DataField="exam_date" DataFormatString="{0:M/d/yy}" HeaderText="Exam Date" NullDisplayText="There is some problem to find exam date" />
            <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
            <asp:BoundField DataField="result_status" HeaderText="Result" />
            <asp:BoundField DataField="exam_marks" HeaderText="Total Marks" />
            <asp:BoundField DataField="result_score" HeaderText="Your Score" />
        </Columns>
    </asp:GridView>
        <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_myresultshow_warning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lbl_myresultshowwarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
