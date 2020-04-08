using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ReaderType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            bindReaderType();
            Label4.Text = (String)Session["userName"];
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }
    }
    public void bindReaderType()
    {
        string sql = "select * from tb_readerType";
        gvReaderType.DataSource = dataOperate.getDataset(sql, "tb_readerType");
        gvReaderType.DataKeyNames = new string[] { "id" };
        gvReaderType.DataBind();
    }
    protected void ReaderType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvReaderType.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from tb_readerInfo where readerType=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete tb_readerType where id=" + id;
            dataOperate.execSQL(sql);
            bindReaderType();
        }
        else
            Response.Write("<script>alert('不可以删除该类型，有该类型的读者图书未归还')</script>");

    }
    protected void ReaderType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReaderType.PageIndex = e.NewPageIndex;
        gvReaderType.DataBind();
    }
}