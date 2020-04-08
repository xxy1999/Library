﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class addBookcase : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["bookcaseID"].ToString();
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            //自定义方法绑定书架
            if (id != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改书架信息";
                string sql0 = "select * from tb_bookcase where bookcaseID=" + id;  //调用自定义方法生成条形码
                SqlDataReader sdr = dataOperate.getRow(sql0);
                sdr.Read();
                txtBookcase.Text = sdr["bookcaseName"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加书架信息";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string bookcaseName = txtBookcase.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into tb_bookcase values('" + bookcaseName + "')";
        }
        else
            sql = "update tb_bookcase set bookcaseName='" + bookcaseName + "' where bookcaseID=" + id;

        if (dataOperate.execSQL(sql))   //判断添加或修改是否成功
        {
            Response.Write("<script language=javascript>alert('保存成功！');window.opener.location.href=window.opener.location='bookcaseManage.aspx';window.close();</script>");
        }
        else
        {
            Response.Write("<script>alert('保存失败！')</script>");
        }
    }
}
