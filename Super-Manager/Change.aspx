<%@ Page Title="" Language="C#" MasterPageFile="~/Super-Manager/MasterPage_SM.master" AutoEventWireup="true" CodeFile="Change.aspx.cs" Inherits="Super_Manager_Change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/private.css" rel="stylesheet" type="text/css" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
        <asp:Label ID="Label10" runat="server" Text="欢迎来到图书管理系统!" CssClass="text"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/who.png" CssClass="who" />
        <asp:Label ID="Label4" runat="server" Text="用户名" CssClass="name"></asp:Label>
        <a href="../Login.aspx">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/exit.png" CssClass="exit" /></a>
    </div>
    <div id="middle">
        <div style="display: flex; align-items: center;height:40px;">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/position.png" />
        <asp:Label ID="Label1" runat="server" Text="当前位置：" CssClass="position"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="修改密码" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="修改密码" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <div style="margin-left:50px;margin-top:20px;">
        
        <asp:Label ID="Label5" runat="server" Text="账 号 ：" CssClass="change2" Width="100px"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="140px" CssClass="txt2"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="旧 密 码：" CssClass="change2" Width="100px"></asp:Label>
        <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" CssClass="txt2" Width="140px"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="新 密 码：" CssClass="change2" Width="100px"></asp:Label>
        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="txt2" Width="140px"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Text="确认新密码：" CssClass="change2" Width="100px"></asp:Label> 
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="txt2" Width="140px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtPass"
        ErrorMessage="密码不一致"></asp:CompareValidator>
        <br />
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" CssClass="bts" />
        <asp:Button ID="Button1" runat="server" Text="取 消" CssClass="quxiao" onclick="Button1_Click" />
        </div>
    </div>
</asp:Content>

