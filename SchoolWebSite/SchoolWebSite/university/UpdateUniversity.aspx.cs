using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class university_UpdateUniversity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack) 
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());

            SchoolTableAdapters.UniversityTableAdapter uni=new SchoolTableAdapters.UniversityTableAdapter();
            string uniName = uni.GetDataByUniversity(id)[0].UniName;
            txtUniversityName.Text = uniName;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        SchoolTableAdapters.UniversityTableAdapter uni = new SchoolTableAdapters.UniversityTableAdapter();
        uni.UpdateUniversity(txtUniversityName.Text, id);
        Response.Redirect("/university/UniversityList.aspx");
    }
}