using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Super_Manager_BookBorrowSearch : System.Web.UI.Page
{
    static string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            Label4.Text = (String)Session["userName"];
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string condition = ddlCondition.SelectedValue;
        string key = txtKey.Text;
        sql = "select * from tb_bookBorrow where " + condition + " like '%" + key + "%'";
        bindBookBorrow(sql, getisReturn());

    }

    public void bindBookBorrow(string seSql, string isReturn)
    {
        gvBookBorrow.DataSource = dataOperate.getDataset(seSql + isReturn, "tb_bookBorrow");
        gvBookBorrow.DataBind();
    }

    //自定义方法用来判断图书借还信息并返回
    public string getisReturn()
    {
        if (rdibtnSy.Checked)       //所有图书信息
        {
            return "";
        }
        else if (rdibtn1.Checked)   //以还图书信息
        {
            return "and isReturn = '1'";
        }
        else if (rdibtn0.Checked)  //未还图书信息
        {
            return "and isReturn='0'";
        }
        return "";
    }
    protected void gvBookBorrow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookBorrow.PageIndex = e.NewPageIndex;
        bindBookBorrow(sql, getisReturn());
    }
}
