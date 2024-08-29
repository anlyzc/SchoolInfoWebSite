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
            SchoolTableAdapters.StudentTableAdapter stu=new SchoolTableAdapters.StudentTableAdapter();
            SchoolTableAdapters.MajorTableAdapter maj=new SchoolTableAdapters.MajorTableAdapter();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int majorID = stu.GetDataByStudent(id)[0].MajorID;
            string studentName = stu.GetDataByStudent(id)[0].StuName;
            string majorName = maj.GetDataByMajor(majorID)[0].MajorName;

            txtStudentName.Text = studentName;
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
        SchoolTableAdapters.StudentTableAdapter s = new SchoolTableAdapters.StudentTableAdapter();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int majId = Convert.ToInt32(majorCombo.SelectedItem.Value);
        s.UpdateStudent(txtStudentName.Text, majId, id);
        Response.Redirect("/student/StudentList.aspx");
    }
}