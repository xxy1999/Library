<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBookInfo.aspx.cs" Inherits="addBookInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加图书信息</title>
    <link href="../css/add.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server" style="margin-left:40px">
    <div>
        <asp:Label ID="Label1" runat="server" Text="图书编号：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtBarCode" runat="server" CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBarCode"
         ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="图书名称：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtBookName" runat="server" Width="150px" CssClass="tb"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookName" runat="server" ControlToValidate="txtBookName"
         ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="图书类型：" CssClass="txt" Width="70px"></asp:Label>
        <asp:DropDownList ID="ddlBookType" runat="server"  Width="150px" CssClass="ddl">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label4" runat="server" Text="图书作者：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtAuthor" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthor" runat="server" ControlToValidate="txtAuthor"
          ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label5" runat="server" Text="出版社：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtBookConcern" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookconcern" runat="server"
          ControlToValidate="txtBookConcern" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label6" runat="server" Text="图书价格：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtPrice" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="txtPrice"
          ErrorMessage="不能为空"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label7" runat="server" Text="书 架：" CssClass="txt" Width="70px"></asp:Label>
        <asp:DropDownList ID="ddlBookcase" runat="server"  Width="150px" CssClass="ddl">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label8" runat="server" Text="储 量：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
        <input id="close" onclick="window.close()" type="button" value="关　闭" />
                      
    </div>
    </form>
</body>
</html>
