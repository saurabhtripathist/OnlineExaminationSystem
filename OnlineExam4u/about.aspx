<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Online_Examination_System.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headcontentplaceholder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
     <div class="card">
        <div class="col-md-12">
            <div class="card-header bg-primary rounded-2">
                <h2>Online Examination System </h2>
            </div>
            <div class="card-body bg-light">
                <p>In this project, we are going to make an online exam system where an admin can take exam for the current student who are logged in this system. Here, the admin will take the exam of objective type questions.</p>
                <p>In admin section </p>
                <ul>
                    <li>An admin can add another admin</li>
                    <li>An admin can create subjects type</li>
                    <li>An admin can add subject question with multiple object with answer</li>
                    <li>An admin can see a student result as well as profile</li>
                    <li>An admin can reset his/her profile</li>
                </ul>
                <p>In student section </p>
                <ul>
                    <li>A student can create his profile n</li>
                    <li>A student can take part in exam </li>
                    <li>A students can search the website to get easilt the exam</li>
                    <li>A student can see his progress report</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
