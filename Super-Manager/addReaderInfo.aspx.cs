using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class addReaderInfo : System.Web.UI.Page
{
    string barcode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        barcode = Request.QueryString["readerBarCode"].ToString();           //获取对图书操作的方式
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            if (barcode != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改读者信息";
                bindReaderInfo();
            }
            else
            {
                this.Title = "添加读者信息"; 
            }
        }    
    }
    public void bindReaderInfo()
    {
        string sql = "select * from tb_readerInfo  where readerBarCode='" + barcode + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtReaderBarCode.Text = sdr["readerBarCode"].ToString();
        txtPass.Text = sdr["readerPass"].ToString();
        txtReaderName.Text = sdr["readerName"].ToString();
        ddlReaderType.Text = sdr["readerType"].ToString();
        ddlCertificateType.Text = sdr["certificateType"].ToString();
        txtCertificate.Text = sdr["certificate"].ToString();
        txtTel.Text = sdr["tel"].ToString();
        txtEmail.Text = sdr["email"].ToString();
        txtRemark.Text = sdr["remark"].ToString();
        txtMoney.Text = sdr["money"].ToString();
        
        if (sdr["sex"].ToString().Trim() == "男")
        {
            radbtnMan.Checked = true;
        }
        else
        {
            radbtnWoman.Checked = true;
        }
        ddlCertificateType.SelectedValue = sdr["certificateType"].ToString();


    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string readerBarCode = txtReaderBarCode.Text;      //读者编号
        string readerPass = txtPass.Text;                   //登录密码
        string readerName = txtReaderName.Text;           //读者名称
        string sex = "";                                 //性别
        if (radbtnMan.Checked)   { sex = "男"; }
        else { sex = "女"; }
        string readerType = ddlReaderType.Text;    //读者类型
        string certificateType = ddlCertificateType.SelectedValue;  //证书类型
        string certificate = txtCertificate.Text;               //证书编号
        string tel = txtTel.Text;                           //联系电话
        string email = txtEmail.Text;                      //Email地址
        string remark = txtRemark.Text;                   //备注
        double money;                                   //可用余额
        if(txtMoney.Text=="")  money=0;
        else money = Convert.ToDouble(txtMoney.Text);                    
        string sql = "";
        if (barcode == "add")   //增加读者信息
        {
            sql = "insert into tb_readerInfo values('" + readerBarCode + "','"+readerPass+"','" + readerName + "','" + sex + "','" + readerType + "','" + certificateType + "','" + certificate + "','" + tel + "','" + email + "','" + remark + "',"+money+")";
        }
        else   //修改读者信息
        {
            sql = "update tb_readerInfo set readerName='" + readerName + "', sex='" + sex + "',readerType='" + readerType + "', certificateType='" + certificateType + "',certificate='" + certificate + "',tel='" + tel + "',email='" + email + "', remark='" + remark + "',money='" + money + "' where readerBarCode='" + barcode + "'";
        }
//调用公共类中通用数据更新、插入和删除操作方法函数 execSQL()
        if (dataOperate.execSQL(sql))
        {
            Response.Write("<script>alert('保存成功！');window.opener.location.href=window.opener.location='readerInfo.aspx';window.close();</script>");
        }
        else
            Response.Write("<script>alert('保存失败！')</script>"); //提示保存失败
    }
}
