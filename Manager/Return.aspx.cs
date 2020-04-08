using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Manager_Return : System.Web.UI.Page
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
        string readerBarCode = txtReaderBarCode.Text;            //获取读者编号
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

    protected void btnBookSearch_Click(object sender, EventArgs e)
    {
        //if (Convert.ToInt32(txtNum.Text.Trim()) > 0)                //判断读者是否还可以借书        
        //{
        if (txtBookBarCode.Text.Trim() != "")                    //判断图书条形码是否为空
        {
            string readerBarCode = txtReaderBarCode.Text;
            string bookBarCode = txtBookBarCode.Text;         //获取图书条形码
            string sql = "select b.bookBarcode,b.bookName,c.typeName,b.borrowTime,b.returnTime,c.borrowDay,c.hire,c.lagMoney,b.readerName from tb_bookBorrow b,tb_bookType c,tb_bookInfo a where a.bookType=c.typeID and a.bookBarCode=b.bookBarCode and b.bookBarCode='" + bookBarCode + "' and readerBarCode='" + readerBarCode + "' and b.isReturn='0'"; //定义查询图书语句
            DataSet ds = dataOperate.getDataset(sql, "tb_bookBorrow");  //调用公共类中getDataSet方法，将查询结果返回给DataSet对象
            if (ds.Tables[0].Rows.Count > 0)   //查询结果非空
            {
                gvBookReturn.DataSource = ds;              //获取数据源
                gvBookReturn.DataKeyNames = new string[] { "bookBarCode" };     //设置主键
                gvBookReturn.DataBind();                  //绑定GridView控件
            }
            else
                Response.Write("<script>alert('图书条形码错误！')</script>");
        }
        else
        {
            Response.Write("<script>alert('图书条形码不能为空！')</script>");
        }
    }
    //else
    //{
    //    Response.Write("<script>alert('借阅数量已满！不可以再借阅！')</script>");
    //}
    protected void gvBookReturn_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string bookBarCode = gvBookReturn.DataKeys[e.NewSelectedIndex].Value.ToString();  //获取选中图书条形码
        DateTime returnDate = Convert.ToDateTime(gvBookReturn.Rows[e.NewSelectedIndex].Cells[4].Text);  //获取应还日期
        DateTime todayDate = DateTime.Now.Date;   //获取当前日期
        TimeSpan ts = todayDate - returnDate;        //计算超期天数
        int daysDate = ts.Days;
        //计算租金和滞纳金
        string strLagMoney = gvBookReturn.Rows[e.NewSelectedIndex].Cells[7].Text;
        int lagMoney = Convert.ToInt32(strLagMoney);  //.Substring(0, strLagMoney.Length - 5));
        string strHire = gvBookReturn.Rows[e.NewSelectedIndex].Cells[6].Text;
        int hire = Convert.ToInt32(strHire);//.Substring(0, strHire.Length - 5));
        string hint = "";
        string[] sqlT;
        int i = 0;
        if (daysDate > 0)   //存在超期情况
        {
            sqlT = new string[3];
            //更新读者余额
            sqlT[i++] = "update tb_readerInfo set money=money - " + lagMoney * daysDate + " where readerBarCode = '" + txtReaderBarCode.Text + "' ";
            hint = "您的图书归还期已过" + daysDate + "天，将扣除滞纳金" + lagMoney * daysDate + "元。";
        }
        else  //存在超期情况
        {
            sqlT = new string[2];
        }
        sqlT[i++] = "update tb_bookInfo set stock=stock+1 where bookBarCode='" + bookBarCode + "'"; //定义SQL语句，更新图书库存数
        //定义SQL语句，删除借书记录
        sqlT[i] = "delete tb_bookBorrow  where bookBarCode='" + bookBarCode + "' and  readerBarCode='" + txtReaderBarCode.Text + "' ";
        //调用公共类中的execTransaction方法执行事务
        if (dataOperate.execTransaction(sqlT)) //事务执行成功
        {
            bindReaderInfo();     //调用自定义方法显示已借阅未归还图书信息
            Response.Write("<script>alert('图书归还成功！" + hint + "')</script>");
        }
        else
        {
            Response.Write("<script>alert('图书归还失败！')</script>");
        }
    }

    private void bindReaderInfo()
    {
        string readerBarCode = txtReaderBarCode.Text;            //获取读者编号
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
}