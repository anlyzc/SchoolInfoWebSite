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
            SchoolTableAdapters.UniversityTableAdapter uni = new SchoolTableAdapters.UniversityTableAdapter();
            universityCombo.Items.Clear();
            universityCombo.Items.Add(new ListItem("Choose an university", " "));
            universityCombo.AppendDataBoundItems = true;
            universityCombo.DataSource = uni.GetUniversityList();
            universityCombo.DataTextField = "UniName";
            universityCombo.DataValueField = "UniID";
            universityCombo.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.FacultyTableAdapter f = new SchoolTableAdapters.FacultyTableAdapter();
        int uniId = Convert.ToInt32(universityCombo.SelectedItem.Value);
        f.InsertFaculty(txtFacultyName.Text, uniId);
        Response.Redirect("/faculty/FacultyList.aspx");
    }
}