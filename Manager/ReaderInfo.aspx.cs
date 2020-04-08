using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Manager_ReaderInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            bindReaderInfo();
            Label4.Text = (String)Session["userName"];
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }
    }
    public void bindReaderInfo()
    {
        string sql = "select * from tb_readerInfo ";
        gvReaderInfo.DataSource = dataOperate.getDataset(sql, "tb_readerInfo");
        gvReaderInfo.DataKeyNames = new string[] { "readerBarCode" };
        gvReaderInfo.DataBind();
    }

    protected void gvReaderInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvReaderInfo.DataKeys[e.RowIndex].Value.ToString();   //获取读者编号
        string sqlSel = "select count(*) from tb_bookBorrow where readerBarcode='" + id + "'";
        //调用公共类中判断指定数据是否存在的方法函数seleSQL，判断该读者是否有未归还图书
        if (dataOperate.seleSQL(sqlSel) > 0)
        {
            Response.Write("<script>alert('不可以删除该读者，该读者图书还未归还')</script>"); //提示有未还图书，不能删除。
        }
        else
        {
            string sqlDel = "delete tb_readerInfo where readerBarCode='" + id + "'";
            dataOperate.execSQL(sqlDel);  //调用公共类中通用数据更新、插入和删除操作方法函数execSQL，删除此读者。 
            bindReaderInfo();
        }
    }
    protected void gvReaderInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   //设置读者类型
            string readerType = e.Row.Cells[4].Text.ToString();               //获取类型编号
            string typeSql = "select * from tb_readerType where id=" + readerType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 //读取一条记录
            e.Row.Cells[4].Text = typeSdr["type"].ToString();


            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='#F1F1F1'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
        }
    }
    protected void gvReaderInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReaderInfo.PageIndex = e.NewPageIndex;
        gvReaderInfo.DataBind();
    }
}