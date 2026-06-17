using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_WebView_DataSheet : System.Web.UI.Page
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
            DataTable studentdetails = objfun.FillDataTable(" SELECT TOP (1) StudentStatus.StudentID, StudentStatus.SessionID, StudentStatus.SemesterID, StudentStatus.Status, StudentStatus.CourseID, StudentReg.Specialization FROM   StudentStatus INNER JOIN   StudentReg ON StudentStatus.StudentID = StudentReg.StudentID WHERE (StudentStatus.Status = 'C') AND (StudentStatus.StudentID = '" + Session["UID"] + "')");

            if (studentdetails.Rows.Count > 0)
            {
                objfun.FillDropdownlist(ddlExamName, "ExamName", "ExamName", "SELECT DISTINCT ExamName FROM Subject_Child_New INNER JOIN BackPaperScheduling ON Subject_Child_New.SubjectID = BackPaperScheduling.SubjectId AND Subject_Child_New.SemesterID = BackPaperScheduling.SemesterId AND Subject_Child_New.CourseID = BackPaperScheduling.CourseId AND Subject_Child_New.SpecilizationID = BackPaperScheduling.SpecilisationId INNER JOIN Subject_Mast ON Subject_Child_New.SubjectID = Subject_Mast.SubjectID WHERE Subject_Child_New.SemesterID='" + studentdetails.Rows[0]["SemesterID"] + "' AND Subject_Child_New.CourseID='" + studentdetails.Rows[0]["CourseID"] + "' AND Subject_Child_New.Active=1 AND Subject_Mast.SubjectType=1 AND Subject_Child_New.SpecilizationID='" + studentdetails.Rows[0]["Specialization"] + "' AND Subject_Child_New.SessionID='" + studentdetails.Rows[0]["SessionID"] + "' AND BackPaperScheduling.Date >= GETDATE()", "--Select Exam Name--");

                if (ddlExamName.Items.Count <= 1)
                {
                    objfun.MsgBox1("Your request can no longer be processed due to not receiving the exam date of your upcoming exam...!!", UpdatePanel1);
                }
            }
        }
    }

    public void FillHeader()
    {
        DataTable ViewDetail = new DataTable();

        DataTable studentdetails = objfun.FillDataTable(" SELECT TOP (1) StudentStatus.StudentID, StudentStatus.SessionID, StudentStatus.SemesterID, StudentStatus.Status, StudentStatus.CourseID, StudentReg.Specialization FROM StudentStatus INNER JOIN StudentReg ON StudentStatus.StudentID = StudentReg.StudentID WHERE (StudentStatus.Status = 'C') AND (StudentStatus.StudentID = '" + Session["UID"] + "')");

        if (studentdetails.Rows.Count > 0)
        {
            ViewDetail = objfun.FillDataTable(" SELECT DISTINCT Subject_Mast.SubjectName, Subject_Mast.SubjectCode, BackPaperScheduling.ExamName, convert(nvarchar(12), BackPaperScheduling.Date,106) AS Date, BackPaperScheduling.Date AS Date1, BackPaperScheduling.SubjectId, Subject_Child_New.SemesterID, Subject_Child_New.SpecilizationID, Subject_Child_New.CourseID, Subject_Child_New.SessionID, Subject_Child_New.InstituteID, (BackPaperScheduling.Time + '-' + BackPaperScheduling.EndTime) AS Timing, BackPaperScheduling.SemesterId AS Expr1 FROM Subject_Child_New INNER JOIN BackPaperScheduling ON Subject_Child_New.SubjectID = BackPaperScheduling.SubjectId AND Subject_Child_New.SemesterID = BackPaperScheduling.SemesterId AND Subject_Child_New.CourseID = BackPaperScheduling.CourseId AND Subject_Child_New.SpecilizationID = BackPaperScheduling.SpecilisationId INNER JOIN Subject_Mast ON Subject_Child_New.SubjectID = Subject_Mast.SubjectID INNER JOIN StudentStatus ON StudentStatus.StudentID = '" + Session["UID"] + "' INNER JOIN StudentReg ON StudentReg.StudentID = StudentStatus.StudentID WHERE StudentStatus.Status IN ('C') AND StudentReg.InstituteID = '" + Session["instID"].ToString() + "' AND StudentStatus.StudentID = '" + Session["UID"] + "' AND Subject_Child_New.SemesterID='" + studentdetails.Rows[0]["SemesterID"] + "' AND Subject_Child_New.CourseID='" + studentdetails.Rows[0]["CourseID"] + "' AND Subject_Child_New.SpecilizationID='" + studentdetails.Rows[0]["Specialization"] + "' AND Subject_Child_New.SessionID='" + studentdetails.Rows[0]["SessionID"] + "' AND Subject_Child_New.Active=1 AND Subject_Mast.SubjectType=1 AND BackPaperScheduling.ExamName='" + ddlExamName.SelectedItem.Text + "' ORDER BY Date1 ");

            //if (ViewDetail.Rows.Count > 0)
            //{
            //    lblDate.Text = ViewDetail.Rows[0]["Date"].ToString().ToUpper();
            //    lblTiming.Text = ViewDetail.Rows[0]["Timing"].ToString().ToUpper();
            //    lblCourseCode.Text = ViewDetail.Rows[0]["SubjectCode"].ToString().ToUpper();
            //    lblCourseName.Text = ViewDetail.Rows[0]["SubjectName"].ToString().ToUpper();
            //}

            if (ViewDetail.Rows.Count > 0)
            {
                string dates = "";
                string timings = "";
                string codes = "";
                string names = "";

                foreach (DataRow row in ViewDetail.Rows)
                {
                    dates += "• " + row["Date"].ToString() + "<br/>";
                    timings += "• " + row["Timing"].ToString() + "<br/>";
                    codes += "• " + row["SubjectCode"].ToString() + "<br/>";
                    names += "• " + row["SubjectName"].ToString() + "<br/>";
                }

                lblDate.Text = dates;
                lblTiming.Text = timings;
                lblCourseCode.Text = codes;
                lblCourseName.Text = names;
            }
            else
            {
                
                objfun.MsgBox1("No record found to display..!!", UpdatePanel1);
                return;
                 
            }
        }
    }

    
    protected void ddlExamName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlExamName.SelectedIndex > 0)  
        {
            div_DateSheet.Visible = true;
            FillHeader();
        }
        else
        {
            div_DateSheet.Visible = false;
        }
    }
}

 
    
