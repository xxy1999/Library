<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="kuang"">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/woman.png" CssClass="woman" />
        <div id="content">
        <asp:Label ID="Label1" runat="server" Text="用户名：" Width="70px"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="logi"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="密码：" Width="70px"></asp:Label>
        <asp:TextBox ID="txtPwd" runat="server" CssClass="logi" TextMode="Password"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="角色：" Width="70px"></asp:Label>
        <asp:DropDownList ID="ddListType" runat="server" CssClass="logi">
            <asp:ListItem Value="1">超级管理员</asp:ListItem>
            <asp:ListItem Value="2">普通管理员</asp:ListItem>
            <asp:ListItem Value="3">读者</asp:ListItem>
        </asp:DropDownList><br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="登录" onclick="Button1_Click" CssClass="btt" />
        </div>
    </div>
    </form>
</body>
</html>
