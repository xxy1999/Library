using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Super_Manager_Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            bindUser();
            Label4.Text = (String)Session["userName"];

        }
        else
        {
            Response.Redirect("../Login.aspx");
        }
    }
    public void bindUser()
    {
        string sql = "select * from tb_user";
        GridView1.DataSource = dataOperate.getDataset(sql, "tb_user");
        GridView1.DataKeyNames = new string[] { "userId" };
        GridView1.DataBind();   
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        string sql = "delete from tb_user where userId=" + id;
        dataOperate.execSQL(sql);
        GridView1.DataBind();
        
        Response.Write("<script>alert('删除成功！')</script>");
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;              //设置当前页的索引
        GridView1.DataBind();                             //重新绑定GridView控件
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.Cells[3].Text == "True")
            {

                e.Row.Cells[3].Text = "是";
            }
            else
                e.Row.Cells[3].Text = "否";
        }
    }
}