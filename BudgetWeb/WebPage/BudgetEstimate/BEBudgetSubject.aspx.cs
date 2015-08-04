﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using BudgetWeb.BLL;

public partial class WebPage_BudgetEstimate_BEBudgetSubject : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && !X.IsAjaxRequest)
        {
            GPDataBind();
        }
    }

    private void GPDataBind()
    {
        //人员部分
        DataTable dt = BG_PreviewDataLogic.GetPersonPart();
        dt.Columns.Add("count");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["count"] = Convert.ToDouble(dt.Rows[i]["PDBaseData"]) + Convert.ToDouble(dt.Rows[i]["PDProjectData"]);
        }
        if (dt.Rows.Count > 0)
        {
            this.Store1.DataSource = dt;
            this.Store1.DataBind();
        }

        //公用部分
        DataTable dt1 = BG_PreviewDataLogic.GetPublicPart();
        dt1.Columns.Add("count");
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            dt1.Rows[i]["count"] = Convert.ToDouble(dt1.Rows[i]["PDBaseData"]) + Convert.ToDouble(dt1.Rows[i]["PDProjectData"]);
        }
        if (dt1.Rows.Count > 0)
        {
            this.Store2.DataSource = dt1;
            this.Store2.DataBind();
        }
        //资本支出
        DataTable dp = BG_PreviewDataLogic.GetCapitalPart();
        if (dp.Rows.Count > 0)
        {
            this.Store3.DataSource = dp;
            this.Store3.DataBind();
        }



        //科目归类部分

        //tpBgSub
        Node nd = new Node();
        nd.Text = "支出经济科目类型";
        nd.Leaf = false;
        tpBgSub.Root.Add(nd);
        tpBgSub.RootVisible = false;
        //tpBgSub.RootVisible = false;


        //BG_PreviewDataLogic
        //Node nd1 = new Node();
        //nd.CustomAttributes.Add

        //1.办公费类
        DataTable dtA1 = BG_PreviewDataLogic.GetOfficePart();
        if (dtA1.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA1);
        }
        //2.三公经费类 
        DataTable dtA2 = BG_PreviewDataLogic.GetToPublishPart();
        if (dtA2.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA2);
        }
        //3.物业费类  
        DataTable dtA3 = BG_PreviewDataLogic.GetHousePart();
        if (dtA3.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA3);
        }
        //4.会议费类 
        DataTable dtA4 = BG_PreviewDataLogic.GetMeetingPart();
        if (dtA4.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA4);
        }
        //5.培训费类 
        DataTable dtA5 = BG_PreviewDataLogic.GetTrainPart();
        if (dtA5.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA5);
        }
        //6.福利费类 
        DataTable dtA6 = BG_PreviewDataLogic.GetWelfarePart();
        if (dtA6.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA6);
        }
        //7.其他类
        DataTable dtA7 = BG_PreviewDataLogic.GetOtherPart();
        if (dtA7.Rows.Count > 0)
        {
            AddExtTreeNode(nd, dtA7);
        }
        if (dtA1.Rows.Count == 0 && dtA2.Rows.Count == 0 && dtA3.Rows.Count == 0 && dtA4.Rows.Count == 0 && dtA5.Rows.Count == 0 && dtA6.Rows.Count == 0 && dtA7.Rows.Count == 0)
        {
            nd.Leaf = true;
        }
    }

    /// <summary>
    /// 返回节点
    /// </summary>
    /// <param name="psType"></param>
    /// <param name="psName"></param>
    /// <param name="psValue"></param>
    /// <returns></returns>
    private void AddExtTreeNode(Node nd, DataTable dt)
    {
        Node nd1 = new Node();
        string typeS = dt.Rows[0]["PSType2"].ToString();
        double PDTotalData = 0;

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Node ndx = new Node();
            ndx.Leaf = true;
            string PSType2 = dt.Rows[i]["PSType2"].ToString();
            string PSName = dt.Rows[i]["PSName"].ToString();

            double db1 = Convert.ToDouble(dt.Rows[i]["PDBaseData"]);
            double db2 = Convert.ToDouble(dt.Rows[i]["PDProjectData"]);
            double PDData = db1 + db2;
            PDTotalData += PDData;
            ConfigItem cf1 = new ConfigItem("PSType2", PSType2, ParameterMode.Value);
            ConfigItem cf2 = new ConfigItem("PSName", PSName, ParameterMode.Value);
            ConfigItem cf3 = new ConfigItem("PDData", PDData.ToString("f8").TrimEnd('0'), ParameterMode.Value);
            ndx.CustomAttributes.Add(cf1);
            ndx.CustomAttributes.Add(cf2);
            ndx.CustomAttributes.Add(cf3);

            nd1.Children.Add(ndx);
        }

        ConfigItem cft1 = new ConfigItem("PSType2", typeS, ParameterMode.Value);
        ConfigItem cft2 = new ConfigItem("PSName", "", ParameterMode.Value);
        ConfigItem cft3 = new ConfigItem("PDData", PDTotalData.ToString("f8").TrimEnd('0'), ParameterMode.Value);
        nd1.CustomAttributes.Add(cft1);
        nd1.CustomAttributes.Add(cft2);
        nd1.CustomAttributes.Add(cft3);

        nd.Children.Add(nd1);
    }
}