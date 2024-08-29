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
        SchoolTableAdapters.MajorTableAdapter maj=new SchoolTableAdapters.MajorTableAdapter();
        majorList.DataSource=maj.GetMajorList();
        majorList.DataBind();
    }
    public string GetFacultyName(int FacID)
    {
        SchoolTableAdapters.FacultyTableAdapter f = new SchoolTableAdapters.FacultyTableAdapter();
        string  facName=" ";
        try
        {
            facName = f.GetDataByFaculty(FacID)[0].FacName;
        }
        catch
        {
            facName = "Deleted record";
        }
        return facName;
    }
}