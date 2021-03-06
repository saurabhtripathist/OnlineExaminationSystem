<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="examdetails.aspx.cs" Inherits="Online_Examination_System.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
     <div class="col-md-12">
        <div class="card">
            
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_detailsexam" runat="server" Text="Details Exam" CssClass="btn btn-primary rounded-2" BorderStyle="None" CausesValidation="False" />
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    
                    <div class="table table-responsive">
                        <asp:DetailsView ID="exam_details" runat="server" Height="50px" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="category_name" HeaderText="Category" NullDisplayText="The exam is not under any category">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="subject_name" HeaderText="Subject" NullDisplayText="The exam is not under any subject">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_name" HeaderText="Exam Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_description" HeaderText="Exam Discription" NullDisplayText="No Discription">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_date" HeaderText="Exam Date" DataFormatString="{0:d}">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_duration" HeaderText="Exam Duration">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exampass_marks" HeaderText="Exam Pass Marks">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_marks" HeaderText="Total Marks" NullDisplayText="No total marks">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                            <asp:Button ID="btn_backexam" runat="server" Text="Back To Exam" CssClass="btn btn-success" BorderStyle="None" ForeColor="White" PostBackUrl="exam.aspx"/>
                            </FooterTemplate>
                            <HeaderStyle CssClass="text-center" />
                        </asp:DetailsView>
                        <asp:Panel ID="panel_examdetails_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_examdetailswarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
