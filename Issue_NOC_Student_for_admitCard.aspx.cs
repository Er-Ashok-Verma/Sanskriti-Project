using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Examination_Issue_NOC_Student_for_admitCard : System.Web.UI.Page
{
    DbFunctions objfun = new DbFunctions();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("../error_404_2.html");
        }

        if (Session["instID"].ToString() == null)
        {
            Response.Redirect("../error_404_2.html");
        }

        if (Session["SesnID"].ToString() == null)
        {
            Response.Redirect("../error_404_2.html");
        }

        if (!IsPostBack)
        {
            if (Context.Request.QueryString["title"] != null)
            {
                lbltitle.InnerText = Context.Request.QueryString["title"].ToString();
            }
            objfun.FillDropdownlist(ddlSession, "Session", "SessionID", "SELECT SessionID, Session FROM Session", "--Select--");
            objfun.FillDropdownlist(ddlProgramName, "CourseName", "CourseId", " SELECT DISTINCT CourseName, Course.CourseId FROM Course", "--Select--");
           
        } 
    }
    
    protected void ddlProgramName_SelectedIndexChanged(object sender, EventArgs e)
    {

        objfun.FillDropdownlist(ddlSpecialization, "SpecilisationName", "SpecilisationID", " SELECT distinct Course_spl.Courseid, Specilisation.SpecilisationID, Specilisation.SpecilisationName FROM Course_spl INNER JOIN Specilisation ON Course_spl.SpecilizationID = Specilisation.SpecilisationID WHERE Course_spl.Courseid = '" + ddlProgramName.SelectedValue + "'", "--Select--");
        objfun.FillDropdownlist(ddlsem, "CourseYear", "SID", "SELECT DISTINCT Year + '-' + CourseYear + '' + '(' + Batch + ')' AS CourseYear, SID FROM Semester_View WHERE Semester_View.CourseID = '" + ddlProgramName.SelectedValue + "'", "---Select---");
        objfun.FillDropdownlist(ddlExameName, "Title_Name", "id", "SELECT id, Title_Name FROM ExamForm_Scheduler WHERE (ExamForm_Scheduler.Status = 'active')  and ExamForm_Scheduler.CourseID = '" + ddlProgramName.SelectedValue + "'  and ExamForm_Scheduler.Session = '" + ddlSession.SelectedIndex + "'", "---Select---");
    }
   
}