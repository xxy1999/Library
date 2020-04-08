using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_BookcaseManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            bindCase();
            Label4.Text = (String)Session["userName"];
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }        
    }
    public void bindCase()
    {
        string sql = "select * from tb_bookcase";
        Bookcase.DataSource = dataOperate.getDataset(sql, "tb_bookcase");
        Bookcase.DataKeyNames = new string[] { "bookcaseID" };
        Bookcase.DataBind();
    }
    protected void Bookcase_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = Bookcase.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from tb_bookInfo where bookcase=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete from tb_bookcase where bookcaseID=" + id;
            dataOperate.execSQL(sql);
            Bookcase.DataKeyNames = new string[] { "bookcaseID" };
            bindCase();
        }
        else
            Response.Write("<script>alert('此书架拥有图书，不可以删除！')</script>");
    }
    protected void Bookcase_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Bookcase.PageIndex = e.NewPageIndex;                //设置当前页的索引
        Bookcase.DataBind();
    }
}