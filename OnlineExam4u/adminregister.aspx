<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminregister.aspx.cs" Inherits="Online_Examination_System.adminregister" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
       Admin Register
    </title>
    <!-- Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body class="bg-dark">
    <div class="container">
        <div class="card card-register mx-auto mt-5">
            <div class="card-header bg-primary text-white m-2 p-3 rounded-2">Admin Registeration</div>
            <div class=" container">
                <a class="btn btn-primary mt-0" href="home.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                </a>
            </div>
            <div class="card-body">
                <form runat="server" id="formregister">
                    <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                    <div class="form-group card-header text-center">
                        <div class="alert-danger">
                        <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                        </div>
                    </div>
                    </asp:Panel>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-12">
                                <label for="InputName">Name</label>
                                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_name" runat="server" ErrorMessage="Enter Name" ControlToValidate="txt_name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="InputEmail1">Email Address</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqr_emil" runat="server" ErrorMessage="Enter Email" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rqrexpre_email" runat="server" ErrorMessage="Enter Validate Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red" ></asp:RegularExpressionValidator>
                          </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-12">
                                <label for="InputPassword1">Password</label>
                                <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Enter Password" ControlToValidate="txt_pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-12">
                                <label for="ConfirmPassword">Confirm Password</label>
                                <asp:TextBox ID="txt_repass" runat="server" CssClass="form-control" placeholder="Re-enter password" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="rqrcopm_pass" runat="server" ErrorMessage="Password do not match." ControlToValidate="txt_repass" Display="Dynamic" ForeColor="Red" ControlToCompare="txt_pass" ></asp:CompareValidator>
                                 </div>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="btn_register" runat="server" Text="Register" CssClass="btn btn-success btn-block" OnClick="btn_register_Click" />
                    <div class="text-center">
                        <a class="d-block small mt-3" href="adminlogin.aspx">Admin Login</a>
                        <a class="d-block small" href="resetpass.aspx"> Forgotten Password?</a>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>
    </html>