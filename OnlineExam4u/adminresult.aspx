<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminresult.aspx.cs" Inherits="Online_Examination_System.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12 mt-2">
        <div class=" container">
                <a class="btn btn-primary mt-auto py-2" href="adminindex.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
        <br />
        <div class="card">
            <div class="btn-group">
                <asp:Button ID="btn_panelresult" runat="server" Text="All result" CssClass="btn btn-primary rounded-2" BorderStyle="None" CausesValidation="False"/>
            </div>
            <div class="card text-center mb-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gridviewspecific" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" Visible="false" OnPageIndexChanging="gridviewspecific_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="User email" />
                                <asp:BoundField DataField="exam_name" HeaderText="Exam Name" NullDisplayText="no exam name" />
                                <asp:BoundField DataField="exam_date" DataFormatString="{0:M/d/yy}" HeaderText="Exam Date" NullDisplayText="No date" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
                                <asp:BoundField DataField="result_status" HeaderText="Result" />
                                <asp:BoundField DataField="exam_marks" HeaderText="Total Marks" />
                                <asp:BoundField DataField="result_score" HeaderText="Your Score" />
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gridresult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gridresult_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="User email" />
                                <asp:BoundField DataField="exam_name" HeaderText="Exam Name" NullDisplayText="no exam name" />
                                <asp:BoundField DataField="exam_date" DataFormatString="{0:M/d/yy}" HeaderText="Exam Date" NullDisplayText="No date" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
                                <asp:BoundField DataField="result_status" HeaderText="Result" />
                                <asp:BoundField DataField="exam_marks" HeaderText="Total Marks" />
                                <asp:BoundField DataField="result_score" HeaderText="Your Score" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="panel_resultshow_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_resultshowwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
