using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class university_UniversityList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SchoolTableAdapters.UniversityTableAdapter uni=new SchoolTableAdapters.UniversityTableAdapter();
        universityList.DataSource=uni.GetUniversityList();
        universityList.DataBind();
    }
}