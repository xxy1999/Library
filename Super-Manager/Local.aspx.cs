using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Super_Manager_Local : System.Web.UI.Page
{
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
}