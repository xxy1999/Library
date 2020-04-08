using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Manager_Change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            txtUserName.Text = Session["userName"].ToString();
            Label4.Text = (String)Session["userName"];
        }
        else
        {
            Response.Redirect("../Login.aspx");            //返回到登录页面
        }     
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sql = "select * from tb_user where userName='" + Session["userName"].ToString() + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        if (txtOldPass.Text == sdr["userPwd"].ToString())
        {
            string upSql = "update tb_user set userPwd='" + txtNewPass.Text + "' where userName='" + Session["userName"].ToString() + "'";
            if (dataOperate.execSQL(upSql))
            {
                Response.Write("<script>alert('更新成功！')</script>");
            }
            else
                Response.Write("<script>alert('更新失败！')</script>");
        }
        else
            Response.Write("<script>alert('原始密码输入错误')</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtOldPass.Text = null;
        txtNewPass.Text = null;
        txtPass.Text = null;
    }
}