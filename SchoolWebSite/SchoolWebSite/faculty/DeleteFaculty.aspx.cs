using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faculty_DeleteFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        SchoolTableAdapters.FacultyTableAdapter fac = new SchoolTableAdapters.FacultyTableAdapter();
        fac.DeleteFaculty(id);
        Response.Redirect("/faculty/FacultyList.aspx");
    }
}