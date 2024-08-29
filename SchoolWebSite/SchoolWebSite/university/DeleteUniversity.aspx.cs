using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class university_DeleteUniversity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        SchoolTableAdapters.UniversityTableAdapter uni=new SchoolTableAdapters.UniversityTableAdapter();
        uni.DeleteUniversity(id);
        Response.Redirect("/university/UniversityList.aspx");
    }
}