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
        SchoolTableAdapters.FacultyTableAdapter fa=new SchoolTableAdapters.FacultyTableAdapter();
        facultyList.DataSource=fa.GetFacultyList();
        facultyList.DataBind();
    }
    public string GetUniversityName(int UniID)
    {
        SchoolTableAdapters.UniversityTableAdapter u = new SchoolTableAdapters.UniversityTableAdapter();
        string  uniName=" ";
        try
        {
            uniName = u.GetDataByUniversity(UniID)[0].UniName;
        }
        catch
        {
            uniName = "Deleted record";
        }
        return uniName;
    }
}