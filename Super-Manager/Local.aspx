<%@ Page Title="" Language="C#" MasterPageFile="~/Super-Manager/MasterPage_SM.master" AutoEventWireup="true" CodeFile="Local.aspx.cs" Inherits="Super_Manager_Local" %>

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
        <asp:Label ID="Label2" runat="server" Text="图书管信息" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书管信息" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LibraryCnnString %>" 
            SelectCommand="SELECT * FROM [tb_library]" 
            DeleteCommand="DELETE FROM [tb_library] WHERE [libraryName] = @libraryName" 
            InsertCommand="INSERT INTO [tb_library] ([libraryName], [curator], [tel], [address], [email], [net], [upbuildTime], [remark]) VALUES (@libraryName, @curator, @tel, @address, @email, @net, @upbuildTime, @remark)" 
            UpdateCommand="UPDATE [tb_library] SET [curator] = @curator, [tel] = @tel, [address] = @address, [email] = @email, [net] = @net, [upbuildTime] = @upbuildTime, [remark] = @remark WHERE [libraryName] = @libraryName">
            <DeleteParameters>
                <asp:Parameter Name="libraryName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="libraryName" Type="String" />
                <asp:Parameter Name="curator" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="net" Type="String" />
                <asp:Parameter Name="upbuildTime" Type="DateTime" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="curator" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="net" Type="String" />
                <asp:Parameter Name="upbuildTime" Type="DateTime" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="libraryName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div style="overflow-x:auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Horizontal" CssClass="gv" Width="970px">
            <Columns>
                <asp:BoundField DataField="libraryName" HeaderText="图书馆名称" 
                    SortExpression="libraryName" />
                <asp:BoundField DataField="curator" HeaderText="馆长" 
                    SortExpression="curator" />
                <asp:BoundField DataField="tel" HeaderText="电话" SortExpression="tel" />
                <asp:BoundField DataField="address" HeaderText="地址" 
                    SortExpression="address" />
                <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
                <asp:BoundField DataField="net" HeaderText="网址" SortExpression="net" />
                <asp:BoundField DataField="upbuildTime" HeaderText="建管时间" 
                    SortExpression="upbuildTime" />
                <asp:BoundField DataField="remark" HeaderText="备注" 
                    SortExpression="remark" />
                <asp:CommandField EditText="修改" HeaderText="修改" ShowEditButton="True" ItemStyle-CssClass="change"
                 ItemStyle-ForeColor="#1890FF" />
            </Columns>
            <RowStyle BackColor="white"  CssClass="row"  HorizontalAlign="Center" Font-Size="14px" />
            <EditRowStyle BackColor="#E6E6E6" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#DDDDDD" ForeColor="black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#DDDDDD"  CssClass="hds"  HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        </div>
    </div>
</asp:Content>

