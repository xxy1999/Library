<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addReaderType.aspx.cs" Inherits="addReaderType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
      <link href="../css/add.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="类型名称：" CssClass="txt" Width="70px"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" CssClass="ddl">
            <asp:ListItem Value="1">学生</asp:ListItem>
            <asp:ListItem Value="2">老师</asp:ListItem>
            <asp:ListItem Value="3">讲师</asp:ListItem>
            <asp:ListItem Value="4">儿童</asp:ListItem>
            <asp:ListItem Value="5">孕妇</asp:ListItem>
            <asp:ListItem Value="6">青年</asp:ListItem>
            <asp:ListItem Value="7">少儿</asp:ListItem>
            <asp:ListItem Value="8">老年</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="可借数量："  CssClass="txt" Width="70px" ></asp:Label>
        <asp:TextBox ID="txtNum" runat="server" CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="保　存" OnClick="btnSave_Click" />
        <input id="close"  onclick="window.close();" type="button" value="关　闭" />  
    </div>
    </form>
</body>
</html>
