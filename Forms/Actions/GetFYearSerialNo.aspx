<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var fYear = db.TFYear.First();
    var objserialNo = db.TFYearSerial.FirstOrDefault(x => x.FYear == fYear.FYear);
    if (objserialNo == null)
    {
        var item = new TFYearSerial();
        item.FYear = fYear.FYear;
        item.NextSerialNo = 1;
        db.TFYearSerial.Add(item);
        db.SaveChanges();
        Response.Write("001");
    }
    else
    {
        Response.Write(objserialNo.NextSerialNo.ToString().PadLeft(3, '0'));
    }
%>
