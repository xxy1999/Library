<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterPage_M.master" AutoEventWireup="true" CodeFile="ReaderInfo.aspx.cs" Inherits="Manager_ReaderInfo" %>

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
        <asp:Label ID="Label2" runat="server" Text="读者管理" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="读者管理" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:Button ID="Button1" runat="server" Text="+添加读者信息" CssClass="add" 
            onclientclick="window.open('addReaderInfo.aspx?readerBarCode=add','','width=800,height=500');" 
            BorderColor="White" />
        
        <div style="overflow-x:auto;">
        <asp:GridView ID="gvReaderInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            Width="1100px" CssClass="gv" GridLines="None" PageSize="6" CellPadding="4"
             OnRowDeleting="gvReaderInfo_RowDeleting" 
            onrowdatabound="gvReaderInfo_RowDataBound" 
            onpageindexchanging="gvReaderInfo_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="readerBarCode" HeaderText="读者编号" ReadOnly="True" />
                <asp:BoundField DataField="readerPass" HeaderText="读者密码" />
                <asp:BoundField DataField="readerName" HeaderText="读者姓名" />
                <asp:BoundField DataField="sex" HeaderText="性别" />
                <asp:BoundField DataField="readerType" HeaderText="读者类型" />
                <asp:BoundField DataField="certificateType" HeaderText="证件类型" />
                <asp:BoundField DataField="certificate" HeaderText="证件号码" />
                <asp:BoundField DataField="tel" HeaderText="电话"  />
                <asp:BoundField DataField="email" HeaderText="e-mail" />
                <asp:BoundField DataField="remark" HeaderText="备注" />
                <asp:BoundField DataField="money" HeaderText="余额" DataFormatString="{0:f2}" />
                <asp:TemplateField HeaderText="修改">
                    <ItemTemplate>
                    <a href="#"  onclick="window.open('addReaderInfo.aspx?readerBarCode=<%#Eval("readerBarCode") %>','','width=700,height=500')"
                     class="change">修改</a>
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

    </div>
</asp:Content>

