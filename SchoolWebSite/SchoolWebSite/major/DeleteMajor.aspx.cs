using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class major_DeleteMajor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        SchoolTableAdapters.MajorTableAdapter fac = new SchoolTableAdapters.MajorTableAdapter();
        fac.DeleteMajor(id);
        Response.Redirect("/major/MajorList.aspx");
    }
}