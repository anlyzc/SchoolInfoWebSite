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
            SchoolTableAdapters.FacultyTableAdapter uni = new SchoolTableAdapters.FacultyTableAdapter();
            facultyCombo.Items.Clear();
            facultyCombo.Items.Add(new ListItem("Choose a faculty", " "));
            facultyCombo.AppendDataBoundItems = true;
            facultyCombo.DataSource = uni.GetFacultyList();
            facultyCombo.DataTextField = "FacName";
            facultyCombo.DataValueField = "FacID";
            facultyCombo.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.MajorTableAdapter m = new SchoolTableAdapters.MajorTableAdapter();
        int facId = Convert.ToInt32(facultyCombo.SelectedItem.Value);
        m.InsertMajor(txtMajorName.Text, facId);
        Response.Redirect("/major/MajorList.aspx");
    }
}