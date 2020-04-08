<%@ Page Title="" Language="C#" MasterPageFile="~/Reader/MasterPage_R.master" AutoEventWireup="true" CodeFile="Renew.aspx.cs" Inherits="Reader_Renew" %>

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
        <asp:Label ID="Label2" runat="server" Text="图书续借" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书续借" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
     <div class="chazhao">
        <asp:Button ID="btnReaderSearch" runat="server" OnClick="btnReaderSearch_Click" Text="获取本人信息"
         ValidationGroup="1" CssClass="for" />
        <br /><br />
        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/infor.png" />

        <br />
        <asp:Label ID="Label6" runat="server" Text="姓 名：" Width="80px" CssClass="tit"></asp:Label>              
        <asp:TextBox ID="txtReaderName" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <asp:Label ID="Label7" runat="server" Text="性 别：" Width="80px" CssClass="tit"></asp:Label>   
        <asp:TextBox ID="txtReaderSex" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Text="读者类型：" Width="80px" CssClass="tit"></asp:Label>   
        <asp:TextBox ID="txtReaderType" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <br />
        <asp:Label ID="Label9" runat="server" Text="证件类型：" Width="80px" CssClass="tit"></asp:Label>                     
        <asp:TextBox ID="txtCertificateType" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <asp:Label ID="Label11" runat="server" Text="证件号码：" Width="80px" CssClass="tit"></asp:Label>      
        <asp:TextBox ID="txtCertificate" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <br />
        <asp:Label ID="Label12" runat="server" Text="可借数量：" Width="80px" CssClass="tit"></asp:Label>     
        <asp:TextBox ID="txtNum" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="余 额：" Width="80px" CssClass="tit"></asp:Label>     
        <asp:TextBox ID="txtMoney" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        <br /><br />
        <hr class="hr"/><br />
        
        <asp:Label ID="Label14" runat="server" Text="图书编号：" Width="80px" CssClass="tit"></asp:Label>                   
        <asp:TextBox ID="txtBookBarCode" runat="server" Width="150px" ValidationGroup="2" CssClass="txt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBookBarCode"
         Display="Dynamic" ErrorMessage="不能为空" ValidationGroup="2"></asp:RequiredFieldValidator>
        <asp:Button ID="btnBookSearch" runat="server" Text="查找图书" OnClick="btnBookSearch_Click" ValidationGroup="2" CssClass="find" />
        
        <asp:GridView ID="gvBookRenewal" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="gvBookRenewal_SelectedIndexChanging"
            PageSize="5" Width="930px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="borrowTime" DataFormatString="{0:yyy-MM-dd}" HeaderText="借阅时间"
                    HtmlEncode="False" />
                <asp:BoundField DataField="returnTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="应还时间"
                    HtmlEncode="False" />
                <asp:BoundField DataField="readerName" HeaderText="借阅人" />
                <asp:CommandField HeaderText="续借" SelectText="续借" ShowSelectButton="True" />
            </Columns>
            <RowStyle BackColor="white" CssClass="row"  HorizontalAlign="Center" Font-Size="14px"/>
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#F6F6F6"  ForeColor="#333333" />
            <PagerStyle BackColor="#DDDDDD" ForeColor="black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#DDDDDD"  CssClass="hds"  HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
     
     </div>
    </div>
</asp:Content>

