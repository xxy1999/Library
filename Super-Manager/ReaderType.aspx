<%@ Page Title="" Language="C#" MasterPageFile="~/Super-Manager/MasterPage_SM.master" AutoEventWireup="true" CodeFile="ReaderType.aspx.cs" Inherits="Super_Manager_ReaderType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/private.css" rel="stylesheet" type="text/css" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
        <asp:Label ID="Label10" runat="server" Text="欢迎来到图书管理系统！" CssClass="text"></asp:Label>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/who.png" CssClass="who" />
        <asp:Label ID="Label4" runat="server" Text="用户名" CssClass="name"></asp:Label>
        <a href="../Login.aspx">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/exit.png" CssClass="exit" /></a>

    </div>
    <div id="middle">
        <div style="display: flex; align-items: center;height:40px;">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/position.png" />
        <asp:Label ID="Label1" runat="server" Text="当前位置：" CssClass="position"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="读者类型" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="读者类型" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:Button ID="Button1" runat="server" Text="+添加读者类型" CssClass="add" 
            onclientclick="window.open('addReaderType.aspx?id=add','','width=500,height=550');" 
            BorderColor="White" />
        
        <asp:GridView ID="gvReaderType" runat="server" AutoGenerateColumns="False" 
            Width="930px" AllowPaging="True"   CssClass="gv" GridLines="None" PageSize="6" CellPadding="4"
            OnRowDeleting="ReaderType_RowDeleting"  OnPageIndexChanging="ReaderType_PageIndexChanging" >
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="type" HeaderText="读者类型" />
                <asp:BoundField DataField="num" HeaderText="可借数量" />
                <asp:TemplateField HeaderText="修改">
                    <ItemTemplate>
                        <a href="#" class="change" 
                        onclick="window.open('addReaderType.aspx?id=<%#Eval("id") %>','','width=500,height=550')">修改</a>
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

