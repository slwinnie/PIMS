<%@ Page Language="C#" %>

<%
    var db = new PPPEntities();
    var sb = new StringBuilder();
    foreach(var item in db.TProposalRegister)
    {
        var iProjectId = Convert.ToInt32(item.CRMTID);
        var proj = db.TProject.FirstOrDefault(x => x.ProjectId == iProjectId);
        sb.AppendFormat("<tr>");
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", ""); // Project No
        sb.AppendFormat("<td>{0}</td>", item.ProposalName); // Proposal Name
        sb.AppendFormat("<td>{0}</td>", item.Office); // Office
        sb.AppendFormat("<td>{0}</td>", item.CustomerContactName); // Contract Holder
        sb.AppendFormat("<td>{0}</td>", proj.ContractType); // Customer Type
        sb.AppendFormat("<td>{0}</td>", item.NamesOfImmediateClientOrOwner); // Client Name
        sb.AppendFormat("<td>{0}</td>", ""); // Billing Type
        sb.AppendFormat("<td>{0}</td>", ""); // Business Line
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);// Scope of service
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Workshare
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Project Size
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Contract Value
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Start
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // End
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Project Manager
        sb.AppendFormat("<td>{0}</td>", item.CRMTID); // CRMT ID
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Customer Subsector
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Capability Subsector
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Asset type
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo); // Country of asset
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("<td>{0}</td>", item.ProposalNo);
        sb.AppendFormat("</tr>");
    }
     %>