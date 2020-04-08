<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addReaderInfo.aspx.cs" Inherits="addReaderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <title>无标题页</title>
        <link href="../css/add.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="读者编号：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtReaderBarCode" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="读者姓名：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtReaderName" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReaderName"
         ErrorMessage="必填"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="登录密码：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"  CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="性别：" CssClass="txt2" Width="70px"></asp:Label>                    
        <asp:RadioButton ID="radbtnMan" runat="server" Checked="True" GroupName="sex" Text="男"/>
        <asp:RadioButton ID="radbtnWoman" runat="server" GroupName="sex" Text="女" />
        <br />

        <asp:Label ID="Label10" runat="server" Text="读者类型：" CssClass="txt" Width="70px"></asp:Label>

        <asp:DropDownList ID="ddlReaderType" runat="server"  Width="150px" CssClass="ddl">
            <asp:ListItem Value="1">学生</asp:ListItem>
            <asp:ListItem Value="2">青年</asp:ListItem>
            <asp:ListItem Value="3">儿童</asp:ListItem>
            <asp:ListItem Value="4">孕妇</asp:ListItem>
            <asp:ListItem Value="5">幼儿</asp:ListItem>
            <asp:ListItem Value="6">青年</asp:ListItem>
            <asp:ListItem Value="7">老年</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label5" runat="server" Text="证件类型：" CssClass="txt" Width="70px"></asp:Label>
        <asp:DropDownList ID="ddlCertificateType" runat="server" Width="150px" CssClass="ddl">
            <asp:ListItem>学生证</asp:ListItem>
            <asp:ListItem>身份证</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label6" runat="server" Text="证件号码：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtCertificate" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCertificate"
         ErrorMessage="必填"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label7" runat="server" Text="联系电话：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtTel" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel"
         ErrorMessage="必填"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label8" runat="server" Text="E-mail：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
         ErrorMessage="格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label11" runat="server" Text="可用余额：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtMoney" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="Label9" runat="server" Text="备注：" CssClass="txt" Width="70px"></asp:Label>
        <asp:TextBox ID="txtRemark" runat="server" Height="74px" TextMode="MultiLine"  CssClass="tb" Width="150px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
        <input id="close" onclick="window.close();" type="button" value="关　闭" />
                       
    </div>
    </form>
</body>
</html>
