<%@ Page Language="C#" %>
<%
    try
    {
        var proxy = new cnbeiwpweb02v.TS_StaffInfoForProjectSoapClient();
        var db = new PPPEntities();
        var dataList = proxy.get_staffInfo_All();
        //var qq = from x in dataList
        //         select new
        //         {
        //             x.staffCode,
        //         };
        //var qq2 = qq.ToList();
        // Update & Append
        foreach (var s in dataList)
        {
            var employeeId = Convert.ToInt32(s.staffCode.Replace("\\t", string.Empty));
            if (employeeId == 0)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("{{");
                sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
                sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", string.Format("Invalid StaffCode:{0}", s.staffCode));
                sb.AppendFormat("}}");
                Response.Write(sb.ToString());
                return;
            }
            var p = db.TPeople.FirstOrDefault(x => x.EmployeeId == employeeId);
            if (p == null)
            {
                p = new TPeople();
                p.EmployeeId = employeeId;
                p.Status = "Disabled";
                p.Password = "e10adc3949ba59abbe56e057f20f883e";
                p.LineManagerId = string.IsNullOrEmpty(s.lineManager) ? (int?)null : Convert.ToInt32(s.lineManager);
                p.Operation = s.Operation;
                db.TPeople.Add(p);
                db.SaveChanges();
            }
            p.StaffType = s.staffType;
            p.PeopleNameChs = s.staffCNName;
            p.PeopleNameEn = s.staffENName;
            p.Dispiline = s.discipline;
            p.Office = s.office;
            p.Title = s.title;
            if (p.EmployeeId != 10007)
            {
                p.Email = s.Email; // Karl Qiu Hong
            }
            try
            {
                p.LineManagerId = string.IsNullOrEmpty(s.lineManager) ? (int?)null : Convert.ToInt32(s.lineManager);
            }
            catch (Exception)
            {

                p.LineManagerId = (int?) null;
            }

            p.Operation = s.Operation;
        }
        // Delete
        var delList = new List<TPeople>();
        foreach (var p in db.TPeople)
        {
            var staffCode = p.EmployeeId.ToString();
            if (dataList.All(x => x.staffCode != staffCode))
            {
                delList.Add(p);
            }
        }
        for (var i = delList.Count - 1; i >= 0; i--)
        {
            var p = delList[i];
            db.TPeople.Remove(delList[i]);
            var peoples = db.TProjectOwner.Where(x => x.EmployeeId == p.EmployeeId);
            if (peoples.Any())
            {
                foreach(var p1 in peoples)
                {
                    var ranges = db.TProjectOwner.Where(x => x.EmployeeId == p1.EmployeeId);
                    if (ranges.Any())
                    {
                        db.TProjectOwner.RemoveRange(ranges);
                    }
                }
                db.TProjectOwner.RemoveRange(peoples);
            }
        }
        delList.Clear();
        db.SaveChanges();
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }
    catch (Exception ex)
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
    }
%>
