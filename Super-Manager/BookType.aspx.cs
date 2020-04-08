using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Super_Manager_BookType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)      //判断管理员是否登录
        {
            Label4.Text = (String)Session["userName"];
            bindBookType();

        }
        else
        {
            Response.Redirect("../Login.aspx"); //返回到登录页面
        }
    }
    //自定义方法绑定图书类型信息
    public void bindBookType()
    {
        string sql = "select * from tb_bookType";
        gvBookType.DataSource = dataOperate.getDataset(sql, "tb_bookType");
        gvBookType.DataKeyNames = new string[] { "typeID" };
        gvBookType.DataBind();
    }

    protected void gvBookType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvBookType.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from tb_bookInfo where bookType=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete tb_bookType where typeID=" + id;
            dataOperate.execSQL(sql);
            bindBookType();
        }
        else
            Response.Write("<script>alert('有该类型的图书，不可以删除！')</script>");


    }
    protected void gvBookType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookType.PageIndex = e.NewPageIndex;                //设置当前页的索引
        gvBookType.DataBind();
    }
}