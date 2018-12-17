<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "CRMT"); %>
<%SystemHelper.SessionCheck(this); %>
<!DOCTYPE html>

<script runat="server">

    public StringCollection ExcelSheetName(string filepath)
    {
        StringCollection names = new StringCollection();
        string strConn;
        const string connStrTemplate = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=\"Excel 12.0;HDR=Yes;\"";

        if (!System.IO.File.Exists(filepath))
        {
            // don't find file
            return null;
        }
        OleDbConnection conn = new OleDbConnection(string.Format(connStrTemplate, filepath));
        conn.Open();
        DataTable sheetNames = conn.GetOleDbSchemaTable
        (System.Data.OleDb.OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
        conn.Close();

        foreach (DataRow dr in sheetNames.Rows)
        {
            names.Add(dr[2].ToString());
        }
        return names;
    }
    
    private DataTable GetTableFromExcel(string sheetName, string filePath)
    {
        const string connStrTemplate = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=\"Excel 12.0;HDR=Yes;\"";
        DataTable dt = null;
        if (!System.IO.File.Exists(filePath))
        {
            // don't find file
            return null;
        }
        OleDbConnection conn = new OleDbConnection(string.Format(connStrTemplate, filePath));
        try
        {
            conn.Open();
            string strSQL = "Select * From [" + sheetName + "]";
            var da = new OleDbDataAdapter(strSQL, conn);
            var ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];
            for(var i = 0; i < 3 ;i++)dt.Columns.RemoveAt(0);
        }
        catch (Exception ex)
        {
            //var sw = new StreamWriter(@"c:\temp\system-err.log", true);
            //sw.WriteLine(string.Format("[{0}]{1}", DateTime.Now.ToString(System.Globalization.CultureInfo.InvariantCulture), ex.Message));
            //sw.Close();
            throw ex;
        }
        finally
        {
            conn.Close();
        }

        return dt;
    }

    private void btnReadFile_OnServerClick(object sender, EventArgs e)
    {
        DataTable dt =new DataTable();
        if (tmpServerFileName.Value == string.Empty)
        {
            var fo = new FileInfo(crmtFile.FileName);
            crmtFileName.Value = fo.Name;
            var serverFileName = Path.Combine(Server.MapPath("~/Files"), fo.Name);
            crmtFile.SaveAs(serverFileName);
            tmpServerFileName.Value = serverFileName;
            var crmtLoadFile = fo.Name;
            var sNames = ExcelSheetName(serverFileName);
            sheetName.Value = sNames[0];
            dt = GetTableFromExcel(sheetName.Value, serverFileName);
        }
        else
        {
            tmpServerFileName.Value = tmpServerFileName.Value;
            var sNames = ExcelSheetName(tmpServerFileName.Value);
            sheetName.Value = sNames[0];
            dt = GetTableFromExcel(sheetName.Value, tmpServerFileName.Value);
        }

        var db = new PPPEntities();
        foreach (DataRow dr in dt.Rows)
        {
            var sk = searchKey.Value.ToLower();
            var projectId = dr[0].ToString();
            var businessUnit = dr[1].ToString().ToLower();
            var opportunityLeadSector = dr[2].ToString().ToLower();
            var businessLine = dr[3].ToString().ToLower();
            var projectName = dr[4].ToString().ToLower();
            var customer = dr[5].ToString().ToLower();
            var prospectStatus = dr[6].ToString().ToLower();
            if (projectId.Contains(sk)
                || businessUnit.Contains(sk)
                || opportunityLeadSector.Contains(sk)
                || businessLine.Contains(sk)
                || projectName.Contains(sk)
                || customer.Contains(sk)
                || prospectStatus.Contains(sk)
                )
            {
                var iProjectId = Convert.ToInt32(dr[0]);
                var row = new HtmlTableRow();
                var cell = new HtmlTableCell();
                cell.InnerHtml = string.Format("<input type='checkbox' id='proj{0}' checked='checked'/>", iProjectId);
                row.Cells.Add(cell);
                cell = new HtmlTableCell();
                if (db.TProject.Any(x => x.ProjectId == iProjectId))
                {
                    cell.InnerHtml = "Modify";
                }
                else
                {
                    cell.InnerHtml = "Append";
                }
                row.Cells.Add(cell);
                for (var colIndex = 0; colIndex < 22; colIndex++)
                {
                    cell = new HtmlTableCell();
                    if (dr[colIndex] is DateTime)
                    {
                        cell.InnerHtml = StringHelper.FmtDate(dr[colIndex].ToString());
                    }
                    else
                    {
                        cell.InnerHtml = dr[colIndex].ToString();
                    }

                    row.Cells.Add(cell);
                }
                crmtTable.Rows.Add(row);
            }
        }
    }

    private void search_OnServerClick(object sender, EventArgs e)
    {
        btnReadFile_OnServerClick(sender, e);
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap-tooltip.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap-popover.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap-button.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap-alert.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
         .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
         .red-text {
             color: red;
         }
    </style>
    <script>
        $(function() {
            $("#btnImport").click(function () {
                var url = "./Actions/ImportDataAction.aspx?crmtFileName=" + $("#crmtFileName").val() + "&sheetName=" + $("#sheetName").val() + "&projectIds=";
                var param = "";
                $("#crmtTable tr").each(function (index, item) {
                    var chk = $(item).find("td:eq(0) input");
                    var projectId = $(item).find("td:eq(2)").html();
                    if (chk.is(":checked") === true) {
                        if (param === "") {
                            param = projectId;
                        } else {
                            param = param + "|" + projectId;
                        }
                    }
                });
                if (param === "") {
                    alert("No line is chosen.");
                    return false;
                }
                url = url + param;
                $.ajax(url, {
                    type: "post",
                    success: function (d) {
                        try {
                            var rst = JSON.parse(d);
                            if (rst.ErrorCode === "0") {
                                alert(rst.ErrorMessage);
                            } else {
                                alert(rst.ErrorMessage);
                            }
                        } catch (e) {
                            alert(e);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        //alert(jqXHR.responseText);
                        alert(jqXHR.status);
                        //alert(jqXHR.readyState);
                        //alert(jqXHR.statusText);
                        /*弹出其他两个参数的信息*/
                        //alert(textStatus);
                        //alert(errorThrown);
                    }
                });

                return false;
            });

            $("#tblController").click(function () {
                $("#crmtTable tr:gt(0)").each(function (index, item) {
                    var chk = $(item).find("td:eq(0) input");
                    if ($("#tblController").is(":checked") === true) {
                        chk.prop('checked', true);
                    } else {
                        chk.prop('checked', false);
                    }
                });
                return true;
            });
            $("#crmtTable input:gt(0)").click(function () {
                var c1 = 0;
                var c2 = 0;
                var total = 0;
                $("#crmtTable tr:gt(0)").each(function (index, item) {
                    var chk = $(item).find("td:eq(0) input");
                    if (chk.is(":checked") === true) {
                        c1 ++;
                    } else {
                        c2++;
                    }
                    total += 1;
                });
                if (c1 === total) {
                    $("#tblController").prop('checked', true);
                }
                else if (c2 === total) {
                    $("#tblController").prop('checked', false);
                }
                else if (c1 > 0 && c2 > 0) {
                    $("#tblController").prop('checked', false);
                }
                return true;
            });

            $(".help").click(function() {
                $("#modalDialog-Help").modal("show");
            });

            $("#searchKey").focus(function () {
                $('.prompt').removeClass("hidden");
            });
            $("#searchKey").blur(function () {
                $('.prompt').addClass("hidden");
            });

            //$("#search").click(function () {
                //$("tr:gt(0)").addClass("hidden");
                //$("td:not(contains('" + $("#searchKey").val() + "'))").parent().removeClass("hidden");

                //$.each($("#crmtTable tr:gt(0)"), function (index, item) {

                //    //alert($(item).parent().html());
                //    var rowStatusId = $(item).find("td:eq(1)").html();
                //    var projectId = $(item).find("td:eq(2)").html();
                //    //var businessUnit = $(item).find("td:eq(3)").html();
                //    //var opportunityLeadSector = $(item).find("td:eq(4)").html();
                //    //var businessLine = $(item).find("td:eq(5)").html();
                //    //var projectName = $(item).find("td:eq(6)").html();
                //    //var customer = $(item).find("td:eq(7)").html();
                //    //var prospectStatus = $(item).find("td:eq(8)").html();
                //    //alert($(projectId).contains("1703661").html());

                //    if ($.contains(projectId, "1703661")) {
                //        $(item).addClass("hidden");
                //    } else {
                //        $(item).removeClass("hidden");
                //    }


                //    return false;
                //    ;
                //});

                //return false;
            //});
        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<span>Project Initiation ></span> <a href="~/CRMTLoader/Default.aspx" class=" btn-default btn-create" runat="server">CRMT Loader</a> > Import data
<div class="container">
    <h4 class="text-center">
        Import data
    </h4>
        <label>Select CRMT File</label>&nbsp;&nbsp;<a href="~/download/crmt-template.xlsx" runat="server" style="display: inline-block; width: 160px; text-decoration: none; border: 0px dotted red;"><img src="~/Images/download.png" runat="server" /> Download template</a> <a href="javascript:void(0);" class="danger help">Help</a>
        <asp:FileUpload ID="crmtFile" runat="server" CssClass="form-control" />  <br/>
        <div class="text-center">
        <button runat="server" id="btnReadFile" class="btn btn-primary" OnServerClick="btnReadFile_OnServerClick">Read</button>
            <br/><br/>
        </div>
        <div>
            <div class="col col-lg-2 col-md-2 col-sm-2">
            </div>
            <div class="col col-lg-8 col-md-8 col-sm-8">
                <div class="input-group">
                    <input type="text" class="form-control" id="searchKey" runat="server" placeholder=""/>
                    <span class="input-group-btn"><button class="btn btn-default" id="search" runat="server" OnServerClick="search_OnServerClick" >Search</button></span>
                </div>
            </div>
            <div class="col col-lg-2 col-md-2 col-sm-2"></div>
        </div>
        <br/><br/><br/>
<div class="container" style="overflow-x: auto; padding-left: 0; height: 460px;overflow-y: auto" >
        <table class="table table-bordered table-hover" id="crmtTable" runat="server" >
            <thead>
                <tr class="HeaderLinearBackground">
                    <th><label class="text-center"><input type='checkbox' id='tblController' checked="checked"/>Update</label></th>
                    <th>Row Status</th>
                    <th>Project<br/>ID</th>
                    <th>Business Unit</th>
                    <th>Opportunity<br/>Lead Sector</th>
                    <th>Business<br/>Line</th>
                    <th>Project Name</th>
                    <th>Customer</th>
                    <th>Prospect<br/>Status</th>
                    <th>Bid<br/>Due Date</th>
                    <th>Award Date</th>
                    <th>Go (%)</th>
                    <th>Get (%)</th>
                    <th>WorleyParsons<br/>CV (AUD)</th>
                    <th>WorleyParsons<br/>EBIT (AUD)</th>
                    <th>Estimated<br/>Work (Hrs)</th>
                    <th>Contract<br/>Duration (Wks)</th>
                    <th>Contract Type</th>
                    <th>Bid Office</th>
                    <th>Facility Location<br/> - Country</th>
                    <th>Scopes (All)</th>
                    <th>Opportunity<br/>Lead Subsector</th>
                    <th>Custodian</th>
                    <th>Contract<br/>Currency</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
</div>
            <div class="text-center">
            <br/><br/>
            <button id="btnImport" class="btn btn-danger" onclick="javascript:void (0);">Import</button>
            </div>
        <input type="hidden" id="crmtFileName" runat="server"/>
            <input type="hidden" id="sheetName" runat="server"/>
            <input type="hidden" id="tmpServerFileName" runat="server"/>
            </div>
    </div>
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Help">
            <div class="modal-dialog" style="height: 500px; width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Import data help</h4>
                    </div>
                    <div class="modal-body" style="height: 500px; width: 800px;">
                        <div class="form-group">
                            <iframe src="Help/ImportHelp.aspx" style="width: 100%; height: 500px; border: 0;"></iframe>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
    </form>
</body>
</html>
