<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage_M.master" AutoEventWireup="true" CodeFile="BookBorrowSearch.aspx.cs" Inherits="Manager_BookBorrowSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/BorrowSearch.css" rel="stylesheet" type="text/css" />
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
        <asp:Label ID="Label2" runat="server" Text="借阅查询" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="借阅查询" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <div class="select">
             请选择查询条件：
            <asp:DropDownList ID="ddlCondition" runat="server" CssClass="ddl">
            <asp:ListItem Value="bookBarCode">图书条形码</asp:ListItem>
                <asp:ListItem Value="bookName">书名</asp:ListItem>
                <asp:ListItem Value="readerBarCode">读者条形码</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtKey" runat="server" CssClass="txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKey"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜索" 
                 Width="80px" CssClass="bt" BorderStyle="None" />     
            <br />
            <br />
            <asp:RadioButton ID="rdibtnSy" runat="server" Checked="True" GroupName="borrow" Text="所有信息" CssClass="rb" />
            <asp:RadioButton ID="rdibtn1" runat="server" GroupName="borrow" Text="已还信息" CssClass="rb" />
            <asp:RadioButton ID="rdibtn0" runat="server" GroupName="borrow" Text="未还信息" CssClass="rb" />
        </div>   
        <asp:GridView ID="gvBookBorrow" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" OnPageIndexChanging="gvBookBorrow_PageIndexChanging" 
            PageSize="5" CssClass="gv">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="borrowTime" DataFormatString="{0:yy-MM-dd}" HeaderText="借阅日期"
                    HtmlEncode="False" />
                <asp:BoundField DataField="returnTime" DataFormatString="{0:yy-MM-dd}" HeaderText="应还日期" />
                <asp:BoundField DataField="readerBarCode" HeaderText="读者条形码" />
                <asp:BoundField DataField="readerName" HeaderText="读者名称" />
                <asp:CheckBoxField DataField="isReturn" HeaderText="是否归还" ReadOnly="True" />
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

