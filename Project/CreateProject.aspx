<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%SystemHelper.SetPageNo(this, "Create Project"); %>
SystemHelper.SessionCheck(this);
<!DOCTYPE html>

<script runat="server">

    private void btnSave_OnServerClick(object sender, EventArgs e)
    {
        
        var db = new PPPEntities();
        var iProjectId = 0;

        var pids = db.TProject.Where(x => x.ProjectId < 0);
        if (!pids.Any())
        {
            iProjectId = -1;
        }
        else
        {
            var min = pids.Min(x => x.ProjectId);
            iProjectId = min - 1;
        }

        var owner = new TProjectOwner();
        owner.ProjectId = iProjectId;
        owner.EmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
        db.TProjectOwner.Add(owner);
        var prj = new TProject();

        prj.ProjectId = iProjectId;
        prj.ProjectName = projectName.Value;

        prj.CreatedDate = DateTime.Now;
        prj.CreatedBy = SystemHelper.GetUserName(SystemHelper.DomainUserName()).ToString();
        db.TProject.Add(prj);
        db.SaveChanges();
        Response.Redirect("MyProjectInitiation.aspx");
        //Response.Write(string.Format("<script>alert('OK.');<{0}>", "/script"));
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        label {
            font-weight: normal !important;
        }
    </style>
    <script>
        $(function() {
            $('#form1').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {/*验证*/
                    projectName: {
                        message: 'Invalid Project Name',
                        validators: {
                            notEmpty: {
                                message: 'Project Name is required'
                            },
                            stringLength: {
                                min: 2,
                                max: 200,
                                message: 'Project Name valid length is between 2 and 500'
                            }
                        }
                    }
                }
            });
            $(".save-change").click(function() {
                var bootstrapValidator = $("#form1").data('bootstrapValidator');
                bootstrapValidator.validate();

                return bootstrapValidator.isValid();;
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <a href="<%=ResolveUrl("~/Project/Default.aspx") %>" class=" btn-default btn-create">Project Initiation</a> > Create Project
    <div class="container">
        <h4 class="text-center">Create Project</h4>
        <!-- field list start -->
        <div class="col-lg-2 col-md-2"></div>
        <div class="col-lg-8 col-md-8 col-sm-12">
            <div class="form-group">
                <label>Project Name</label>
                <input type="text" id="projectName" name="projectName" runat="server" class="form-control" />
                <span class="prompt">Client + Project Title + Phase and/or Service</span>
            </div>
        </div>
        <div class="col-lg-2 col-md-2"></div>
        <!-- field list end -->
    </div>
        <p class="text-center">
            <a href="javascript:void(0);" class="save-change btn btn-primary" runat="server" id="btnSave" OnServerClick="btnSave_OnServerClick">Create</a>
            <br/><br/><br/><br/>
        </p>
    </form>
</body>
</html>
