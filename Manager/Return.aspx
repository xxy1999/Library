<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage_M.master" AutoEventWireup="true" CodeFile="Return.aspx.cs" Inherits="Manager_Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/private.css" rel="stylesheet" type="text/css" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
        <asp:Label ID="Label10" runat="server" Text="欢迎来到图书管理系统" CssClass="text"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/who.png" CssClass="who" />
        <asp:Label ID="Label4" runat="server" Text="用户名" CssClass="name"></asp:Label>
        <a href="../Login.aspx">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/exit.png" CssClass="exit" /></a>
    </div>
    <div id="middle">
        <div style="display: flex; align-items: center;height:40px;">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/position.png" />
        <asp:Label ID="Label1" runat="server" Text="当前位置：" CssClass="position"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="图书归还" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书归还" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
     <div class="chazhao">
        <asp:Label ID="Label5" runat="server" Text="读者编号：" Width="80px" CssClass="tit"></asp:Label>
        <asp:TextBox ID="txtReaderBarCode" runat="server" ValidationGroup="1" Width="150px" CssClass="txt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReaderBarCode"
          ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
        <asp:Button ID="btnReaderSearch" runat="server" OnClick="btnReaderSearch_Click" Text="查找读者"
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

        <asp:GridView ID="gvBookReturn" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
         GridLines="None"  Width="930px" OnSelectedIndexChanging="gvBookReturn_SelectedIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书编号" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="typeName" HeaderText="图书类型" />
                <asp:BoundField DataField="borrowTime" HeaderText="借阅时间" DataFormatString="{0:yyy-MM-dd}"/>
                <asp:BoundField DataField="returnTime" HeaderText="应还时间" DataFormatString="{0:yyy-MM-dd}"/>
                <asp:BoundField DataField="borrowDay" HeaderText="可借天数" />
                <asp:BoundField DataField="hire" HeaderText="租金" />
                <asp:BoundField DataField="lagMoney" HeaderText="滞纳金" />
                <asp:BoundField DataField="readerName" HeaderText="借阅人" />
                <asp:CommandField HeaderText="归还" SelectText="归还" ShowSelectButton="True"  ItemStyle-ForeColor="#1890FF"/>
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

