using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class addUser : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["userId"].ToString();
        if (!IsPostBack)
        {

            if (id != "add")
            {
                this.Title = "修改账号信息";
                string sql = "select * from tb_user where userId=" + id;
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtUserName.Text = sdr["userName"].ToString();
                sdr.Close();
                btnSave.Text = "修 改";
            }
            else
                this.Title = "添加账号信息";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string pass = txtPass.Text;
        if (id == "add")
        {
            string sql = "insert into tb_user(userName,userPwd,isSuper) values('" + userName + "','" + pass + "','" + DropDownList1.SelectedValue + "')";
            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script>alert('添加成功！');window.opener.location.href=window.opener.location='Account.aspx';window.close();</script>");
            }
            else
            {
                Response.Write( "<script>alert('设置失败！')</script>");
            }
        }
        else
        {
            string sql = "update tb_user set userName='" + userName + "',userPwd='" + pass + "',isSuper='" + DropDownList1.SelectedValue + "' where userId="+id;
            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script>alert('修改成功！');window.opener.location.href=window.opener.location='Account.aspx';window.close();</script>");
            }
            else
            {
                Response.Write("<script>alert('设置失败！')</script>");
            }
        }     
    }
}
