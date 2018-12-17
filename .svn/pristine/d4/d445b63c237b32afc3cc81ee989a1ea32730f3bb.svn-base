<%@ Page Language="C#" %>


<%
    var file = Request.Files[0];
    var desc = Request["fuDesc"];
    var iprojectId = Convert.ToInt32(Request["projectId"]);
    var isubId = Convert.ToInt32(Request["subId"]);
    //var no = Request["no"];
    
    var db = new PPPEntities();
    if (db.BNBAttach.Any(x => x.ProjectId == iprojectId && x.SubId == isubId && x.FileName.ToLower() == file.FileName))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "File Name exist.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        try
        {
            var item = new BNBAttach();
            item.ProjectId = iprojectId;
            item.SubId = isubId;
            item.No = "";
            item.Description = desc;
            var fn = new System.IO.FileInfo(file.FileName).Name;
            var svrFileName = file.FileName;
            if (System.IO.File.Exists(Server.MapPath(string.Format("~/Forms/BNBFiles/{0}", svrFileName))))
            {
                svrFileName = string.Format("P{0}-{1}", iprojectId, fn);
            }
            item.FileName = svrFileName;
            item.UploadBy = SystemHelper.GetUserName(SystemHelper.DomainUserName()).ToString();
            item.UploadDate = DateTime.Now;
            if (db.BNBAttach.Any(x => x.ProjectId == iprojectId && x.SubId == isubId))
            {
                item.Seq = db.BNBAttach.Where(x => x.ProjectId == iprojectId && x.SubId == isubId).Max(x => x.Seq) + 1;
            }
            else
            {
                item.Seq = 1;
            }
            db.BNBAttach.Add(item);
            db.SaveChanges();
            file.SaveAs(Server.MapPath(string.Format("~/Forms/BNBFiles/{0}", svrFileName)));
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK");
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
        catch (Exception ex)
        {
            var sb = new StringBuilder();
            sb.AppendFormat("{{");
            sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
            sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", ex.Message);
            sb.AppendFormat("}}");
            Response.Write(sb.ToString());
        }
    }

%>