using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Academic_Student_Leave_Reason : System.Web.UI.Page
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
            fillgrid();
        }
    }

    public void fillgrid()
    {
        DataTable dt = new DataTable();

        dt = objfun.FillDataTable("SELECT Employee_Master.empName + ' ' + Employee_Master.MiddelName + ' ' + Employee_Master.lastName AS EmployeeName,  ISNULL(Employee_Master_1.empName + ' ' + Employee_Master_1.MiddelName + ' ' + Employee_Master_1.lastName, 'N/A') AS UpdatedEmployeeName, Student_Leave_Reason.ID, Student_Leave_Reason.LeaveReason,  CONVERT(VARCHAR, Student_Leave_Reason.EntryDate, 106) AS EntryDate, ISNULL(CONVERT(VARCHAR, Student_Leave_Reason.UpdatedEntryDate, 106), 'N/A') AS UpdatedEntryDate, Student_Leave_Reason.Entryby,  Student_Leave_Reason.Urgent, Student_Leave_Reason.LeaveType, Student_Leave_Reason.LeaveTypeName FROM Employee_Master INNER JOIN Student_Leave_Reason ON Employee_Master.empId = Student_Leave_Reason.Entryby LEFT OUTER JOIN Employee_Master AS Employee_Master_1 ON Student_Leave_Reason.UpdatedEntryBy = Employee_Master_1.empId " + Condition() + "");
        if (dt.Rows.Count > 0)
        {
            gridview.DataSource = dt;
            gridview.DataBind();

        }
        else
        {
            gridview.DataSource = null;
            gridview.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string value = "";
         if (ddlleaveType.SelectedValue == "0")
    {
        objfun.MsgBox("Please Select Leave Type", this);
        ddlleaveType.Focus();
        return;
    }

        if (txtleaveReason.Text == "")
        {
            objfun.MsgBox("Please Enter Leave Reason ", this);
            txtleaveReason.Focus();
            return;
        }

        if (chkurgent.Checked == true)
        {
            value = "Yes";
        }
        else
        {
            value = "No";
        }
 
        if (btnSave.Text == "Submit")
        {

            string LeaveReason = objfun.Get_details("select LeaveReason from Student_Leave_Reason where LeaveReason='" + txtleaveReason.Text + "'");

            int mobcount = Convert.ToInt32(objfun.Get_details("select count(*) from Student_Leave_Reason where LeaveReason='" + txtleaveReason.Text + "'"));

            if (mobcount > 0)
            {
                fillgrid();
                objfun.MsgBox("This LeaveReason alredy assign. ", this);
                txtleaveReason.Text = "";
                return;
            }
            int insert = objfun.ExecuteDML("INSERT INTO Student_Leave_Reason " + "(LeaveType, LeaveTypeName,LeaveReason, Entryby, EntryDate, Urgent) " + "VALUES ('" + ddlleaveType.SelectedValue + "','" + ddlleaveType.SelectedItem.Text + "', '" + txtleaveReason.Text + "', '" + Session["UID"] + "', '" + DateTime.Now + "', '" + value + "')");

             if (insert > 0)
            {
                objfun.MsgBox("Leave Reason Submited Successfully...", this);
                fillgrid();
                Reset();
                return;
            }
        }

        else
        {
            if (btnSave.Text == "Update")
            {

                string LeaveReason = objfun.Get_details("select LeaveReason from Student_Leave_Reason where LeaveReason='" + txtleaveReason.Text + "'");

                int mobcount = Convert.ToInt32(objfun.Get_details("select count(*) from Student_Leave_Reason where LeaveReason='" + txtleaveReason.Text + "'"));

                if (mobcount > 0)
                {
                    fillgrid();
                    objfun.MsgBox("This LeaveReason alredy assign. ", this);
                    txtleaveReason.Text = "";
                    return;
                }

                int Updatecount = objfun.ExecuteDML("UPDATE Student_Leave_Reason SET LeaveReason = '" + txtleaveReason.Text + "', UpdatedEntryBy ='" + Session["UID"] + "',UpdatedEntryDate='" + DateTime.Now + "'  WHERE ID='" + hdnID.Value + "'");
                if (Updatecount > 0)
                {
                    fillgrid();
                    objfun.MsgBox("Leave Reason Update Successfully...", this);
                    Reset();
                    return;
                }
            }

        }
    }
    
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    public void Reset()
    {
        txtleaveReason.Text = "";
        btnSave.Text = "Submit";
        chkurgent.Checked = false;
        ddlleaveType.SelectedIndex = 0;
    }
    
    
    protected void lnkPM_Click(object sender, EventArgs e)
    {

        LinkButton lnk = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lnk.NamingContainer;

        string ID = gridview.DataKeys[row.RowIndex].Values[0].ToString();
        hdnID.Value = ID;

        DataTable dtedit = new DataTable();

        dtedit = objfun.FillDataTable("Select * from Student_Leave_Reason where ID='" + ID + "' ");
        if (dtedit.Rows.Count > 0)
        {

            txtleaveReason.Text = dtedit.Rows[0]["LeaveReason"].ToString();
            btnSave.Text = "Update";
        }
    }
    
    private string Condition()
    { 
        string Where = "";

        if (ddlleaveType.SelectedValue != "" && ddlleaveType.SelectedValue != "0")
        {
            if (Where == "")
            {
                Where = "LeaveType='" + ddlleaveType.SelectedValue + "'";
            }
        }

        if (Where != "")
        {
            Where = "where " + Where;
        }
        else
        {
            Where = "";
        }
        return Where;
    }


    protected void ddlleaveType_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillgrid();
    }
}