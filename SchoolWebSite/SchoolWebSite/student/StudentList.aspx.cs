using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class university_UniversityList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SchoolTableAdapters.StudentTableAdapter st=new SchoolTableAdapters.StudentTableAdapter();
        studentList.DataSource=st.GetStudentList();
        studentList.DataBind();
    }
    public string GetMajorName(int MajorID)
    {
        SchoolTableAdapters.MajorTableAdapter m = new SchoolTableAdapters.MajorTableAdapter();
        string  majName=" ";
        try
        {
            majName = m.GetDataByMajor(MajorID)[0].MajorName;
        }
        catch
        {
            majName = "Deleted record";
        }
        return majName;
    }
}