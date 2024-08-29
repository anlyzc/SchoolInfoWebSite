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
            SchoolTableAdapters.FacultyTableAdapter fac=new SchoolTableAdapters.FacultyTableAdapter();
            SchoolTableAdapters.UniversityTableAdapter uni=new SchoolTableAdapters.UniversityTableAdapter();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int universityID = fac.GetDataByFaculty(id)[0].UniID;
            string facultyName = fac.GetDataByFaculty(id)[0].FacName;
            string universityName = uni.GetDataByUniversity(id)[0].UniName;

            txtFacultyName.Text = facultyName;
            universityCombo.Items.Clear();
            universityCombo.DataSource = uni.GetUniversityList();
            universityCombo.DataTextField = "UniName";
            universityCombo.DataValueField = "UniID";
            universityCombo.DataBind();

           universityCombo.SelectedIndex= universityCombo.Items.IndexOf(universityCombo.Items.FindByText(universityName));

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.FacultyTableAdapter f = new SchoolTableAdapters.FacultyTableAdapter();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int uniId = Convert.ToInt32(universityCombo.SelectedItem.Value);
        f.UpdateFaculty(txtFacultyName.Text, uniId, id);
        Response.Redirect("/faculty/FacultyList.aspx");
    }
}