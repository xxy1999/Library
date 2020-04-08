<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBookcase.aspx.cs" Inherits="addBookcase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
     <link href="../css/add.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="书架名称：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtBookcase" runat="server"   CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="保　存" OnClick="btnSave_Click" />
        <input id="close"  onclick="window.close();" type="button" value="关　闭" />
    </div>
    </form>
</body>
</html>
