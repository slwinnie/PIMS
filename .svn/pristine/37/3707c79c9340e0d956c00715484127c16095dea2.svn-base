<%@ Page Language="C#" %>
<%@ Import Namespace="cnbeiwpweb02v" %>

<%
    var db = new PPPEntities();
    var position = Request["editPosition"];
    var employeeId = Convert.ToInt32(Request["editEmployeeId"]);
    var peopleName = Request["editPeople"];
    var office = Request["editOffice"];
    var discipline = Request["editDiscipline"];
    var title = Request["editTitle"];
    var company = Request["editCompany"];
    var sellingRate = Request["editSellingRate"];
    var unit = Request["editUnit"];

    var staffInfo = db.TStaffingBasicInfo.FirstOrDefault(x => x.EmployeeId == employeeId);
    if (staffInfo != null)
    {
        staffInfo.Position = position;
        staffInfo.EmployeeId = Convert.ToInt32(employeeId);
        staffInfo.PeopleName = peopleName;
        staffInfo.Office = office;
        staffInfo.Discipline = discipline;
        staffInfo.Title = title;
        staffInfo.Company = company;
        staffInfo.SellingRate = Convert.ToDecimal(sellingRate);
        staffInfo.Unit = unit;
    }
    db.SaveChanges();

    var sb = new StringBuilder();
    sb.AppendFormat("{{");
    sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
    sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
    sb.AppendFormat("}}");
    Response.Write(sb.ToString());

%>