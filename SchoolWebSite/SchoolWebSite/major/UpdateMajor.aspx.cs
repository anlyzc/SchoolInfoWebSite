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
            SchoolTableAdapters.MajorTableAdapter maj=new SchoolTableAdapters.MajorTableAdapter();
            SchoolTableAdapters.FacultyTableAdapter fac = new SchoolTableAdapters.FacultyTableAdapter();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int facultyID = maj.GetDataByMajor(id)[0].FacID;
            string majorName = maj.GetDataByMajor(id)[0].MajorName;
            string facultyName = fac.GetDataByFaculty(facultyID)[0].FacName;

            txtMajorName.Text = majorName;
            facultyCombo.Items.Clear();
            facultyCombo.DataSource = fac.GetFacultyList();
            facultyCombo.DataTextField = "FacName";
            facultyCombo.DataValueField = "FacID";
            facultyCombo.DataBind();

            facultyCombo.SelectedIndex= facultyCombo.Items.IndexOf(facultyCombo.Items.FindByText(facultyName));

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.MajorTableAdapter m = new SchoolTableAdapters.MajorTableAdapter();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int facId = Convert.ToInt32(facultyCombo.SelectedItem.Value);
        m.UpdateMajor(txtMajorName.Text, facId, id);
        Response.Redirect("/major/MajorList.aspx");
    }
}