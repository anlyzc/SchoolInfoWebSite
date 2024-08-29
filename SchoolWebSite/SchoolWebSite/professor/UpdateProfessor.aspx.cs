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
            SchoolTableAdapters.ProfessorTableAdapter pro=new SchoolTableAdapters.ProfessorTableAdapter();
            SchoolTableAdapters.MajorTableAdapter maj=new SchoolTableAdapters.MajorTableAdapter();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int majorID = pro.GetDataByProfessor(id)[0].MajorID;
            string professorName = pro.GetDataByProfessor(id)[0].ProfName;
            string majorName = maj.GetDataByMajor(majorID)[0].MajorName;

            txtProfessorName.Text = professorName;
            majorCombo.Items.Clear();
            majorCombo.DataSource = maj.GetMajorList();
            majorCombo.DataTextField = "MajorName";
            majorCombo.DataValueField = "MajorID";
            majorCombo.DataBind();

            majorCombo.SelectedIndex= majorCombo.Items.IndexOf(majorCombo.Items.FindByText(majorName));

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SchoolTableAdapters.ProfessorTableAdapter s = new SchoolTableAdapters.ProfessorTableAdapter();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int majId = Convert.ToInt32(majorCombo.SelectedItem.Value);
        s.UpdateProfessor(txtProfessorName.Text, majId, id);
        Response.Redirect("/professor/ProfessorList.aspx");
    }
}