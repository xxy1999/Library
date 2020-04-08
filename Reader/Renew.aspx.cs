using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Reader_Renew : System.Web.UI.Page
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
    protected void btnReaderSearch_Click(object sender, EventArgs e)
    {
        string readerBarCode = (string)Session["userName"];            //获取读者编号
        string readerSql = "select * from tb_readerInfo where readerBarCode='" + readerBarCode + "'";  //定义查询读者语句
        SqlDataReader sdr = dataOperate.getRow(readerSql);        //获取读者详细信息
        if (sdr.Read())    //读取一条记录
        {
            txtReaderName.Text = sdr["readerName"].ToString();          //显示读者姓名
            txtReaderSex.Text = sdr["Sex"].ToString();                  //显示读者性别
            txtCertificateType.Text = sdr["certificateType"].ToString();     //显示证件类型
            txtCertificate.Text = sdr["certificate"].ToString();             //显示证件号
            string money = sdr["money"].ToString();
            txtMoney.Text = money.Substring(0, money.Length - 2);        //可用余额
            //创建SQL语句在读者类型表中查询符合读者类型编À号的记录
            string readerTypeSql = "select * from tb_readerType where id=" + sdr["readerType"].ToString();
            SqlDataReader typeSdr = dataOperate.getRow(readerTypeSql);  //获取读者类型信息
            typeSdr.Read();                                        //读取一条记录
            txtReaderType.Text = typeSdr["type"].ToString();             //显示读者类型
            int borrowNum = Convert.ToInt32(typeSdr["num"]);           //获取可借图书总数
            //创建SQL语句在图书借阅表中查询符合读者编号条件的读者已借未还图书数
            string selSql = "select count(*) from tb_bookBorrow where readerBarCode='" + readerBarCode + "' ";
            int alreadyNum = dataOperate.seleSQL(selSql);                //获取图书已借未还数
            txtNum.Text = Convert.ToString(borrowNum - alreadyNum);     //显示还可以借阅数
            btnBookSearch.Enabled = true;
        }
        else
            Response.Write("<script>alert('读者编号输入错误!')</script>");
    }

    public void bindGridView(string sql)
    {

        gvBookRenewal.DataSource = dataOperate.getRow(sql);              //获取数据源
        gvBookRenewal.DataKeyNames = new string[] { "bookBarCode" };    //设置主键
        gvBookRenewal.DataBind();                                       //绑定GridView控件

    }
    protected void btnBookSearch_Click(object sender, EventArgs e)
    {
        if (txtBookBarCode.Text.Trim() != "")                           //判断图书条形码是否为空
        {
            string bookBarCode = txtBookBarCode.Text;                   //获取图书条形码
            //创建SQL语句在图书借阅表中查询符合读者条形码条件和图书条形码条件未归还图书的记录
            string sql = "select * from tb_bookBorrow where bookBarCode='" + bookBarCode + "'and readerBarCode='" + Session["userName"] + "'and isReturn='0'";
            bindGridView(sql);                                          //调用自定义方法显示已借阅未归还图书信息                        
        }
        else
        {
            Response.Write("<script>alert('图书条形码不能为空')</script>");
        }
    }


    protected void gvBookRenewal_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取当前图书条形码
        string bookBarCode = gvBookRenewal.DataKeys[e.NewSelectedIndex].Value.ToString();
        //创建SQL语句使用内联接连接条件为图书类型编号，查询条件为符合图书条形码的记录
        string sql = "select * from tb_bookInfo as a inner join tb_bookType as b on a.bookType=typeID where a.bookBarCode='" + bookBarCode + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                                     //读取一条记录
        int borrowDay = Convert.ToInt32(sdr["borrowDay"]);                              //获取可借图书天数
        string returnTime = DateTime.Now.Date.AddDays(borrowDay).ToShortDateString();   //获取应还图书天数
        //创建SQL语句更新图书借阅信息表中应还图书天数
        string updateSql = "update tb_bookBorrow set returnTime='" + returnTime + "' where bookBarCode='" + bookBarCode + "'and readerBarCode='" + Session["userName"] + "' and isReturn='0' ";
        if (dataOperate.execSQL(updateSql))                                             //判断更新是否成功
        {
            Response.Write("<script>alert('续借成功！')</script>");
            //创建SQL语句在图书借阅表中查询符合读者条形码条件和图书条形码条件的未归还图书的记录
            string selSql = "select * from tb_bookBorrow where bookBarCode='" + bookBarCode + "'and readerBarCode='" + Session["userName"] + "'and isReturn='0'";
            bindGridView(selSql);
        }
        else
        {
            Response.Write("<script>alert('续借失败！')</script>");
        }
    }
}