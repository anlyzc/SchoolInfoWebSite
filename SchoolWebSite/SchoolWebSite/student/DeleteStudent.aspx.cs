using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_DeleteStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        SchoolTableAdapters.StudentTableAdapter stu = new SchoolTableAdapters.StudentTableAdapter();
        stu.DeleteStudent(id);
        Response.Redirect("/student/StudentList.aspx");
    }
}