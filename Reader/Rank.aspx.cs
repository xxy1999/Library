using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Reader_Rank : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)        //判断用户是否登录    
        {
            bindBookInfo();//调用自定义方法用来绑定图书借阅排行
            Label4.Text = (String)Session["userName"];
        }
        else
            Response.Redirect("../Login.aspx");    //跳转到登录页面
    }
    protected void bindBookInfo()
    {
        string sql = "select top 10 * from tb_bookInfo order by borrowSum desc";            //设置SQL语句
        gvRank.DataSource = dataOperate.getDataset(sql, "tb_bookInfo");    //获取图书信息数据源
        gvRank.DataBind();                                                 //绑定GridView控件
    }
    protected void gvRank_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)   //判断GridView控件中是否有值
        {
            int id = e.Row.RowIndex + 1;//将当前行的索引加上一赋值给变量id
            e.Row.Cells[0].Text = id.ToString();//将变量id的值传给GridView控件的每一行的单元格中
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //绑定图书类型
            string bookType = e.Row.Cells[3].Text.ToString();           //获取图书类型编号
            string typeSql = "select * from tb_bookType where typeID=" + bookType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                             //读取一条数据
            e.Row.Cells[3].Text = typeSdr["typeName"].ToString();       //设置图书类型
            //绑定书架
            string bookcase = e.Row.Cells[4].Text.ToString();           //获取书架编号
            string caseSql = "select * from tb_bookcase where bookcaseID=" + bookcase;
            SqlDataReader caseSdr = dataOperate.getRow(caseSql);
            caseSdr.Read();
            e.Row.Cells[4].Text = caseSdr["bookcaseName"].ToString();   //设置书架
            //设置鼠标悬停行的颜色
            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#F1F1F1'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
        }
    }
}