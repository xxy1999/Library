<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage_M.master" AutoEventWireup="true" CodeFile="BookInfoSearch.aspx.cs" Inherits="Manager_BookInfoSearch" %>

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
        <asp:Label ID="Label2" runat="server" Text="图书搜索" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书搜索" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <div id="input">
            <asp:Label ID="Label5" runat="server" Text="图书编号"></asp:Label>
            <asp:TextBox ID="txtBookBarCode" runat="server" Width="106px" ValidationGroup="2" CssClass="content"></asp:TextBox>
            <asp:Label ID="Label6" runat="server" Text="图书作者"></asp:Label>               
            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="2" Width="106px" CssClass="content"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" Text="图书关键字"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="2" Width="106px" CssClass="content"></asp:TextBox>
            <asp:Label ID="Label9" runat="server" Text="图书类型"></asp:Label>            
            <asp:DropDownList ID="ddlBookType" runat="server" Width="106px" CssClass="ddl">
            </asp:DropDownList>
            <asp:Button ID="btnBookSearch" runat="server" Text="检索" OnClick="btnBookSearch_Click" ValidationGroup="2" CssClass="bts" />
        </div>
        <asp:GridView ID="gvBookManage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvBookManage_PageIndexChanging"
            OnRowDataBound="gvBookManage_RowDataBound"  Width="950px" CssClass="gv" >
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                <asp:BoundField DataField="bookcase" HeaderText="图书书架" />
                <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                <asp:BoundField DataField="author" HeaderText="作者" />
                <asp:BoundField DataField="price" HeaderText="图书定价" />
                <asp:BoundField DataField="borrowSum" HeaderText="借阅次数" />
            </Columns>
            <RowStyle BackColor="white" CssClass="row"  HorizontalAlign="Center" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#DDDDDD" ForeColor="black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#DDDDDD"  CssClass="hds"  HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</asp:Content>

