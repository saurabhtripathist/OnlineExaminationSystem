<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admincategory.aspx.cs" Inherits="Online_Examination_System.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headcontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <div class=" container">
                <a class="btn btn-primary mt-1" href="adminindex.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                    Back
                </a>
            </div>
           
            <div class="btn-group  m-1">
                <asp:Button ID="btn_panelcategorylist" runat="server" Text="Category List" CssClass="btn btn-success text-white" OnClick="btn_panelcategorylist_Click" BorderStyle="None" CausesValidation="False" />
                <asp:Button ID="btn_paneladdcategory" runat="server" Text="Add Category" CssClass="btn btn-primary text-white" OnClick="btn_paneladdcategory_Click" BorderStyle="None" CausesValidation="False" />
            </div>
            
            <asp:Panel ID="panel_addcategory" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Category Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_category" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_category" runat="server" ErrorMessage="Enter category" ControlToValidate="txt_category" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addcategory" runat="server" Text="Add Category" CssClass="btn rounded-2 bg-primary" BorderStyle="None" ForeColor="White" OnClick="btn_addcategory_Click" />
                        </div>
                        <asp:Panel ID="panel_addcategory_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_categoryaddwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
          
            <asp:Panel ID="panel_categorylist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_categorylist" runat="server" CssClass="table table-bordered" GridLines="None" AutoGenerateColumns="False" OnRowCommand="grdview_categorylist_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="grdview_categorylist_PageIndexChanging">                              
                                 <Columns>
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" >
                                     <HeaderStyle CssClass="card-header" />
                                     </asp:BoundField>
                                    <asp:TemplateField HeaderText="Options">
                                        <HeaderStyle CssClass="card-header" />
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_editcategoryx" runat="server" CssClass="btn btn-primary" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "editcategory.aspx?cid=" + Eval("category_id")%>'>
                                            <i class="bi bi-pencil-square" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_deletecategory" runat="server" CssClass="btn btn-danger" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("category_id") %>' CommandName="delete_category">
                                            <i class="bi bi-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no category right now. Create now
                                </EmptyDataTemplate>
                                 <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="panel_categorylist_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_categorylistwarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

</asp:Content>
