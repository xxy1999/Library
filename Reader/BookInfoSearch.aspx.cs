using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Reader_BookInfoSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            Label4.Text = (String)Session["userName"];
        }
        if (!IsPostBack)
        {
            bindBookType();
            bindBook();
        }
    }
    //绑定图书类型下拉列表
    public void bindBookType()
    {
        string sql = "select * from tb_bookType";                               //获取所有图书类型
        ddlBookType.DataSource = dataOperate.getDataset(sql, "tb_bookType");    //将图书类型绑定到DropDownList控件上
        ddlBookType.DataTextField = "typeName";                                 //设置DropDownList控件的显示文本
        ddlBookType.DataValueField = "typeID";                                  //设置DropDownList控件的值
        ddlBookType.DataBind();
    }

    public void bindBook()
    {
        string sql = "select * from tb_bookInfo  where bookBarCode like '%" + txtBookBarCode.Text + "%'  and  bookName like '%" + TextBox2.Text + "%' and  author like '%" + TextBox1.Text + "%' and  bookType='" + ddlBookType.SelectedValue + "'";
        gvBookManage.DataSource = dataOperate.getDataset(sql, "tb_bookInfo");     //获取图书信息数据源
        gvBookManage.DataKeyNames = new string[] { "bookBarCode" };               //设置主键字段  
        gvBookManage.DataBind();                                                  //绑定GridView控件  
    }

    protected void gvBookManage_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   //设置图书类型
            string bookType = e.Row.Cells[2].Text.ToString();               //获取图书类型编号
            string typeSql = "select * from tb_bookType where TypeID=" + bookType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 //读取一条记录
            e.Row.Cells[2].Text = typeSdr["typeName"].ToString();
            //设置书架
            string bookcase = e.Row.Cells[3].Text.ToString();               //获取书架编号
            string caseSql = "select * from tb_bookcase where bookcaseID=" + bookcase;
            SqlDataReader caseSdr = dataOperate.getRow(caseSql);
            caseSdr.Read();                                                 //读取一条记录
            e.Row.Cells[3].Text = caseSdr["bookcaseName"].ToString();

            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#F1F1F1'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
        }
    }



    protected void gvBookManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookManage.PageIndex = e.NewPageIndex;                //设置当前页的索引
        gvBookManage.DataBind();                                //重新绑定GridView控件
    }
    protected void btnBookSearch_Click(object sender, EventArgs e)
    {
        bindBook();
    }
}