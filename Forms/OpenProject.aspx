﻿<%@ Page Language="C#"  %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="cnbeiwpweb02v.ProjectRelease" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "OpenProject");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            
            var db = new PPPEntities();
            var iProjectId = Convert.ToInt32(projectId.Value);
            var iSubId = Convert.ToInt32(subId.Value);
            var item = db.TProjectX.Find(iProjectId, iSubId);
            if (item != null)
            {
                projectName.Value = item.ProjectName;
                client.Value = item.Customer;
                managerId.Value = item.ProjectManagerId.ToString();
                totalManhours.Value = item.EstimatedWork;
                type.Value = item.PType;
            }
            var risk = db.RiskClassificationForm.Find(iProjectId, iSubId, "2");
            if (risk != null)
            {
                riskClassification.Value = risk.projectRisk;
            }
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Forms/css/bidForm.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/g.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <script>
        $(function () {
            $("input[type='text'], select").change(function () {
                var v =
                    $("#prefix option:selected").val() +
                    $("#csg option:selected").val() +
                    $("#year").val() +
                    $("#office option:selected").val() +
                    $("#phase option:selected").val() +
                    $("#status option:selected").val() +
                    $("#serialNo").val() +
                    $("#suffix").val()
                    ;
                $("#proposalNo").html(v);
                $("#projectNo").val(v);
            });

            $('#form1').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {/*验证*/
                    year: {
                        message: 'Invalid year',
                        validators: {
                            notEmpty: {
                                message: 'Year is required'
                            },
                            stringLength: {
                                min: 2,
                                max: 2,
                                message: 'Year valid length is 2'
                            }
                        }
                    },
                    serialNo: {
                        message: 'Invalid serials number',
                        validators: {
                            notEmpty: {
                                message: 'Serials number is required'
                            },
                            stringLength: {
                                min: 3,
                                max: 3,
                                message: 'Serials Number valid length is 3'
                            }
                        }
                    }
                }
            });

            $("#open").click(function () {
                if ($("#client2").val() === "") {
                    alert("Client Short Name is required.");
                    return false;
                }
                if ($("#scope").val() === "") {
                    alert("Scope is required.");
                    return false;
                }
                if ($("#location").val() === "") {
                    alert("Location is required.");
                    return false;
                }
                if ($("#startDate").val() === "") {
                    alert("Start Date is required.");
                    return false;
                }
                if ($("#endDate").val() === "") {
                    alert("End Date is required.");
                    return false;
                }
                if ($("#totalManhours").val() === "") {
                    alert("Total Manhours is required.");
                    return false;
                }
                if ($("#year").val() === "") {
                    alert("Year is required.");
                    return false;
                }
                if ($("#serialNo").val() === "") {
                    alert("Serials Number is required.");
                    return false;
                }
                if ($("#workshare").val() === "") {
                    alert("Workshare is required.");
                    return false;
                }
                var bootstrapValidator = $("#form1").data('bootstrapValidator');
                bootstrapValidator.validate();
                if (bootstrapValidator.isValid()) {
                    // 验证通过
                    $.ajax({
                        url: "Actions/OpenProjectAction.aspx?bkMode=1"
                            + "&projectId=" + $("#projectId").val()
                            + "&subId=" + $("#subId").val()
                            + "&csg=" + $("#csg option:selected").val()
                            + "&year=" + $("#year").val()
                            + "&office=" + $("#office option:selected").text()
                            + "&phase=" + $("#phase option:selected").val()
                            + "&status=" + $("#status option:selected").val()
                            + "&serialNo=" + $("#serialNo").val()
                        + "&projectNo=" + $("#projectNo").val()
                        + "&startDate=" + $("#startDate").val()
                        + "&endDate=" + $("#endDate").val()
                        + "&projectName=" + $("#projectName").val()
                        + "&client=" + $("#client2").val()
                        + "&projectStatus=" + $("#projectStatus option:selected").val()
                        + "&managerId=" + $("#managerId").val()
                        + "&entity=" + $("#entity option:selected").val()
                        + "&type=" + $("#type option:selected").val()
                        + "&category=" + $("#category option:selected").val()
                        + "&classification=" + $("#classification option:selected").val()
                        + "&hseClassification=" + $("#hseClassification option:selected").val()
                        + "&riskClassification=" + $("#riskClassification option:selected").val()
                        + "&businessLine=" + $("#businessLine option:selected").val()
                        + "&scope=" + $("#scope").val()
                        + "&location=" + $("#location").val()
                        + "&totalManhours=" + $("#totalManhours").val()
                        + "&workshare=" + $("#workshare").val()
                        ,
                        type: "post",
                        datatype: "json",
                        async: false,
                        success: function (d) {
                            var json = JSON.parse(d);
                            if (json.ErrorCode === "0") {
                                alert(json.ErrorMessage);
                            }
                            else {
                                alert("[" + json.ErrorCode + "] " + json.ErrorMessage);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            /*弹出jqXHR对象的信息*/
                            //alert(jqXHR.responseText);
                            //alert(jqXHR.status);
                            //alert(jqXHR.readyState);
                            alert(jqXHR.statusText);
                            /*弹出其他两个参数的信息*/
                            //alert(textStatus);
                            //alert(errorThrown);
                        }
                    });
                } else {
                    // 验证失败
                    alert("Invalid input.");
                }
                return false;
            });

            $("#copyExistProject").blur(function () {
                console.log(document.getElementById("copyExistProject").value.length);
                console.log($(this).val());
                var len = document.getElementById("copyExistProject").value.length;
                if (len < 11) {
                    console.log("Invalid length.");
                    return;
                }
                if (len === 11) {
                    $("#csg").val(document.getElementById("copyExistProject").value.substring(0, 2));
                    $("#year").val(document.getElementById("copyExistProject").value.substring(2, 4));
                    $("#office").val(document.getElementById("copyExistProject").value.substring(4, 6));
                    $("#phase").val(document.getElementById("copyExistProject").value.substring(6, 7));
                    $("#status").val(document.getElementById("copyExistProject").value.substring(7, 8));
                    $("#serialNo").val(document.getElementById("copyExistProject").value.substring(8, 11));
                }
                else if (len >= 12) {
                    var prefix = document.getElementById("copyExistProject").value.substring(0, 1);
                    if (prefix === "L" || prefix === "U" || prefix === "T") {
                        // 包含Prefix
                        $("#prefix").val(document.getElementById("copyExistProject").value.substring(0, 1));
                        $("#csg").val(document.getElementById("copyExistProject").value.substring(1, 3));
                        $("#year").val(document.getElementById("copyExistProject").value.substring(3, 5));
                        $("#office").val(document.getElementById("copyExistProject").value.substring(5, 7));
                        $("#phase").val(document.getElementById("copyExistProject").value.substring(7, 8));
                        $("#status").val(document.getElementById("copyExistProject").value.substring(8, 9));
                        $("#serialNo").val(document.getElementById("copyExistProject").value.substring(9, 12));
                        $("#suffix").val(document.getElementById("copyExistProject").value.substring(12, len)); // 多出部分认为是后缀
                    } else {
                        // 不包含Prefix
                        $("#csg").val(document.getElementById("copyExistProject").value.substring(0, 2));
                        $("#year").val(document.getElementById("copyExistProject").value.substring(2, 4));
                        $("#office").val(document.getElementById("copyExistProject").value.substring(4, 6));
                        $("#phase").val(document.getElementById("copyExistProject").value.substring(6, 7));
                        $("#status").val(document.getElementById("copyExistProject").value.substring(7, 8));
                        $("#serialNo").val(document.getElementById("copyExistProject").value.substring(8, 11));
                        $("#suffix").val(document.getElementById("copyExistProject").value.substring(11, len)); // 多出部分认为是后缀
                    }
                }
                var v =
                    $("#prefix option:selected").val() +
                    $("#csg option:selected").val() +
                    $("#year").val() +
                    $("#office option:selected").val() +
                    $("#phase option:selected").val() +
                    $("#status option:selected").val() +
                    $("#serialNo").val() +
                    $("#suffix").val()
                ;
                $("#proposalNo").html(v);
                $("#projectNo").val(v);

            });

            //// 页面初始化
            // 取得财年
            $.ajax("Actions/GetFYear.aspx", {
                type: "post",
                success: function (d) {
                    try {

                        $("#year").val(d);
                    } catch (e) {
                        alert(e);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });

            $("#autogeneration-serials-number").click(function () {
                $.ajax("Actions/GetFYearSerialNo.aspx", {
                    type: "post",
                    success: function (d) {
                        try {
                            $("#serialNo").val(d);
                            $("input[type='text'], select").change();
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
            })
            // 取得序号
            $("#autogeneration-serials-number").click();
            $("input[type='text'], select").change();
        });

    </script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <!-- 导航地图::开始 -->
    <div><strong>PIMS</strong> > <a href="~/Project/Default.aspx" runat="server">Project Initiation</a> > <a href="../Project/ProjectInitiation.aspx?projectId=<%=Request["projectId"]%>">Project</a> > Open Project </div>
    <!-- 导航地图::结束 -->
    <div class="">
		<h3 class="text-center">Open Project</h3>
		</div>
        <div class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-6 col-md-6 col-sm-12">
        <fieldset>
                <legend>TimeSheet System Required</legend>
            <div class="form-group">
                <label>Project No</label>
                <input type="text" id="projectNo" name="projectNo" runat="server" class="form-control" readonly="readonly"/>
            </div>
            <div class="form-group">
                <label>Project Name</label>
                <input type="text" id="projectName" name="projectName" runat="server" class="form-control" readonly="readonly"/>
            </div>
            <div class="form-group">
                <label>Client</label>
                <input type="text" id="client" name="client" runat="server" class="form-control" readonly="readonly"/>
            </div>
            <div class="form-group">
                <label>Client Short Name <span style="color:red;">*</span></label>
                <input type="text" id="client2" name="client2" runat="server" class="form-control" maxlength="30" placeholder="max length is 30"/>
            </div>
            <div class="form-group">
                <label>Project Status <span style="color:red;">*</span></label>
                <select runat="server" id="projectStatus" name="csg" class="form-control">
                    <option value="Project Executing">Project Executing</option>
                    <option value="Project Closed">Project Closed</option>
                </select>
            </div>
            <div class="form-group">
                <label>Project Manager (Employee No)</label>
                <input type="text" id="managerId" name="managerId" runat="server" class="form-control" readonly="readonly"/>
            </div>
            <div class="form-group">
                <label>Entity <span style="color:red;">*</span></label>
                <select runat="server" id="entity" name="entity" class="form-control">
                    <option value="WPC">WPC</option>
                    <option value="WPC BJ">WPC BJ</option>
                    <option value="WPC SH">WPC SH</option>
                    <option value="LYG">LYG</option>
                    <option value="LYG BJ">LYG BJ</option>
                    <option value="LYG SH">LYG SH</option>
                    <option value="LYG CD">LYG CD</option>
                    <option value="LYG NJ">LYG NJ</option>
                    <option value="LYG TJ">LYG TJ</option>
                    <option value="CD WPC">CD WPC</option>
                    <option value="TJ WPC">TJ WPC</option>
                    <option value="UNET BJ">UNET BJ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Type</label>
                <select runat="server" id="type" name="type" class="form-control" disabled="disabled">
                    <option value="Chemical">Chemical</option>
                    <option value="Hydrocarbon">Hydrocarbon</option>
                    <option value="Infrastructure">Infrastructure</option>
                    <option value="Metals&Minerals">Metals&Minerals</option>
                    <option value="Power">Power</option>
                    <option value="Overhead">Overhead</option>
                </select>
            </div>
             <div class="form-group">
                <label>Category <span style="color:red;">*</span></label>
                <select runat="server" id="category" name="category" class="form-control">
                    <option value="Work in Hands">Work in Hands</option>
                    <option value="Prospect">Prospect</option>
                    <option value="Blue Sky">Blue Sky</option>
                </select>
            </div>           
             <div class="form-group">
                <label>Classification <span style="color:red;">*</span></label>
                <select runat="server" id="classification" name="classification" class="form-control">
                    <option value="Small">Small</option>
                    <option value="Medium">Medium</option>
                    <option value="Large">Large</option>
                </select>
            </div>
             <div class="form-group">
                <label>HSE Category </label>
                <select runat="server" id="hseClassification" name="hseClassification" class="form-control">
                    <option value="N/A">N/A</option>
                    <option value="WP-Primacy">WP-Primacy</option>
                    <option value="WP-Non-Primacy">WP-Non-Primacy</option>
                </select>
            </div>
             <div class="form-group">
                <label>Risk Classification <span style="color:red;">*</span></label>
                <select runat="server" id="riskClassification" name="riskClassification" class="form-control">
                    <option value="Low">Low</option>
                    <option value="Moderate">Moderate</option>
                    <option value="High">High</option>
                </select>
            </div>  
             <div class="form-group">
                <label>Business Line <span style="color:red;">*</span></label>
                <select runat="server" id="businessLine" name="businessLine" class="form-control">
                    <option value="Service">Service</option>
                    <option value="Major Projects">Major Projects</option>
                    <option value="Improve">Improve</option>
                    <option value="Advisian">Advisian</option>
                </select>
            </div>
            <div class="form-group">
                <label>Scope <span style="color:red;">*</span></label>
                <input type="text" id="scope" name="scope" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>Location <span style="color:red;">*</span></label>
                <input type="text" id="location" name="location" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>Start Date (yyyy/mm/dd) <span style="color:red;">*</span></label>
                <input type="text" id="startDate" name="startDate" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>End Date (yyyy/mm/dd) <span style="color:red;">*</span></label>
                <input type="text" id="endDate" name="endDate" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>Total Manhours <span style="color:red;">*</span></label>
                <input type="text" id="totalManhours" name="totalManhours" runat="server" class="form-control" />
            </div>
<%--            <div class="form-group">
                <label>Office</label>
                <select id="office" name="office" runat="server" class="form-control" >
                    <option value="BJ">BJ</option>
                    <option value="SH">SH</option>
                    <option value="CD">CD</option>
                    <option value="GPC">GPC</option>
                    <option value="Cor">Cor</option>
                    <option value="TJ">TJ</option>
                    <option value="NJ">NJ</option>
                    <option value="AdvisianBJ">AdvisianBJ</option>
                </select>
            </div>--%>
        </fieldset>
        <fieldset>
            <legend>Create Project Number Required</legend>
            <div class="form-group">
                <label>Copy From Existing Project</label>
                <input type="text" id="copyExistProject" name="copyExistProject" runat="server" class="form-control" placeholder="Optional" />
            </div>
            <div class="form-group">
                <label>Prefix</label>
<%--                <input type="text" id="prefix" name="prefix" runat="server" class="form-control" placeholder="Optional" />--%>
                <select id="prefix" name="phase" runat="server" class="form-control" >
                    <option value=""></option>
                    <option value="L">LYG</option>
                    <option value="U">United</option>
                    <option value="T">TJ WPC</option>
                </select>
            </div>
            <div class="form-group">
                <label>CSG <span style="color:red;">*</span></label>
                <select runat="server" id="csg" name="csg" class="form-control">
                    <option value="CC">CC-Chemicals</option>
                    <option value="HU">HU-Hydrocarbons Upstream</option>
                    <option value="HH">HH-Hydrocarbons Downstream</option>
                    <option value="PP">PP-Power</option>
                    <option value="PH">PH-Power Workshare</option>
                    <option value="MM">MM-Minerals&amp;Metals</option>
                    <option value="MH">MH-Minerals&amp;Metals Workshare</option>
                    <option value="IE">IE-Infrastructure</option>
                    <option value="IH">IH-Infrastructure Workshare</option>
                    <option value="LC">LC-LYG</option>
                </select>
            </div>
            <div class="form-group">
                <label>Year <span style="color:red;">*</span></label>
                <input type="text" id="year" name="year" runat="server" class="form-control" maxlength="2" placeholder="Valid length: 2" readonly="readonly"/>
            </div>
            <div class="form-group">
                <label>Office <span style="color:red;">*</span></label>
                <select id="office" name="office" runat="server" class="form-control" >
                    <option value="11">11-Beijing Office</option>
                    <option value="12">12-Shanghai Office</option>
                    <option value="13">13-Nanjing Office</option>
                    <option value="14">14-Tianjin Office</option>
                    <option value="20">20-Chengdu Office</option>
                    <option value="21">21-PAS (21 including Procurement)</option>
                    <option value="31">31-GDC BJ</option>
                    <option value="33">33-GDC NJ</option>
                    <option value="34">34-GDC TJ</option>
                    <option value="41">41-Advisian BJ</option>
                    <option value="53">53-International Chemicals NJ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Phase <span style="color:red;">*</span></label>
                <select id="phase" name="phase" runat="server" class="form-control" >
                    <option value="A">A-Advisory</option>
                    <option value="C">C-Consulting / Selected (Pre-FEED)</option>
                    <option value="D">D-Execute, FEED/Identify/Evaluate/Define EPCM/EPC, PMC/DED/Deliver</option>
                    <option value="M">M-Major Project</option>
                </select>
            </div>
            <div class="form-group">
                <label>Status</label>
                <select id="status" name="status" runat="server" class="form-control" >
                    <option value="1">1-Project</option>
                </select>
            </div>
            <div class="form-group">
                <label>Serials Number <span style="color:red;">*</span> <a href="javascript:void(0);" id="autogeneration-serials-number">Autogeneration</a></label>
                <input type="text" id="serialNo" name="serialNo" runat="server" class="form-control" maxlength="3" placeholder="Autogeneration" />
            </div>
            <div class="form-group">
                <label>Workshare <span style="color:red;">*</span></label>
                <select id="workshare" name="workshare" runat="server" class="form-control" >
                    <option value=""></option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
            <div class="form-group">
                <label>Suffix</label>
                <input type="text" id="suffix" name="suffix" runat="server" class="form-control" placeholder="Optional" />
            </div>
            <div class="form-group">
                <label class="text-info">New Project No:</label>
                <div class="bg-info text-center" style="border: yellow; line-height: 2em;"><label id="proposalNo" runat="server"></label></div>
            </div>
            <input type="hidden" id="projectId" runat="server"/>
            <input type="hidden" id="subId" runat="server"/>
            <p>&nbsp;</p>
            <div class="text-center">
                <div class="btn-group">
                    <button type="submit" name="submit" class="btn btn-primary" id="open">Open</button>
                </div>
            </div>
            <label class="h4" style="">Instruction:</label><br/>
            <div style="border: 1px solid lightgray; text-align: center;padding-bottom: 10px " class="py-1">
                <label class="h3" style="border: 1px dotted darkblue; padding-left: 5px; padding-right: 5px; color: darkgray;"> Prefix</label>
                <label class="bg-info h3">AA</label>
                <label class="bg-warning h3">BB</label>
                <label class="bg-primary h3">CC</label>
                <label class="bg-danger h3">D</label>
                <label class="bg-success h3">E</label>
                <label class="bg-info h3">FFF</label>
                <label class="h3" style="border: 1px dotted darkblue; padding-left: 5px; padding-right: 5px;color: darkgray;">Suffix</label>
            </div>
            <div style="border: 0px solid gray;">
                <label class="h5" style="border: 1px dotted darkblue; padding-left: 5px; padding-right: 5px;color: darkgray;">Prefix</label>:<label>Optional</label><br/>
                <label class="bg-info h5">AA</label>:<label>Business Sectors</label><br/>
                <label class="bg-warning h5">BB</label>:<label>Year</label><br/>
                <label class="bg-primary h5">CC</label>:<label>Office</label><br/>
                <label class="bg-danger h5">D</label>:<label>Phase</label><br/>
                <label class="bg-success h5">E</label>:<label>Status</label><br/>
                <label class="bg-info h5">FFF</label>:<label>Serials Number</label><br/>
                <label class="h5" style="border: 1px dotted darkblue; padding-left: 5px; padding-right: 5px;color: darkgray;">Suffix</label>:<label>Optional</label><br/>
            </div>
        </fieldset>
        </div>
        <div class="col col-lg-3 col-md-3"></div>
    </form>
</body>
</html>

