<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Leave_Reason.aspx.cs" Inherits="Academic_Student_Leave_Reason" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Leave</title>
    <link href="../assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/light-theme.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />



    <style type="text/css">
        .DivVerticalScroll2 {
            overflow-y: auto;
            height: 400px;
        }

        .grid-center th,
        .grid-center td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <section id=''>
                    <div class=''>
                        <div id='Div1'>
                            <div class='col-sm-12 col-lg-12'>
                                <div class='box'>
                                    <div class='box-header blue-background'>
                                        <div class='title'>
                                            <h4>
                                                <i class="fa fa-bars"></i> Leave Reason
                                                <div id="lbltitle" runat="server" style="display: inline-block;">
                                                </div>
                                            </h4>
                                        </div>
                                    </div>
                                    <div class='col-sm-4 col-lg-4'>
                                        <%--  ............... Exception Error Msg..............--%>
                                        <div class='col-sm-12 form-group-2 ' runat="server" id="ExceptionMsg" style="display: none; font-size: small; color: orangered;"></div>

                                        <div class='box-content'>

                                            <div class='form-group '>

                                                <asp:Label runat="server" ID="Label2" Text="Leave Type" CssClass="FormLable"></asp:Label>
                                                <span class="mandatoryfields">*</span>
                                                <asp:DropDownList ID="ddlleaveType" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlleaveType_SelectedIndexChanged">
                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Leave"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="DayOut"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class='form-group '>
                                                <asp:Label runat="server" ID="Label1" Text="Leave Reason" CssClass="FormLable"></asp:Label>
                                                <span class="mandatoryfields">*</span>
                                                <asp:TextBox ID="txtleaveReason" runat="server" TabIndex="1" class="form-control"></asp:TextBox>
                                            </div>

                                            <asp:CheckBox ID="chkurgent" runat="server" Text="Urgent" AutoPostBack="true" />



                                            <center>
                                            <div class='form-actions form-actions-padding-sm form-actions-padding-md form-actions-padding-lg' style='margin-bottom: 0;'>
                                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click"/>
                                                <asp:Button ID="btnReset" runat="server" CausesValidation="False" CssClass="btn btn-inverse" Text="Reset" OnClick="btnReset_Click"/>
                                                 

                                            </div>
                                                </center>

                                        </div>
                                    </div>

                                    <div class='col-sm-8 col-lg-8'>

                                        <div class='box-content overflow'>
                                            <div class=''>
                                                <h3>Student Leave Reason :-</h3>
                                            </div>
                                            <div class="grid-scroll">

                                                <div style="height: 400px; overflow-y: auto; border: 1px solid #ccc;">

                                                    <asp:GridView ID="gridview" runat="server" AutoGenerateColumns="false" DataKeyNames="ID"
                                                        class="scrollable-area table table-bordered table-striped"
                                                        PageSize="15">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S/N">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Leave Reason">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox2" runat="server" CausesValidation="false" Text='<%# Bind("LeaveReason") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkPM" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Bind("LeaveReason") %>' ForeColor="Black" OnClick="lnkPM_Click">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Leave Type" DataField="LeaveTypeName" />
                                                            <asp:BoundField HeaderText="Entry Date" DataField="EntryDate" />
                                                            <asp:BoundField HeaderText="Entry By" DataField="EmployeeName" />
                                                            <asp:BoundField HeaderText="Updeted Entry Date" DataField="UpdatedEntryDate" />
                                                            <asp:BoundField HeaderText="Updeted Entry By" DataField="UpdatedEmployeeName" />
                                                            <asp:BoundField HeaderText="Urgent" DataField="Urgent" />

                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:HiddenField ID="hdnID" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
