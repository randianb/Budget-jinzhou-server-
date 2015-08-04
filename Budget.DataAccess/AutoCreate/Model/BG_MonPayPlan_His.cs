//============================================================
// Producnt name:		Auto Generate
// Version: 			1.0
// Coded by:			Wu Di (wd_kk@qq.com)
// Auto generated at: 	2014/11/9 15:51:43
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace BudgetWeb.Model
{
	
	[Serializable()]
	public class BG_MonPayPlan_His
	{
	
		private int mPPHis; 
		private int pIID;
		private decimal mPFunding;
		private int deptID;
		private DateTime mPTime;
		private string mPRemark = String.Empty;
		private int cPID;
		private DateTime mPPHisTime;
		private decimal mPFundingAdd;
		private int mPFundingAddTimes;

		
		public BG_MonPayPlan_His() { }
		
		
		public int MPPHis
		{
			get { return this.mPPHis; }
			set { this.mPPHis = value; }
		}
		
        
		
		
		
		public int PIID
		{
			get { return this.pIID; }
			set { this.pIID = value; }
		}		
		
		
		public decimal MPFunding
		{
			get { return this.mPFunding; }
			set { this.mPFunding = value; }
		}		
		
		
		public int DeptID
		{
			get { return this.deptID; }
			set { this.deptID = value; }
		}		
		
		
		public DateTime MPTime
		{
			get { return this.mPTime; }
			set { this.mPTime = value; }
		}		
		
		
		public string MPRemark
		{
			get { return this.mPRemark; }
			set { this.mPRemark = value; }
		}		
		
		
		public int CPID
		{
			get { return this.cPID; }
			set { this.cPID = value; }
		}		
		
		
		public DateTime MPPHisTime
		{
			get { return this.mPPHisTime; }
			set { this.mPPHisTime = value; }
		}		
		
		
		public decimal MPFundingAdd
		{
			get { return this.mPFundingAdd; }
			set { this.mPFundingAdd = value; }
		}		
		
		
		public int MPFundingAddTimes
		{
			get { return this.mPFundingAddTimes; }
			set { this.mPFundingAddTimes = value; }
		}		
		
	}
}
