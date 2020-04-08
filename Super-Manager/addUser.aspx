<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="addUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加管理员</title>
    <link href="../css/add.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="姓名："  CssClass="txt" Width="90px"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtUserName"
           ErrorMessage="姓名不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="密码："  CssClass="txt" Width="90px"></asp:Label>               
        <asp:TextBox ID="txtPass" runat="server"  CssClass="tb" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ControlToValidate="txtPass"
          ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="确认密码："  CssClass="txt" Width="90px"></asp:Label>  
        <asp:TextBox ID="txtQpass" runat="server"  CssClass="tb" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
        ControlToValidate="txtQpass" ErrorMessage="密码不一致"  ></asp:CompareValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="管理员类别："  CssClass="txt" Width="90px"></asp:Label>  
        <asp:DropDownList ID="DropDownList1" runat="server" Width="160px" CssClass="ddl">
            <asp:ListItem Value="1">超级管理员</asp:ListItem>
            <asp:ListItem Value="0">普通管理员</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="添 加" OnClick="btnSave_Click" />
        <input id="close" onclick="window.close()" type="button" value="关　闭" />                     
    </div>
    </form>
</body>
</html>
