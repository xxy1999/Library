<%@ Page Title="" Language="C#" MasterPageFile="~/Super-Manager/MasterPage_SM.master" AutoEventWireup="true" CodeFile="BookType.aspx.cs" Inherits="Super_Manager_BookType" %>

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
            <asp:Label ID="Label2" runat="server" Text="图书类型管理" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书类型管理" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:Button ID="Button1" runat="server" Text="+添加图书类型" CssClass="add" 
        onclientclick="window.open('addBookType.aspx?id=add','','width=500,height=550');" 
        BorderColor="White" />
                 
        <asp:GridView ID="gvBookType"　ForeColor="#333333" runat="server" AutoGenerateColumns="False" Width="930px" 
         PageSize="8" AllowPaging="True" OnRowDeleting="gvBookType_RowDeleting" GridLines="None"
         OnPageIndexChanging="gvBookType_PageIndexChanging"  CssClass="gv">
            <Columns>
                <asp:BoundField HeaderText="图书类型名称" DataField="typeName" />
                <asp:BoundField DataField="borrowDay" HeaderText="可借天数" />
                <asp:TemplateField HeaderText="修改">
                    <ItemTemplate>
                        <a href="#" class="change" onclick="window.open('addBookType.aspx?id=<%#Eval("typeID") %>','','width=500,height=550')">修改</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                            CommandName="Delete" Text="删除" OnClientClick="return confirm('你确定要删除吗？')" CssClass="delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="white"  CssClass="row"  HorizontalAlign="Center" Font-Size="14px" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#DDDDDD" ForeColor="black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#DDDDDD"  CssClass="hds"  HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</asp:Content>

