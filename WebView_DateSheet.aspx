<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebView_DateSheet.aspx.cs" Inherits="student_WebView_DataSheet" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student Date Sheet | Smart View</title>
    <!-- Essential Meta for Mobile Responsiveness -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <meta name="theme-color" content="#0b2b5c">

    <!-- Modern Bootstrap 5 + Icons + Smooth Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">

    <!-- Legacy assets (graceful fallback) -->
    <link href="../assets/stylesheets/light-theme.css" rel="stylesheet" />
    <link href="../assets/stylesheets/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(145deg, #eef2f9 0%, #e0e8f2 100%);
            font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, 'Roboto', sans-serif;
            padding: 28px 20px;
            min-height: 100vh;
        }

        /* main card container - glassmorphic feel */
        .responsive-card {
            max-width: 1450px;
            margin: 0 auto;
            transition: all 0.3s ease;
        }

        /* Premium header with depth */
        .blue-header-custom {
            background: linear-gradient(105deg, #0a2647 0%, #1b4a7a 100%);
            border-radius: 28px 28px 0 0;
            padding: 18px 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 14px;
            backdrop-filter: blur(2px);
            box-shadow: 0 10px 20px -8px rgba(0,0,0,0.2);
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

            .blue-header-custom h4 {
                margin: 0;
                font-size: 1.5rem;
                font-weight: 700;
                letter-spacing: -0.2px;
                background: linear-gradient(135deg, #FFFFFF, #E0F0FF);
                background-clip: text;
                -webkit-background-clip: text;
                color: transparent;
                text-shadow: 0 2px 3px rgba(0,0,0,0.1);
                display: inline-flex;
                align-items: center;
                gap: 12px;
            }

                .blue-header-custom h4 i {
                    font-size: 1.7rem;
                    color: #FFE6A7;
                    text-shadow: 0 1px 2px rgba(0,0,0,0.2);
                    background: none;
                    background-clip: unset;
                    -webkit-background-clip: unset;
                    color: #FFE6A7;
                }

        /* badge / exam select wrapper - elegant */
        .exam-selector-card {
            background: #ffffffdd;
            backdrop-filter: blur(4px);
            border-radius: 24px;
            padding: 8px 8px 8px 20px;
            background: rgba(255,255,255,0.2);
            border: 1px solid rgba(255,255,255,0.35);
            min-width: 240px;
        }

        .exam-label-modern {
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #FFEECC;
            margin-bottom: 5px;
            display: block;
        }

        .form-select-glow {
            background: white;
            border: none;
            border-radius: 48px;
            padding: 10px 20px;
            font-weight: 500;
            color: #0a2647;
            font-size: 0.95rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.2s;
            cursor: pointer;
        }

            .form-select-glow:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(255,230,167,0.6);
                border-color: transparent;
            }

        /* main content card - premium white */
        .box-content-custom {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 0 0 32px 32px;
            padding: 32px 30px;
            box-shadow: 0 25px 45px -12px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(0px);
            transition: all 0.25s linear;
        }

        /* modern info tiles */
        .info-tile {
            background: #ffffff;
            border-radius: 18px;
            padding: 0px 0px 0px 0px;
            transition: all 0.2s ease;
            height: 100%;
            border: 1px solid #eef2fc;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.02);
        }

            .info-tile:hover {
                transform: translateY(-3px);
                box-shadow: 0 16px 28px -10px rgba(0, 40, 80, 0.12);
                border-color: #cddff5;
                background: #fefeff;
            }

        .info-label-modern {
            font-weight: 700;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #486a8f;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
            background: #f0f5fe;
            padding: 8px 16px;
            border-radius: 40px;
        }

            .info-label-modern i {
                font-size: 0.9rem;
                color: #1f6392;
            }

        .info-value-premium {
            font-size: 1.1rem;
            font-weight: 600;
            color: #0a2b44;
            padding: 10px 18px 14px 18px;
            display: block;
            line-height: 1.4;
            word-break: break-word;
            background: #FFFFFF;
            border-radius: 24px;
            margin-top: 4px;
        }

        /* empty / placeholder state */
        .empty-state {
            background: #f9fafd;
            border-radius: 32px;
            padding: 48px 24px;
            text-align: center;
            color: #6c86a3;
        }

            .empty-state i {
                font-size: 3.5rem;
                margin-bottom: 1rem;
                opacity: 0.6;
            }

        /* grid gap */
        .custom-gap {
            row-gap: 1.6rem;
        }

        /* responsive adjustments */
        @media (max-width: 768px) {
            body {
                padding: 16px;
            }

            .box-content-custom {
                padding: 22px 18px;
            }

            .blue-header-custom {
                padding: 14px 20px;
                flex-direction: column;
                align-items: stretch;
                text-align: left;
            }

                .blue-header-custom h4 {
                    font-size: 1.3rem;
                }

            .exam-selector-card {
                width: 100%;
                padding: 6px 12px 12px 12px;
            }

            .info-value-premium {
                font-size: 1rem;
                padding: 8px 14px;
            }

            .info-label-modern {
                font-size: 0.65rem;
            }
        }

        @media (max-width: 480px) {
            .box-content-custom {
                padding: 18px 14px;
            }

            .info-value-premium {
                font-size: 0.9rem;
            }

            .blue-header-custom h4 i {
                font-size: 1.3rem;
            }
        }

        /* animated loading subtle */
        @keyframes softPulse {
            0% {
                opacity: 0.7;
            }

            100% {
                opacity: 1;
            }
        }

        .updating-symbol {
            transition: all 0.2s;
        }

        /* legacy override - keep clean */
        .box {
            border: none !important;
            background: transparent;
        }

        .form-control.text-center {
            text-align: left !important;
        }
        /* remove double backgrounds */
        .info-value {
            all: unset;
        }

        .info-title {
            all: unset;
        }

        hr {
            opacity: 0.3;
            margin: 0;
        }
        /* ensure dropdown modern */
        select.form-select-glow option {
            background: white;
            color: #0a2647;
            padding: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="responsive-card">
                    <div class="box">
                        <!-- header with modern interactive elements -->
                        <div class="blue-header-custom">
                            <h4>
                                <i class="fas fa-calendar-alt"></i>
                                <span id="lbltitle" runat="server">Student Date Sheet</span>
                            </h4>
                            <div class="exam-selector-card">
                                <span class="exam-label-modern"><i class="fas fa-graduation-cap me-1"></i>Select Examination</span>
                                <asp:DropDownList ID="ddlExamName" OnSelectedIndexChanged="ddlExamName_SelectedIndexChanged" AutoPostBack="true" CssClass="form-select form-select-glow w-100" runat="server">
                                    <asp:ListItem Text="-- Loading Exams --" Value="" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- dynamic content area with elegant card -->
                        <div class="box-content-custom">
                            <asp:Panel ID="pnlDateSheetContainer" runat="server">
                                <div class="row g-4 custom-gap" id="div_DateSheet" runat="server" visible="false">
                                    <!-- Date Tile -->
                                    <div class="col-12 col-sm-12 col-lg-3">
                                        <div class="info-tile">
                                            <span class="info-label-modern" style="display: block; margin-bottom: 2px;">
                                                <i class="fas fa-calendar-day"></i>Exam Date
                                            </span>
                                            <asp:Label ID="lblDate" runat="server" CssClass="info-value-premium" Text="—"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- Timing Tile -->
                                    <div class="col-12 col-sm-12 col-lg-3">
                                        <div class="info-tile">
                                            <span class="info-label-modern">
                                                <i class="fas fa-hourglass-half"></i>Timing
                                            </span>
                                            <asp:Label ID="lblTiming" runat="server" CssClass="info-value-premium" Text="—"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- Course Code Tile -->
                                    <div class="col-12 col-sm-12 col-lg-3">
                                        <div class="info-tile">
                                            <span class="info-label-modern">
                                                <i class="fas fa-hashtag"></i>Course Code
                                            </span>
                                            <asp:Label ID="lblCourseCode" runat="server" CssClass="info-value-premium" Text="—"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- Course Name Tile -->
                                    <div class="col-12 col-sm-12 col-lg-3">
                                        <div class="info-tile">
                                            <span class="info-label-modern">
                                                <i class="fas fa-book-open"></i>Course Name
                                            </span>
                                            <asp:Label ID="lblCourseName" runat="server" CssClass="info-value-premium" Text="—"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
