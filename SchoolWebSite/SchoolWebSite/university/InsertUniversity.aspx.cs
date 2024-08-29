using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class university_InsertUniversity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.UniversityTableAdapter uni=new SchoolTableAdapters.UniversityTableAdapter();
        uni.InsertUniversity(txtUniversityName.Text);
        Response.Redirect("/university/UniversityList.aspx");
    }
}