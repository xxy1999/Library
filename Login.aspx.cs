using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//读配置命名空间
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userName"] = null;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string userName = txtName.Text;    //用户名
        string pwd = txtPwd.Text;     //密码
        String type = ddListType.SelectedValue;
        string sql;

        if (type == "3")   //用户类型为读者，到读者信息表查询指定用户名和密码的记录
        {
            sql = "select count(*) from tb_readerInfo where readerBarCode='" + userName + "' and  readerPass='" + pwd + "'";
            if (dataOperate.seleSQL(sql) > 0)
            {
                Session["userName"] = userName;   //记录登录用户名，页面中传递参数
                Response.Write("<script>alert('读者登录成功！')</script>");
                Response.Redirect("Reader/BookInfoSearch.aspx");   //跳转到读者端页面
            }
            else
                Response.Write("<script>alert('登录失败！')</script>");
        }
        else if (type == "2")  //用户类型为管理员，到管理员信息表查询指定用户名和密码的记录
        {
            sql = "select count(*) from tb_user where userName='" + userName + "' and userPwd='" + pwd + "' and isSuper='0'";
            if (dataOperate.seleSQL(sql) > 0)
            {
                Session["userName"] = userName;  
                Response.Write("<script>alert('管理员登录成功！')</script>");
                Response.Redirect("Manager/Rank.aspx");   //跳转到普通管理员页面
            }
            else
                Response.Write("<script>alert('登录失败！')</script>");
        }
        else if (type == "1")//用户类型为超级管理员，到管理员信息表查询指定用户名和密码的记录
        {
            sql = "select count(*) from tb_user where userName='" + userName + "' and userPwd='" + pwd + "' and isSuper='1'";
            if (dataOperate.seleSQL(sql) > 0)
            {
                Session["userName"] = userName;  //记录登录用户名，页面中传递参数
                Response.Redirect("Super-Manager/Account.aspx");  //跳转到超级管理员页面
                Response.Write("<script>alert('超级管理员登录成功！')</script>");
            }
            else
                Response.Write("<script>alert('登录失败！')</script>");           
        }
        else
            Response.Write("<script>alert('登录失败！')</script>");
    }

}