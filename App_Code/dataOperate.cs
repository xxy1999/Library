using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// dataOperate 的摘要说明
/// </summary>
public class dataOperate
{
   static SqlConnection  con;
	public dataOperate()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //创建数据库连接
    public static SqlConnection createCon()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryCnnString"].ConnectionString);
        return con;
    }

    //执行数据库的添加删除更新操作
    public static bool execSQL(string sql)
    {
        SqlConnection con = createCon();         //创建数据库连接
        con.Open();         //打开数据库连接
        SqlCommand com = new SqlCommand(sql, con);       //创建SQLCommand对象
        try
        {
            com.ExecuteNonQuery();       //执行SQL语句
        }
        catch (Exception e)
        {
            return false;       //返回布尔值 False
        }
        finally
        {
            con.Close();      //关闭数据库连接
        }
        return true;           //返回布尔值 True
    }
    //查找记录是否存在
    public static int seleSQL(string sql)
    {
        SqlConnection con = createCon();         //创建数据库连接
        con.Open();         //打开数据库连接
        SqlCommand com = new SqlCommand(sql, con);        //创建SqlCommand对象
        try
        {
            return Convert.ToInt32(com.ExecuteScalar());             //返回执行ExecuteScalar方法返回的值
        }
        catch (Exception e)
        {
            return 0;            //返回0
        }
        finally
        {
            con.Close();            //关闭数据库连接
        }
    }
    //返回所有记录
    public static DataSet getDataset(string sql, string table)
    {

        SqlConnection con = createCon();
        con.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        sda.Fill(ds, table);
        return ds;
    }
    //返回一条记录
    public static SqlDataReader getRow(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        return com.ExecuteReader();
    }
    public static bool execTransaction(string[] sql)
    {
        SqlConnection con = createCon();        //创建数据库连接
        SqlTransaction sTransaction = null;        //创建SqlTransaction对象
        try
        {
            con.Open();            //打开数据库连接
            SqlCommand com = con.CreateCommand();            //创建SqlCommand对象
            sTransaction = con.BeginTransaction();            //设置开始事务
            com.Transaction = sTransaction;            //设置需要执行事务
            foreach (string sqlT in sql)
            {
                com.CommandText = sqlT;                //设置SQL语句
                if (com.ExecuteNonQuery() <= 0)                //判断是否执行成功
                {
                    sTransaction.Rollback();                    //设置事务回滚
                    return false;                    //返回布尔值False
                }
            }
            sTransaction.Commit();            //提交事务
            return true;            //返回布尔值True
        }
        catch (Exception ex)
        {
            sTransaction.Rollback();            //设置事务回滚
            return false;            //返回布尔值False
        }
        finally
        {
            con.Close();            //关闭数据库连接
        }
    }
}
