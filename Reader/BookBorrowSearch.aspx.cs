using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Reader_BookBorrowSearch : System.Web.UI.Page
{
    static string sql = "";
    public string readerBarCode = "";    //获取读者条形码
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            Label4.Text = (String)Session["userName"];
            sql = "select * from tb_bookBorrow where readerBarCode='" + Session["userName"].ToString() + "'";
            bindBookBorrow(sql);
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }
    }
    public void bindBookBorrow(string seSql)
    {
        gvBookBorrow.DataSource = dataOperate.getDataset(seSql, "bookBorrow");
        gvBookBorrow.DataBind();
    }



    protected void gvBookBorrow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookBorrow.PageIndex = e.NewPageIndex;
        bindBookBorrow(sql);
    }

    public void bindReaderInfo()
    {



    }

}