<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Issue_NOC_Student_for_admitCard.aspx.cs" Inherits="Examination_Issue_NOC_Student_for_admitCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">   
<head runat="server">
    <title></title>

     <%-- Datatable CSS START--%>
    <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/fixedheader/3.4.0/css/fixedHeader.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <%-- Datatable  CSS END--%>



    <link href="../assets/stylesheets/light-theme.css" media="all" rel="stylesheet" type="text/css" />

    <script src="../JQuery/MessageBox_Function.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
    <script src="sweetalert2.min.js"></script>
    <script src="../js/notify.min.js"></script>

    

    <link href="../assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <link href='../assets/images/meta_icons/favicon.ico' rel='shortcut icon' type='image/x-icon' />
    <link href='../assets/images/meta_icons/apple-touch-icon.png' rel='apple-touch-icon-precomposed' />
    <link href='../assets/images/meta_icons/apple-touch-icon-57x57.png' rel='apple-touch-icon-precomposed' sizes='57x57' />
    <link href='../assets/images/meta_icons/apple-touch-icon-72x72.png' rel='apple-touch-icon-precomposed' sizes='72x72' />
    <link href='../assets/images/meta_icons/apple-touch-icon-114x114.png' rel='apple-touch-icon-precomposed' sizes='114x114' />
    <link href='../assets/images/meta_icons/apple-touch-icon-144x144.png' rel='apple-touch-icon-precomposed' sizes='144x144' />
    <link href="../assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../assets/stylesheets/plugins/common/bootstrap-wysihtml5.css" media="all" rel="stylesheet" type="text/css" />

    <link href="../assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
    `
    <script src="../assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
    <script src="../assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <script src="../js/JScript.js" type="text/javascript"></script>
    <script src="../Scripts/Global.js" type="text/javascript"></script>
    <script language="javascript" src="../datetimepicker.js" type="text/javascript"></script>
    <script src="../FeeJScript.js" type="text/javascript"></script>

     <style type="text/css">
        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

            .gridview-style th {
                background: #dad9d9c2 !important;
                color: #004a8b !important;
                font-weight: 700;
                padding: 2px;
                border: 1px solid #ddd;
            }

            .gridview-style td {
                padding: 4px;
                border: 1px solid #ddd;
            }

            .gridview-style tr {
                border: 1px solid #ddd;
            }
    </style>
</head>
<body>
      <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <section id=''>
                    <div class=''>
                        <div id='Div1'>
                            <div class='col-sm-12 col-lg-12'>
                                <div class='box'>
                                    <div class='box-header blue-background'>
                                        <div class='title'>
                                            <h4 style="color: #fff"><i class="fa fa-bars"> </i>
                                                <div id="lbltitle" runat="server" style="display: inline-block;">
                                                </div>
                                            </h4>
                                        </div>
                                    </div>
                                    <div class='box-content'>
                                        <div class='col-sm-12 col-lg-12'>

                                            <div class='col-sm-12 form-group-2 ' runat="server" id="ExceptionMsg" style="display: none; font-size: small; color: orangered;"></div>
                                           
                                            <div class='row'>

                                                  <div class='col-sm-3 col-lg-2'>
                                                   <div class='form-group' id="div4" runat="server">
                                                        <asp:Label ID="lblsession" runat="server" CssClass="FormLable" Font-Bold="true" Text="Session"></asp:Label>
                                                        <asp:DropDownList ID="ddlSession" runat="server" class="form-control" AutoPostBack="true" >
                                                        </asp:DropDownList>
                                                    </div>
                                                    
                                                </div>

                                                 <div class='col-sm-3 col-lg-2'>
                                                    <div class='form-group' id="div7" runat="server">
                                                        <asp:Label ID="lblProgramName" runat="server" CssClass="FormLable" Font-Bold="true" Text=" Program Name"></asp:Label>
                                                        <asp:DropDownList ID="ddlProgramName" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProgramName_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class='col-sm-3 col-lg-2'>
                                                    <div class='form-group' id="div3" runat="server">
                                                        <asp:Label ID="lblSpecialization" runat="server" CssClass="FormLable" Font-Bold="true" Text="Specialization"></asp:Label>
                                                        <asp:DropDownList ID="ddlSpecialization" runat="server" class="form-control" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                 <div class='col-sm-3 col-lg-2'>
                                                    <div class='form-group' id="div2" runat="server">
                                                        <asp:Label ID="lblSem" runat="server" CssClass="FormLable" Font-Bold="true" Text="Semester"></asp:Label>
                                                        <asp:DropDownList ID="ddlsem" runat="server" class="form-control" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class='col-sm-3 col-lg-2'>
                                                    <div class='form-group' id="divstu" runat="server">
                                                        <asp:Label ID="lblExamName" runat="server" CssClass="FormLable" Font-Bold="true" Text="Exam Name"></asp:Label>
                                                        <asp:DropDownList ID="ddlExameName" runat="server" class="form-control" AutoPostBack="true" >
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                               
                                            </div>
                                            <div class="text-center topMargin">
                                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save"   />

                                                <asp:Button ID="btnreset" runat="server" CssClass="btn btn-inverse" Text="Reset"  />
                                            </div>

                                          <%--  <div class="grid-scroll">
                                                <div style="overflow-y: auto;">
                                                    <asp:GridView ID="gridview" runat="server" AutoGenerateColumns="false" CssClass="gridview-style">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Sr.No">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                                
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Register No." DataField="RegisterNo" />
                                                            <asp:BoundField HeaderText="Student Name" DataField="StudentName" />
                                                           
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>--%>
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
