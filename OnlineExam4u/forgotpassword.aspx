<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="Online_Examination_System.forgotpassword" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <!-- Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>

<body class="bg-dark">
    <div class="container">
        <div class="card mx-auto mt-5">
            <div class="card-header bg-primary text-white m-2 p-3 rounded-2">
                Reset Password
            </div>
            <div class=" container">
                <a class="btn btn-primary mt-0" href="login.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                </a>
            </div>

            <div class="card-body">
                <form runat="server" id="formforgotten">
                    <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                        <div class="form-group card-header text-center">
                            <div class="alert-danger">
                                <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                            </div>
                        </div>
                        <br />
                    </asp:Panel>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-12">
                                <label for="CurrentPassword">Current Password</label>
                                <asp:TextBox ID="txt_currpass" runat="server" CssClass="form-control" placeholder="Enter Current Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Enter Correct Password" ControlToValidate="txt_currpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-12">
                                <label for="NewPassword">New Password</label>
                                <asp:TextBox ID="txt_newpass" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_newpass" runat="server" ErrorMessage="Enter new password" ControlToValidate="txt_newpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-12">
                                <label for=" Re-enter NewPassword">Re-enter New Password</label>
                                <asp:TextBox ID="txt_repass" runat="server" CssClass="form-control" placeholder="Re-enter New Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="require_userpassrepeat" runat="server" ErrorMessage="Re-enter new password" ControlToValidate="txt_repass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password do not match." ControlToValidate="txt_repass" Display="Dynamic" ForeColor="Red" ControlToCompare="txt_newpass"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>

                    <br />

                    <div class="card-footer">
                        <asp:Button ID="btn_reset" runat="server" Text="Reset" CssClass="btn btn-success btn-block" OnClick="btn_reset_Click" />
                        <asp:Panel ID="panel_resetpass_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_resetpasswarning" runat="server" />
                            </div>
                        </asp:Panel>

                        <div class="text-center">
                            <a class=" d-block small mt-3" href="login.aspx">Login</a>
                            <a class="d-block small" href="register.aspx">Create an Account</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</body>
</html>
