<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="subject.aspx.cs" Inherits="Online_Examination_System.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <div class=" container">
                <a class="btn btn-primary mt-1" href="subject.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
            
            <div class="btn-group mt-1">
                <asp:Button ID="btn_panelsubjectlist" runat="server" Text="Subject List" CssClass="btn btn-success text-white" BorderStyle="None" CausesValidation="False" OnClick="btn_panelsubjectlist_Click" />
                <asp:Button ID="btn_paneladdSubject" runat="server" Text="Add Subject" CssClass="btn btn-primary text-white" BorderStyle="None" CausesValidation="False" OnClick="btn_paneladdSubject_Click" />
            </div>
           
            <asp:Panel ID="panel_addsubject" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <div class="dropdown">
                            <asp:DropDownList ID="drp_category" runat="server" CssClass="form-control bi-caret-down" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="Please select a category" ControlToValidate="drp_category" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                            </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Subject Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_subject" runat="server" ErrorMessage="Enter subject" ControlToValidate="txt_subject" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addsubject" runat="server" Text="Add Subject" CssClass="btn btn rounded-2 bg-primary"  BorderStyle="None" ForeColor="White" OnClick="btn_addsubject_Click" />
                        </div>
                        <asp:Panel ID="panel_addsubject_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_addsubject_warning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
           
            <asp:Panel ID="panel_subjectlist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_subjectlist" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="grdview_subjectlist_RowCommand" AllowPaging="True" OnPageIndexChanging="grdview_subjectlist_PageIndexChanging" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="subject_name" HeaderText="Subject Name" />
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" NullDisplayText="The subject is under no category" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_editsubject" runat="server" CssClass="btn btn-primary" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "editsubject.aspx?sid=" + Eval("subject_id") %>'>
                                            <i class="bi bi-pencil-square" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_deletesubject" runat="server" CssClass="btn btn-danger" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("subject_id") %>' CommandName="DeleteRow">
                                            <i class="bi bi-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no subject added now. Add subject
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>

                        <asp:Panel ID="panel_subjectlist_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_subjectlistwarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
