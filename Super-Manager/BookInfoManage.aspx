<%@ Page Title="" Language="C#" MasterPageFile="~/Super-Manager/MasterPage_SM.master" AutoEventWireup="true" CodeFile="BookInfoManage.aspx.cs" Inherits="Super_Manager_BookInfoManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/private.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
    /* 弹窗 (background) */
.modal {
    display: none; /* 默认隐藏 */
    position: fixed; /* 固定定位 */
    z-index: 1; /* 设置在顶层 */
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%;
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
}

/* 弹窗内容 */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 80%; 
}

/* 关闭按钮 */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
    </style>

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
            <asp:Label ID="Label2" runat="server" Text="图书管理" CssClass="bs"></asp:Label>
        </div>
        <asp:Label ID="Label3" runat="server" Text="图书管理" CssClass="bs2"></asp:Label>
        <br />
    </div>
    <div id="main2">
        <asp:Button ID="Button1" runat="server" Text="+添加图书信息" CssClass="add" 
            onclientclick="window.open('addBookInfo.aspx?ID=add','','width=500,height=550');" 
            BorderColor="White" />
         
        <asp:GridView ID="gvBookManage" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5"
            CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvBookManage_PageIndexChanging"
            OnRowDataBound="gvBookManage_RowDataBound" OnRowDeleting="gvBookManage_RowDeleting"
            Width="930px"  CssClass="gv">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                <asp:BoundField DataField="bookcase" HeaderText="图书书架" />
                <asp:BoundField DataField="bookConcern" HeaderText="出版社" />
                <asp:BoundField DataField="author" HeaderText="作者" />
                <asp:BoundField DataField="price" HeaderText="图书定价" DataFormatString="{0:f2}" />
                <asp:BoundField DataField="stock" HeaderText="库存" />
                <asp:BoundField DataField="borrowSum" HeaderText="借阅次数" />
               
                <asp:TemplateField HeaderText="修改">
                    <ItemTemplate>
                         <a href="#" onclick="window.open('addBookInfo.aspx?ID=<%#Eval("bookBarCode") %>','','width=500,height=550')"
                                                 class="change">修改</a>
                    <%--<a  href="#" onclick="window.open('BookInfoManage.aspx?ID=<%#Eval("bookBarCode") %>','','width=500,height=550')" class="myBtn">修改</a>--%>
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
    
    <%--<!-- 弹窗 -->
        <div id="myModal" class="modal">

          <!-- 弹窗内容 -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <asp:Label ID="Label5" runat="server" Text="图书编号：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="txtBarCode" runat="server" CssClass="tb" Width="150px"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="图书名称：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="txtBookName" runat="server" Width="150px" CssClass="tb"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookName" runat="server" ControlToValidate="txtBookName"
             ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label7" runat="server" Text="图书类型：" CssClass="txt" Width="70px"></asp:Label>
            <asp:DropDownList ID="ddlBookType" runat="server"  Width="150px" CssClass="ddl">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthor" runat="server" ControlToValidate="txtAuthor"
             ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label8" runat="server" Text="图书作者：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="txtAuthor" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
            <br />
            <asp:Label ID="Label9" runat="server" Text="出版社：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="txtBookConcern" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookconcern" runat="server"
              ControlToValidate="txtBookConcern" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label11" runat="server" Text="图书价格：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"  Width="150px" CssClass="tb"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="txtPrice"
              ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label12" runat="server" Text="书 架：" CssClass="txt" Width="70px"></asp:Label>
            <asp:DropDownList ID="ddlBookcase" runat="server"  Width="150px" CssClass="ddl">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label13" runat="server" Text="储 量：" CssClass="txt" Width="70px"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"  CssClass="tb" Width="150px"></asp:TextBox>
            <br />
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
            <input id="close" onclick="window.close()" type="button" value="关　闭" />
          </div>

        </div>--%>

    </div>
<script type="text/javascript">
    // 获取弹窗
    var modal = document.getElementById('myModal');

    // 打开弹窗的按钮对象
    var btn = document.getElementsByClassName("myBtn");

    // 获取 <span> 元素，用于关闭弹窗
    var span = document.querySelector('.close');

    // 点击按钮打开弹窗
    for (var i = 0; i < btn.length; i++) {
        btn[i].onclick = function () {
            modal.style.display = "block";
                
        }
    }

    // 点击 <span> (x), 关闭弹窗
    span.onclick = function () {
        modal.style.display = "none";
    }

    // 在用户点击其他地方时，关闭弹窗
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</asp:Content>

