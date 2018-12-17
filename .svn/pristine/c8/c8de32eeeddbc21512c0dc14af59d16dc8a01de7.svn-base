<%@ Page Language="C#" %>
<%
    var db = new PPPEntities();
    var staffInfo = new TStaffingBasicInfo();
    var position = Request["NewPosition"];
    var employeeId = Request["NewEmployeeId"];
    var peopleName = Request["NewPeople"];
    var office = Request["NewOffice"];
    var discipline = Request["NewDiscipline"];
    var title = Request["NewTitle"];
    var company = Request["NewCompany"];
    var sellingRate = Request["NewSellingRate"];
    var unit = Request["NewUnit"];
    staffInfo.ProjectNo = Request["ProjectNo"];
    staffInfo.Type = Request["Type"];
    staffInfo.Position = position;
    staffInfo.EmployeeId = Convert.ToInt32(employeeId);
    staffInfo.PeopleName = peopleName;
    staffInfo.Office = office;
    staffInfo.Discipline = discipline;
    staffInfo.Title = title;
    staffInfo.Company = company;
    staffInfo.SellingRate = string.IsNullOrEmpty(sellingRate) ? 0 : Convert.ToDecimal(sellingRate);
    staffInfo.Unit = unit;
    if (db.TStaffingBasicInfo.Any())
    {
        staffInfo.No = db.TStaffingBasicInfo.Max((x => x.No)) + 1;
    }
    else
    {
        staffInfo.No = 1;
    }
    
    db.TStaffingBasicInfo.Add(staffInfo);
    db.SaveChanges();

    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>