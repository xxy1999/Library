<%@ Page Title="" Language="C#" MasterPageFile="~/Reader/MasterPage_R.master" AutoEventWireup="true" CodeFile="Rank.aspx.cs" Inherits="Reader_Rank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/private.css" rel="stylesheet" type="text/css" />
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
            <asp:Label ID="Label2" runat="server" Text="借阅排行" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="借阅排行" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:GridView ID="gvRank" runat="server" AutoGenerateColumns="False"
         PageSize="8" Width="960px" CellPadding="4" ForeColor="#333333" GridLines="None"
         onrowdatabound="gvRank_RowDataBound" CssClass="gv">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField HeaderText="排名"/>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" 
                 ReadOnly="True" SortExpression="bookBarCode"  />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                <asp:BoundField DataField="bookcase" HeaderText="图书书架" />
                <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                <asp:BoundField DataField="author" HeaderText="作者" />
                <asp:BoundField DataField="price" HeaderText="图书定价" DataFormatString="{0:f2}" />
                <asp:BoundField DataField="stock" HeaderText="现存数量" />
                <asp:BoundField DataField="borrowSum" HeaderText="借阅次数"  />
            </Columns>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#DDDDDD" ForeColor="black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#DDDDDD"  CssClass="hds"  HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
            <RowStyle BackColor="white"  CssClass="row"  HorizontalAlign="Center" Font-Size="14px" />
            <EditRowStyle BackColor="#2461BF" />
        </asp:GridView>
    </div>
</asp:Content>

