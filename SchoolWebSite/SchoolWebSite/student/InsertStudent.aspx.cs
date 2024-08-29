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
        if (!IsPostBack)
        {
            SchoolTableAdapters.MajorTableAdapter maj = new SchoolTableAdapters.MajorTableAdapter();
            majorCombo.Items.Clear();
            majorCombo.Items.Add(new ListItem("Choose an major", " "));
            majorCombo.AppendDataBoundItems = true;
            majorCombo.DataSource = maj.GetMajorList();
            majorCombo.DataTextField = "MajorName";
            majorCombo.DataValueField = "MajorID";
            majorCombo.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.StudentTableAdapter f = new SchoolTableAdapters.StudentTableAdapter();
        int majId = Convert.ToInt32(majorCombo.SelectedItem.Value);
        f.InsertStudent(txtStudentName.Text, majId);
        Response.Redirect("/student/StudentList.aspx");
    }
}