using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class professor_DeleteProfessor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        SchoolTableAdapters.ProfessorTableAdapter stu = new SchoolTableAdapters.ProfessorTableAdapter();
        stu.DeleteProfessor(id);
        Response.Redirect("/professor/ProfessorList.aspx");
    }
}