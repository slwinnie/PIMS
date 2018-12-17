<%@ Page Language="C#" %>

<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<!DOCTYPE html>
<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Form");
        SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            var db = new PPPEntities();

            // Project Type *
            t2.Items.Add(new ListItem("", "-1"));
            t2.Items.Add(new ListItem("Standalone", "Standalone"));
            t2.Items.Add(new ListItem("Portfolio Management", "Portfolio Management"));
            t2.Items.Add(new ListItem("Proposal", "Proposal"));
            // WP Contracting Entity or JV*
            t3.Items.Add(new ListItem("", "-1"));
            t3.Items.Add(new ListItem("WPC - Beijing WorleyParsons Engineering and Technology Co., Ltd. ", "WPC"));
            t3.Items.Add(new ListItem("WPCNJ - Beijing WorleyParsons Engineering and Technology Co., Ltd. Nanjing Branch", "WPCNJ"));
            t3.Items.Add(new ListItem("WPCSH - Beijing WorleyParsons Engineering and Technology Co., Ltd. Shanghai Branch", "WPCSH"));
            t3.Items.Add(new ListItem("UNET - Beijing WorleyParsons Project Management Co., Ltd.", "UNET"));
            t3.Items.Add(new ListItem("LYG - Lianyungang WorleyParsons Engineering Co., Ltd.", "LYG"));
            t3.Items.Add(new ListItem("LYGBJ - Lianyungang WorleyParsons Engineering Co., Ltd. Beijing Branch", "LYGBJ"));
            t3.Items.Add(new ListItem("LYGCD - Lianyungang WorleyParsons Engineering Co., Ltd. Chengdu Branch", "LYGCD"));
            t3.Items.Add(new ListItem("LYGNJ - Lianyungang WorleyParsons Engineering Co., Ltd. Nanjing Branch", "LYGNJ"));
            t3.Items.Add(new ListItem("LYGSH - Lianyungang WorleyParsons Engineering Co., Ltd. Shanghai Branch", "LYGSH"));
            t3.Items.Add(new ListItem("LYGTJ - Lianyungang WorleyParsons Engineering Co., Ltd. Tianjin Branch", "LYGTJ"));
            t3.Items.Add(new ListItem("MPEC - Beijing MaisonParsons Engineering & Technology Co., Ltd.", "MPEC"));
            t3.Items.Add(new ListItem("TJWPC - Tianjin WorleyParsons Engineering and Technology Co., Ltd.", "TJWPC"));
            t3.Items.Add(new ListItem("CDWPC - Chengdu WorleyParsons Engineering and Technology Co; Ltd.", "CDWPC"));
            // Business Line *
            t4.Items.Add(new ListItem("Major Projects", "Major Projects"));
            t4.Items.Add(new ListItem("Services", "Services"));
            t4.Items.Add(new ListItem("Integrated Solutions", "Integrated Solutions"));
            t4.Items.Add(new ListItem("Advisian", "Advisian"));
            // Capability Subsector *
            t50.Items.Add(new ListItem("", "-1"));
            t50.Items.Add(new ListItem("2001 Bauxite and Alumina", "2001"));
            t50.Items.Add(new ListItem("2002 Aluminium", "2002"));
            t50.Items.Add(new ListItem("2003 Base Metals", "2003"));
            t50.Items.Add(new ListItem("2004 Coal", "2004"));
            t50.Items.Add(new ListItem("2005 Mined Fertilizers", "2005"));
            t50.Items.Add(new ListItem("2006 Iron Ore", "2006"));
            t50.Items.Add(new ListItem("2007 Precious Metals", "2007"));
            t50.Items.Add(new ListItem("2050 Inorganic Chemicals", "2050"));
            t50.Items.Add(new ListItem("2051 Petrochemicals", "2051"));
            t50.Items.Add(new ListItem("2052 Polymers", "2052"));
            t50.Items.Add(new ListItem("2053 Specialty Chemicals", "2053"));
            t50.Items.Add(new ListItem("3001 Environment and Society", "3001"));
            t50.Items.Add(new ListItem("3002 Geoscience", "3002"));
            t50.Items.Add(new ListItem("3003 Marine and Coastal Facilities", "3003"));
            t50.Items.Add(new ListItem("3004 Rail", "3004"));
            t50.Items.Add(new ListItem("3005 Restore", "3005"));
            t50.Items.Add(new ListItem("3006 Roads and Airports", "3006"));
            t50.Items.Add(new ListItem("3007 Social and Industrial Facilities", "3007"));
            t50.Items.Add(new ListItem("3008 Water", "3008"));
            t50.Items.Add(new ListItem("3009 Fossil Energy", "3009"));
            t50.Items.Add(new ListItem("3010 New Energy and Renewables", "3010"));
            t50.Items.Add(new ListItem("3011 Nuclear", "3011"));
            t50.Items.Add(new ListItem("3012 Power Networks", "3012"));
            t50.Items.Add(new ListItem("3013 Resource Infrastructure", "3013"));
            t50.Items.Add(new ListItem("4001 Heavy Oil and Sands", "4001"));
            t50.Items.Add(new ListItem("4002 LNG", "4002"));
            t50.Items.Add(new ListItem("4003 Offshore - Topsides and Fixed Substructures", "4003"));
            t50.Items.Add(new ListItem("4004 Onshore – Conventional Oil and Gas", "4004"));
            t50.Items.Add(new ListItem("4005 Onshore Pipeline Systems", "4005"));
            t50.Items.Add(new ListItem("4006 Refining", "4006"));
            t50.Items.Add(new ListItem("4007 Subsea and Floating Systems", "4007"));
            t50.Items.Add(new ListItem("4008 Sulphur", "4008"));
            t50.Items.Add(new ListItem("4009 Unconventional Oil and Gas", "4009"));
            t50.Items.Add(new ListItem("5001 Specialist Advisian Capability", "5001"));

            // Country of Asset *
            t54.Items.Add(new ListItem("", ""));
            t54.Items.Add(new ListItem("Afghanistan", "Afghanistan"));
            t54.Items.Add(new ListItem("Albania", "Albania"));
            t54.Items.Add(new ListItem("Algeria", "Algeria"));
            t54.Items.Add(new ListItem("Andorra", "Andorra"));
            t54.Items.Add(new ListItem("Angola", "Angola"));
            t54.Items.Add(new ListItem("Anguilla", "Anguilla"));
            t54.Items.Add(new ListItem("Antigua & Barbuda", "Antigua & Barbuda"));
            t54.Items.Add(new ListItem("Argentina", "Argentina"));
            t54.Items.Add(new ListItem("Armenia", "Armenia"));
            t54.Items.Add(new ListItem("Australia", "Australia"));
            t54.Items.Add(new ListItem("Austria", "Austria"));
            t54.Items.Add(new ListItem("Azerbaijan", "Azerbaijan"));
            t54.Items.Add(new ListItem("Bahamas", "Bahamas"));
            t54.Items.Add(new ListItem("Bahrain", "Bahrain"));
            t54.Items.Add(new ListItem("Bangladesh", "Bangladesh"));
            t54.Items.Add(new ListItem("Barbados", "Barbados"));
            t54.Items.Add(new ListItem("Belarus", "Belarus"));
            t54.Items.Add(new ListItem("Belgium", "Belgium"));
            t54.Items.Add(new ListItem("Belize", "Belize"));
            t54.Items.Add(new ListItem("Benin", "Benin"));
            t54.Items.Add(new ListItem("Bermuda", "Bermuda"));
            t54.Items.Add(new ListItem("Bhutan", "Bhutan"));
            t54.Items.Add(new ListItem("Bolivia", "Bolivia"));
            t54.Items.Add(new ListItem("Bosnia & Herzegovina", "Bosnia & Herzegovina"));
            t54.Items.Add(new ListItem("Botswana", "Botswana"));
            t54.Items.Add(new ListItem("Brazil", "Brazil"));
            t54.Items.Add(new ListItem("Brunei Darussalam", "Brunei Darussalam"));
            t54.Items.Add(new ListItem("Bulgaria", "Bulgaria"));
            t54.Items.Add(new ListItem("Burkina Faso", "Burkina Faso"));
            t54.Items.Add(new ListItem("Myanmar/Burma", "Myanmar/Burma"));
            t54.Items.Add(new ListItem("Burundi", "Burundi"));
            t54.Items.Add(new ListItem("Cambodia", "Cambodia"));
            t54.Items.Add(new ListItem("Cameroon", "Cameroon"));
            t54.Items.Add(new ListItem("Canada", "Canada"));
            t54.Items.Add(new ListItem("Cape Verde", "Cape Verde"));
            t54.Items.Add(new ListItem("Cayman Islands", "Cayman Islands"));
            t54.Items.Add(new ListItem("Central African Republic", "Central African Republic"));
            t54.Items.Add(new ListItem("Chad", "Chad"));
            t54.Items.Add(new ListItem("Chile", "Chile"));
            t54.Items.Add(new ListItem("China", "China"));
            t54.Items.Add(new ListItem("Colombia", "Colombia"));
            t54.Items.Add(new ListItem("Comoros", "Comoros"));
            t54.Items.Add(new ListItem("Congo", "Congo"));
            t54.Items.Add(new ListItem("Costa Rica", "Costa Rica"));
            t54.Items.Add(new ListItem("Croatia", "Croatia"));
            t54.Items.Add(new ListItem("Cuba", "Cuba"));
            t54.Items.Add(new ListItem("Cyprus", "Cyprus"));
            t54.Items.Add(new ListItem("Czech Republic", "Czech Republic"));
            t54.Items.Add(new ListItem("Democratic Republic of the Congo", "Democratic Republic of the Congo"));
            t54.Items.Add(new ListItem("Denmark", "Denmark"));
            t54.Items.Add(new ListItem("Djibouti", "Djibouti"));
            t54.Items.Add(new ListItem("Dominica", "Dominica"));
            t54.Items.Add(new ListItem("Dominican Republic", "Dominican Republic"));
            t54.Items.Add(new ListItem("Ecuador", "Ecuador"));
            t54.Items.Add(new ListItem("Egypt", "Egypt"));
            t54.Items.Add(new ListItem("El Salvador", "El Salvador"));
            t54.Items.Add(new ListItem("Equatorial Guinea", "Equatorial Guinea"));
            t54.Items.Add(new ListItem("Eritrea", "Eritrea"));
            t54.Items.Add(new ListItem("Estonia", "Estonia"));
            t54.Items.Add(new ListItem("Ethiopia", "Ethiopia"));
            t54.Items.Add(new ListItem("Fiji", "Fiji"));
            t54.Items.Add(new ListItem("Finland", "Finland"));
            t54.Items.Add(new ListItem("France", "France"));
            t54.Items.Add(new ListItem("French Guiana", "French Guiana"));
            t54.Items.Add(new ListItem("Gabon", "Gabon"));
            t54.Items.Add(new ListItem("Gambia", "Gambia"));
            t54.Items.Add(new ListItem("Georgia", "Georgia"));
            t54.Items.Add(new ListItem("Germany", "Germany"));
            t54.Items.Add(new ListItem("Ghana", "Ghana"));
            t54.Items.Add(new ListItem("Great Britain", "Great Britain"));
            t54.Items.Add(new ListItem("Greece", "Greece"));
            t54.Items.Add(new ListItem("Grenada", "Grenada"));
            t54.Items.Add(new ListItem("Guadeloupe", "Guadeloupe"));
            t54.Items.Add(new ListItem("Guatemala", "Guatemala"));
            t54.Items.Add(new ListItem("Guinea", "Guinea"));
            t54.Items.Add(new ListItem("Guinea-Bissau", "Guinea-Bissau"));
            t54.Items.Add(new ListItem("Guyana", "Guyana"));
            t54.Items.Add(new ListItem("Haiti", "Haiti"));
            t54.Items.Add(new ListItem("Honduras", "Honduras"));
            t54.Items.Add(new ListItem("Hungary", "Hungary"));
            t54.Items.Add(new ListItem("Iceland", "Iceland"));
            t54.Items.Add(new ListItem("India", "India"));
            t54.Items.Add(new ListItem("Indonesia", "Indonesia"));
            t54.Items.Add(new ListItem("Iran", "Iran"));
            t54.Items.Add(new ListItem("Iraq", "Iraq"));
            t54.Items.Add(new ListItem("Israel and the Occupied Territories", "Israel and the Occupied Territories"));
            t54.Items.Add(new ListItem("Italy", "Italy"));
            t54.Items.Add(new ListItem("Ivory Coast (Cote d'Ivoire)", "Ivory Coast (Cote d'Ivoire)"));
            t54.Items.Add(new ListItem("Jamaica", "Jamaica"));
            t54.Items.Add(new ListItem("Japan", "Japan"));
            t54.Items.Add(new ListItem("Jordan", "Jordan"));
            t54.Items.Add(new ListItem("Kazakhstan", "Kazakhstan"));
            t54.Items.Add(new ListItem("Kenya", "Kenya"));
            t54.Items.Add(new ListItem("Kosovo", "Kosovo"));
            t54.Items.Add(new ListItem("Kuwait", "Kuwait"));
            t54.Items.Add(new ListItem("Kyrgyz Republic (Kyrgyzstan)", "Kyrgyz Republic (Kyrgyzstan)"));
            t54.Items.Add(new ListItem("Laos", "Laos"));
            t54.Items.Add(new ListItem("Latvia", "Latvia"));
            t54.Items.Add(new ListItem("Lebanon", "Lebanon"));
            t54.Items.Add(new ListItem("Lesotho", "Lesotho"));
            t54.Items.Add(new ListItem("Liberia", "Liberia"));
            t54.Items.Add(new ListItem("Libya", "Libya"));
            t54.Items.Add(new ListItem("Liechtenstein", "Liechtenstein"));
            t54.Items.Add(new ListItem("Lithuania", "Lithuania"));
            t54.Items.Add(new ListItem("Luxembourg", "Luxembourg"));
            t54.Items.Add(new ListItem("Republic of Macedonia", "Republic of Macedonia"));
            t54.Items.Add(new ListItem("Madagascar", "Madagascar"));
            t54.Items.Add(new ListItem("Malawi", "Malawi"));
            t54.Items.Add(new ListItem("Malaysia", "Malaysia"));
            t54.Items.Add(new ListItem("Maldives", "Maldives"));
            t54.Items.Add(new ListItem("Mali", "Mali"));
            t54.Items.Add(new ListItem("Malta", "Malta"));
            t54.Items.Add(new ListItem("Martinique", "Martinique"));
            t54.Items.Add(new ListItem("Mauritania", "Mauritania"));
            t54.Items.Add(new ListItem("Mauritius", "Mauritius"));
            t54.Items.Add(new ListItem("Mayotte", "Mayotte"));
            t54.Items.Add(new ListItem("Mexico", "Mexico"));
            t54.Items.Add(new ListItem("Moldova, Republic of Moldova", "Moldova, Republic of Moldova"));
            t54.Items.Add(new ListItem("Monaco", "Monaco"));
            t54.Items.Add(new ListItem("Mongolia", "Mongolia"));
            t54.Items.Add(new ListItem("Montenegro", "Montenegro"));
            t54.Items.Add(new ListItem("Montserrat", "Montserrat"));
            t54.Items.Add(new ListItem("Morocco", "Morocco"));
            t54.Items.Add(new ListItem("Mozambique", "Mozambique"));
            t54.Items.Add(new ListItem("Namibia", "Namibia"));
            t54.Items.Add(new ListItem("Nepal", "Nepal"));
            t54.Items.Add(new ListItem("Netherlands", "Netherlands"));
            t54.Items.Add(new ListItem("New Zealand", "New Zealand"));
            t54.Items.Add(new ListItem("Nicaragua", "Nicaragua"));
            t54.Items.Add(new ListItem("Niger", "Niger"));
            t54.Items.Add(new ListItem("Nigeria", "Nigeria"));
            t54.Items.Add(new ListItem("Korea, Democratic Republic of (North Korea)", "Korea, Democratic Republic of (North Korea)"));
            t54.Items.Add(new ListItem("Norway", "Norway"));
            t54.Items.Add(new ListItem("Oman", "Oman"));
            t54.Items.Add(new ListItem("Pacific Islands", "Pacific Islands"));
            t54.Items.Add(new ListItem("Pakistan", "Pakistan"));
            t54.Items.Add(new ListItem("Panama", "Panama"));
            t54.Items.Add(new ListItem("Papua New Guinea", "Papua New Guinea"));
            t54.Items.Add(new ListItem("Paraguay", "Paraguay"));
            t54.Items.Add(new ListItem("Peru", "Peru"));
            t54.Items.Add(new ListItem("Philippines", "Philippines"));
            t54.Items.Add(new ListItem("Poland", "Poland"));
            t54.Items.Add(new ListItem("Portugal", "Portugal"));
            t54.Items.Add(new ListItem("Puerto Rico", "Puerto Rico"));
            t54.Items.Add(new ListItem("Qatar", "Qatar"));
            t54.Items.Add(new ListItem("Reunion", "Reunion"));
            t54.Items.Add(new ListItem("Romania", "Romania"));
            t54.Items.Add(new ListItem("Russian Federation", "Russian Federation"));
            t54.Items.Add(new ListItem("Rwanda", "Rwanda"));
            t54.Items.Add(new ListItem("Saint Kitts and Nevis", "Saint Kitts and Nevis"));
            t54.Items.Add(new ListItem("Saint Lucia", "Saint Lucia"));
            t54.Items.Add(new ListItem("Saint Vincent's & Grenadines", "Saint Vincent's & Grenadines"));
            t54.Items.Add(new ListItem("Samoa", "Samoa"));
            t54.Items.Add(new ListItem("Sao Tome and Principe", "Sao Tome and Principe"));
            t54.Items.Add(new ListItem("Saudi Arabia", "Saudi Arabia"));
            t54.Items.Add(new ListItem("Senegal", "Senegal"));
            t54.Items.Add(new ListItem("Serbia", "Serbia"));
            t54.Items.Add(new ListItem("Seychelles", "Seychelles"));
            t54.Items.Add(new ListItem("Sierra Leone", "Sierra Leone"));
            t54.Items.Add(new ListItem("Singapore", "Singapore"));
            t54.Items.Add(new ListItem("Slovak Republic (Slovakia)", "Slovak Republic (Slovakia)"));
            t54.Items.Add(new ListItem("Slovenia", "Slovenia"));
            t54.Items.Add(new ListItem("Solomon Islands", "Solomon Islands"));
            t54.Items.Add(new ListItem("Somalia", "Somalia"));
            t54.Items.Add(new ListItem("South Africa", "South Africa"));
            t54.Items.Add(new ListItem("Korea, Republic of (South Korea)", "Korea, Republic of (South Korea)"));
            t54.Items.Add(new ListItem("South Sudan", "South Sudan"));
            t54.Items.Add(new ListItem("Spain", "Spain"));
            t54.Items.Add(new ListItem("Sri Lanka", "Sri Lanka"));
            t54.Items.Add(new ListItem("Sudan", "Sudan"));
            t54.Items.Add(new ListItem("Suriname", "Suriname"));
            t54.Items.Add(new ListItem("Swaziland", "Swaziland"));
            t54.Items.Add(new ListItem("Sweden", "Sweden"));
            t54.Items.Add(new ListItem("Switzerland", "Switzerland"));
            t54.Items.Add(new ListItem("Syria", "Syria"));
            t54.Items.Add(new ListItem("Tajikistan", "Tajikistan"));
            t54.Items.Add(new ListItem("Tanzania", "Tanzania"));
            t54.Items.Add(new ListItem("Thailand", "Thailand"));
            t54.Items.Add(new ListItem("Timor Leste", "Timor Leste"));
            t54.Items.Add(new ListItem("Togo", "Togo"));
            t54.Items.Add(new ListItem("Trinidad & Tobago", "Trinidad & Tobago"));
            t54.Items.Add(new ListItem("Tunisia", "Tunisia"));
            t54.Items.Add(new ListItem("Turkey", "Turkey"));
            t54.Items.Add(new ListItem("Turkmenistan", "Turkmenistan"));
            t54.Items.Add(new ListItem("Turks & Caicos Islands", "Turks & Caicos Islands"));
            t54.Items.Add(new ListItem("Uganda", "Uganda"));
            t54.Items.Add(new ListItem("Ukraine", "Ukraine"));
            t54.Items.Add(new ListItem("United Arab Emirates", "United Arab Emirates"));
            t54.Items.Add(new ListItem("United States of America (USA)", "United States of America (USA)"));
            t54.Items.Add(new ListItem("Uruguay", "Uruguay"));
            t54.Items.Add(new ListItem("Uzbekistan", "Uzbekistan"));
            t54.Items.Add(new ListItem("Venezuela", "Venezuela"));
            t54.Items.Add(new ListItem("Vietnam", "Vietnam"));
            t54.Items.Add(new ListItem("Virgin Islands (UK)", "Virgin Islands (UK)"));
            t54.Items.Add(new ListItem("Virgin Islands (US)", "Virgin Islands (US)"));
            t54.Items.Add(new ListItem("Yemen", "Yemen"));
            t54.Items.Add(new ListItem("Zambia", "Zambia"));
            t54.Items.Add(new ListItem("Zimbabwe", "Zimbabwe"));

            // Asset Type
            t55.Items.Add(new ListItem("", ""));
            t55.Items.Add(new ListItem("Greenfield", "Greenfield"));
            t55.Items.Add(new ListItem("Brownfield", "Brownfield"));

            // Advisian Business Line
            t5.Items.Add(new ListItem("To be completed for Advisian work only - Not Applicable", ""));
            t5.Items.Add(new ListItem("50001 Advisian", "50001"));
            t5.Items.Add(new ListItem("50002 Advisian Management Consulting", "50002"));
            t5.Items.Add(new ListItem("50003 Advisian Technical Consulting", "50003"));
            t5.Items.Add(new ListItem("50004 Advisian Intecsea", "50004"));
            t5.Items.Add(new ListItem("50005 Advisian Digital Enterprise", "50005"));

            // Advisian Service Line
            t48.Items.Add(new ListItem("To be completed for Advisian work only - Not Applicable", ""));
            t48.Items.Add(new ListItem("7901 Strategy", "7901"));
            t48.Items.Add(new ListItem("7902 Business Case", "7902"));
            t48.Items.Add(new ListItem("7903 Transaction Service", "7903"));
            t48.Items.Add(new ListItem("7904 Onshore Hydrocarbons", "7904"));
            t48.Items.Add(new ListItem("7905 PPP and Procurement", "7905"));
            t48.Items.Add(new ListItem("7906 Operations Excellence", "7906"));
            t48.Items.Add(new ListItem("7907 Capital Project Advisory", "7907"));
            t48.Items.Add(new ListItem("7908 Decommissioning and Restoration", "7908"));
            t48.Items.Add(new ListItem("7909 Contracting Strategy, Expert Witness and Dispute Resolution", "7909"));
            t48.Items.Add(new ListItem("7910 Decision and Risk Analysis", "7910"));
            t48.Items.Add(new ListItem("7911 People and Oranization", "7911"));
            t48.Items.Add(new ListItem("7912 Digital Enterprise", "7912"));
            t48.Items.Add(new ListItem("7913 Software and Analytics", "7913"));
            t48.Items.Add(new ListItem("7914 Safety & Risk", "7914"));
            t48.Items.Add(new ListItem("7915 Environment and Society", "7915"));
            t48.Items.Add(new ListItem("7916 Geoscience", "7916"));
            t48.Items.Add(new ListItem("7917 Water Utilities", "7917"));
            t48.Items.Add(new ListItem("7918 Power Specialist Services", "7918"));
            t48.Items.Add(new ListItem("7919 Transport & Master Planning", "7919"));
            t48.Items.Add(new ListItem("7920 Engineering", "7920"));
            t48.Items.Add(new ListItem("7921 Project Management", "7921"));
            t48.Items.Add(new ListItem("7922 M&M - Concept / Feasibility", "7922"));
            t48.Items.Add(new ListItem("7923 New Energy", "7923"));
            t48.Items.Add(new ListItem("7924 Subsea", "7924"));
            t48.Items.Add(new ListItem("7925 Pipelines", "7925"));
            t48.Items.Add(new ListItem("7926 Floating Structure", "7926"));
            t48.Items.Add(new ListItem("7927 Asset Solutions", "7927"));
            t48.Items.Add(new ListItem("7928 Offshore Hydrocarbons", "7928"));
            t48.Items.Add(new ListItem("7929 Downstream", "7929"));
            t48.Items.Add(new ListItem("7930 Sulphur", "7930"));
            t48.Items.Add(new ListItem("7931 Ports & Marine Terminals(PMT)", "7931"));
            t48.Items.Add(new ListItem("7932 Water Resources", "7932"));

            // GBS Project Template *
            t8.Items.Add(new ListItem("", "-1"));
            t8.Items.Add(new ListItem("T01 - Project Level", "T01 - Project Level"));
            t8.Items.Add(new ListItem("T02 - Top Task - default unless advise by project controls", "T02 - Top Task - default unless advise by project controls"));
            t8.Items.Add(new ListItem("T03 - Proposal", "T03 - Proposal"));
            // Customer Type *
            //t12.Items.Add(new ListItem("", "-1"));
            t12.Items.Add(new ListItem("Internal", "Internal"));
            t12.Items.Add(new ListItem("External", "External"));
            // Internal Entity *
            t13.Items.Add(new ListItem("", "-1"));
            t13.Items.Add(new ListItem("WPC - Beijing WorleyParsons Engineering and Technology Co., Ltd. ", "WPC"));
            t13.Items.Add(new ListItem("WPCNJ - Beijing WorleyParsons Engineering and Technology Co., Ltd. Nanjing Branch", "WPCNJ"));
            t13.Items.Add(new ListItem("WPCSH - Beijing WorleyParsons Engineering and Technology Co., Ltd. Shanghai Branch", "WPCSH"));
            t13.Items.Add(new ListItem("UNET - Beijing WorleyParsons Project Management Co., Ltd.", "UNET"));
            t13.Items.Add(new ListItem("LYG - Lianyungang WorleyParsons Engineering Co., Ltd.", "LYG"));
            t13.Items.Add(new ListItem("LYGBJ - Lianyungang WorleyParsons Engineering Co., Ltd. Beijing Branch", "LYGBJ"));
            t13.Items.Add(new ListItem("LYGCD - Lianyungang WorleyParsons Engineering Co., Ltd. Chengdu Branch", "LYGCD"));
            t13.Items.Add(new ListItem("LYGNJ - Lianyungang WorleyParsons Engineering Co., Ltd. Nanjing Branch", "LYGNJ"));
            t13.Items.Add(new ListItem("LYGSH - Lianyungang WorleyParsons Engineering Co., Ltd. Shanghai Branch", "LYGSH"));
            t13.Items.Add(new ListItem("LYGTJ - Lianyungang WorleyParsons Engineering Co., Ltd. Tianjin Branch", "LYGTJ"));
            t13.Items.Add(new ListItem("MPEC - Beijing MaisonParsons Engineering & Technology Co., Ltd.", "MPEC"));
            t13.Items.Add(new ListItem("TJWPC - Tianjin WorleyParsons Engineering and Technology Co., Ltd.", "TJWPC"));
            t13.Items.Add(new ListItem("CDWPC - Chengdu WorleyParsons Engineering and Technology Co; Ltd.", "CDWPC"));
            // Contract Currency *
            t20.Items.Add(new ListItem("CNY", "CNY"));
            t20.Items.Add(new ListItem("AUD", "AUD"));
            t20.Items.Add(new ListItem("USD", "USD"));

            // Project Classification by size
            t22.Items.Add(new ListItem("", "-1"));
            t22.Items.Add(new ListItem("Large", "Large"));
            t22.Items.Add(new ListItem("Medium", "Medium"));
            t22.Items.Add(new ListItem("Small", "Small"));

            // Phase
            t52.Items.Add(new ListItem("", ""));
            t52.Items.Add(new ListItem("Identify", "Identify"));
            t52.Items.Add(new ListItem("Evaluate", "Evaluate"));
            t52.Items.Add(new ListItem("Define", "Define"));
            t52.Items.Add(new ListItem("Execute", "Execute"));
            t52.Items.Add(new ListItem("Operate", "Operate"));
            t52.Items.Add(new ListItem("Decommission", "Decommission"));
            // Scope of Services
            t53.Items.Add(new ListItem("", ""));
            t53.Items.Add(new ListItem("Management Consulting", "Management Consulting"));
            t53.Items.Add(new ListItem("Technical Consulting", "Technical Consulting"));
            t53.Items.Add(new ListItem("Due Diligence", "Due Diligence"));
            t53.Items.Add(new ListItem("Design Verification", "Design Verification"));
            t53.Items.Add(new ListItem("Engineering", "Engineering"));
            t53.Items.Add(new ListItem("Procurement", "Procurement"));
            t53.Items.Add(new ListItem("Engineering and Procurement", "Engineering and Procurement"));
            t53.Items.Add(new ListItem("EPC", "EPC"));
            t53.Items.Add(new ListItem("EPCM", "EPCM"));
            t53.Items.Add(new ListItem("Construction", "Construction"));
            t53.Items.Add(new ListItem("Construction Management", "Construction Management"));
            t53.Items.Add(new ListItem("Owner’s Engineering", "Owner’s Engineering"));
            t53.Items.Add(new ListItem("PMC", "PMC"));
            t53.Items.Add(new ListItem("Hook-Up", "Hook-Up"));
            t53.Items.Add(new ListItem("Hook-Up & commissioning", "Hook-Up & commissioning"));
            t53.Items.Add(new ListItem("Commissioning", "Commissioning"));
            t53.Items.Add(new ListItem("Operations & Maintenance", "Operations & Maintenance"));
            t53.Items.Add(new ListItem("Maintenance", "Maintenance"));
            t53.Items.Add(new ListItem("Modifications", "Modifications"));
            t53.Items.Add(new ListItem("Maintenance, Modifications & Operations", "Maintenance, Modifications & Operations"));
            t53.Items.Add(new ListItem("Secondment - External", "Secondment - External"));
            t53.Items.Add(new ListItem("Secondment - Internal", "Secondment - Internal"));


            // Existing WP Contract *
            t26.Items.Add(new ListItem("", "-1"));
            t26.Items.Add(new ListItem("Yes", "Yes"));
            t26.Items.Add(new ListItem("No", "No"));

            // Billing Type *
            t29.Items.Add(new ListItem("", "-1"));
            t29.Items.Add(new ListItem("Reimbursable Schedule of Rates", "Reimbursable Schedule of Rates"));
            t29.Items.Add(new ListItem("Lump Sum", "Lump Sum"));
            t29.Items.Add(new ListItem("Cost Plus", "Cost Plus"));
            t29.Items.Add(new ListItem("Target Incentives", "Target Incentives"));
            t29.Items.Add(new ListItem("Other", "Other"));
            t29.Items.Add(new ListItem("N/A (Proposal)", "N/A (Proposal)"));

            // Contractual basis for commencement of billable work
            t30.Items.Add(new ListItem("Option A", "Option A"));
            t30.Items.Add(new ListItem("Option B", "Option B"));
            t30.Items.Add(new ListItem("Option C", "Option C"));
            t30.Items.Add(new ListItem("Option D", "Option D"));
            t30.Items.Add(new ListItem("N/A", "N/A"));

            t23.Items.Add(new ListItem("Low", "Low"));
            t23.Items.Add(new ListItem("Moderate", "Moderate"));
            t23.Items.Add(new ListItem("High", "High"));

            t49.Items.Add(new ListItem("", "-1"));
            t49.Items.Add(new ListItem("2001 MM: Bauxite and Alumina", "2001"));
            t49.Items.Add(new ListItem("2002 MM: Aluminium", "2002"));
            t49.Items.Add(new ListItem("2003 MM: Base Metals", "2003"));
            t49.Items.Add(new ListItem("2004 MM: Coal", "2004"));
            t49.Items.Add(new ListItem("2005 MM: Mined Fertilizers", "2005"));
            t49.Items.Add(new ListItem("2006 MM: Iron Ore", "2006"));
            t49.Items.Add(new ListItem("2007 MM: Precious Metals", "2007"));
            t49.Items.Add(new ListItem("2050 CH: Inorganic Chemicals", "2050"));
            t49.Items.Add(new ListItem("2051 CH: Petrochemicals (note 1)", "2051"));
            t49.Items.Add(new ListItem("2052 CH: Polymers", "2052"));
            t49.Items.Add(new ListItem("2053 CH: Specialty Chemicals", "2053"));
            t49.Items.Add(new ListItem("3003 I: Marine and Coastal Facilities", "3003"));
            t49.Items.Add(new ListItem("3004 I: Rail", "3004"));
            t49.Items.Add(new ListItem("3006 I: Roads and Airports", "3006"));
            t49.Items.Add(new ListItem("3007 I: Social and Industrial Facilities", "3007"));
            t49.Items.Add(new ListItem("3008 I: Water", "3008"));
            t49.Items.Add(new ListItem("3009 I: Fossil Energy", "3009"));
            t49.Items.Add(new ListItem("3010 I: New Energy and Renewables", "3010"));
            t49.Items.Add(new ListItem("3011 I: Nuclear", "3011"));
            t49.Items.Add(new ListItem("3012 I: Power Networks", "3012"));
            t49.Items.Add(new ListItem("3013 I: Resource Infrastructure", "3013"));
            t49.Items.Add(new ListItem("4001 HC: Heavy Oil and Sands", "4001"));
            t49.Items.Add(new ListItem("4002 HC: LNG", "4002"));
            t49.Items.Add(new ListItem("4003 HC: Offshore - Topsides and Fixed Substructures", "4003"));
            t49.Items.Add(new ListItem("4004 HC: Onshore – Conventional Oil and Gas", "4004"));
            t49.Items.Add(new ListItem("4005 HC: Onshore Pipeline Systems", "4005"));
            t49.Items.Add(new ListItem("4006 HC: Refining", "4006"));
            t49.Items.Add(new ListItem("4007 HC: Subsea and Floating Systems", "4007"));
            t49.Items.Add(new ListItem("4008 HC: Sulphur", "4008"));
            t49.Items.Add(new ListItem("4009 HC: Unconventional Oil and Gas", "4009"));
            t49.Items.Add(new ListItem("4010 HC: Petrochemicals", "4010"));

            var iprojectId = Convert.ToInt32(Request["projectId"]);
            var isubId = Convert.ToInt32(Request["subId"]);
            projectId.Value = Request["projectId"];
            subId.Value = Request["subId"];
            type.Value = Request["type"].ToString().Trim();

            var item = db.NPISForm.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId && x.type == type.Value);
            if (item == null)
            {
                item = new NPISForm();
                item.ProjectId = iprojectId;
                item.SubId = isubId;
                item.type = type.Value;
                item.t1 = t1.Value;
                item.t2 = t2.Value;
                item.t3 = t3.Value;
                item.t4 = t4.Value;
                item.t5 = t5.Value;
                item.t7 = t7.Value;
                item.t8 = t8.Value;
                item.t9 = t9.Value;
                item.t10 = t10.Value;
                item.t11 = t11.Value;
                item.t12 = t12.Value;
                item.t13 = t13.Value;
                item.t14 = t14.Value;
                item.t15 = t15.Value;
                item.t16 = t16.Value;
                item.t17 = t17.Value;
                item.t18 = StringHelper.FmtNumber(t18.Value);
                item.t19 = StringHelper.FmtNumber(t19.Value);
                item.t20 = t20.Value;
                item.t21 = t21.Value;
                item.t22 = t22.Value;
                item.t23 = t23.Value;
                item.t26 = t26.Value;
                item.t27 = t27.Value;
                item.t28 = t28.Value;
                item.t29 = t29.Value;
                item.t30 = t30.Value;
                item.t31 = t31.Value;
                item.t32 = t32.Value;
                item.t33 = t33.Value;
                item.t34 = t34.Value;
                item.t35 = t35.Value;
                item.t36 = t36.Value;
                item.t37 = t37.Value;
                item.t38 = t38.Value;
                item.t39 = t39.Value;
                item.t40 = t40.Value;
                item.t41 = t41.Value;
                item.t42 = t42.Value;
                item.t43 = t43.Value;
                item.t44 = t44.Value;

                //item.t45 = t45.Value;
                item.t46 = t46.Value;
                item.t47 = t47.Value;
                item.t48 = t48.Value;
                item.t49 = t49.Value;
                item.t50 = t50.Value;
                item.t51 = t51.Value;
                item.t52 = t52.Value;
                item.t53 = t53.Value;
                item.t54 = t54.Value;
                item.t55 = t55.Value;
                item.c10 = "true";
                if (type.Value == "1")
                {
                    var pp = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                    if (pp != null)
                    {
                        item.t4 = pp.BusinessLine;
                        item.t7 = pp.BidOffice;
                        item.t9 = pp.ProjectName;
                        item.t11 = pp.ProjectId.ToString();
                        item.t14 = pp.Customer;
                        item.t18 = StringHelper.FmtNumber(pp.EstimatedWork);
                        item.t19 = StringHelper.FmtNumber(pp.WorleyParsonsCV);
                        item.t20 = pp.ContractCurrency;
                        item.t45 = pp.PType == "Chemical"
                            ? "14556"  // 唐滢露 Tang Yinglu
                            : "13116"; // 段立菊 Duan Liju
                        t45.Value = item.t45;

                        t4.Value = pp.BusinessLine;
                        t7.Value = pp.BidOffice;
                        t9.Value = pp.ProjectName;
                        t11.Value = pp.ProjectId.ToString();
                        t14.Value = pp.Customer;
                        t18.Value = pp.EstimatedWork;
                        t19.Value = pp.WorleyParsonsCV;
                        t20.Value = pp.ContractCurrency;
                    }

                    item.c12 = "true"; // 2018/07/12 proposal required.
                }
                else
                {
                    var pp = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                    if (pp != null)
                    {
                        item.t4 = pp.BusinessLine;
                        item.t7 = pp.BidOffice;
                        item.t9 = pp.ProjectName;
                        item.t11 = pp.ProjectId.ToString();
                        item.t14 = pp.Customer;
                        item.t18 = pp.EstimatedWork;
                        item.t19 = pp.WorleyParsonsCV;
                        item.t20 = pp.ContractCurrency;

                        t4.Value = pp.BusinessLine;
                        t7.Value = pp.BidOffice;
                        t9.Value = pp.ProjectName;
                        t11.Value = pp.ProjectId.ToString();
                        t14.Value = pp.Customer;
                        t18.Value = pp.EstimatedWork;
                        t19.Value = pp.WorleyParsonsCV;
                        t20.Value = pp.ContractCurrency;

                        item.t45 = pp.PType == "Chemical"
                            ? "14556"  // 唐滢露 Tang Yinglu
                            : "13116"; // 段立菊 Duan Liju

                        t45.Value = item.t45;
                    }
                    item.c9 = "true";
                    item.c11 = "true";
                }
                var t = Request["type"];
                var risk = db.RiskClassificationForm.Find(iprojectId, isubId, t);
                if (risk != null)
                {
                    t23.Value = risk.projectRisk;
                }
                db.NPISForm.Add(item);

                db.SaveChanges();

                c9.Checked = item.c9 == "true";
                c10.Checked = item.c10 == "true";
                c11.Checked = item.c11 == "true";
                c12.Checked = item.c12 == "true";
            }
            else
            {
                t1.Value = item.t1;
                t2.Value = item.t2;
                t3.Value = item.t3;
                t4.Value = item.t4;
                t5.Value = item.t5;
                t7.Value = item.t7;
                t8.Value = item.t8;
                t9.Value = item.t9;
                t10.Value = item.t10;
                t11.Value = item.t11 = item.t11;
                t12.Value = item.t12;
                t13.Value = item.t13;
                t14.Value = item.t14;
                t15.Value = item.t15;
                t16.Value = item.t16;
                t17.Value = item.t17;
                t18.Value = StringHelper.FmtNumber(item.t18);
                t19.Value = StringHelper.FmtNumber(item.t19);
                t20.Value = item.t20;
                t21.Value = item.t21;
                t22.Value = item.t22;
                t23.Value = item.t23;
                t26.Value = item.t26;
                t27.Value = item.t27;
                t28.Value = item.t28;
                t29.Value = item.t29;
                t30.Value = item.t30;
                t31.Value = item.t31;
                t32.Value = item.t32;
                t33.Value = item.t33;
                t34.Value = item.t34;
                t35.Value = item.t35;
                t36.Value = item.t36;
                t37.Value = item.t37;
                t38.Value = item.t38;
                t39.Value = PeopleHelper.GetPeopleName(item.t39);
                t40.Value = item.t40; // PeopleHelper.GetPeopleName(item.t40);
                t41.Value = item.t41;
                t42.Value = item.t42;
                t43.Value = item.t43;
                t44.Value = item.t44;
                t45.Value = item.t45;
                t46.Value = item.t46;
                t47.Value = item.t47;
                t48.Value = item.t48;
                t49.Value = item.t49;
                t50.Value = item.t50;
                t51.Value = item.t51;
                t52.Value = item.t52;
                t53.Value = item.t53;
                t54.Value = item.t54;
                t55.Value = item.t55;

                c1.Checked = item.c1 == "true";
                c2.Checked = item.c2 == "true";
                c3.Checked = item.c3 == "true";
                c4.Checked = item.c4 == "true";
                c5.Checked = item.c5 == "true";
                c6.Checked = item.c6 == "true";
                c7.Checked = item.c7 == "true";
                c8.Checked = item.c8 == "true";
                c9.Checked = item.c9 == "true";
                c10.Checked = item.c10 == "true";
                c11.Checked = item.c11 == "true";
                c12.Checked = item.c12 == "true";

                rejectBy.InnerText = item.RejectBy;
                rejectComments.InnerText = item.RejectComment;
                if (!string.IsNullOrEmpty(item.RejectBy))
                {
                    rejectSection.Visible = true;
                }
                db.SaveChanges();
            }
            if (type.Value == "1")
            {
                var ppx = db.TProposalX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                if (ppx != null)
                {
                    if (ppx.NPISSubmitDate != null)
                    {
                        islocked.Value = "1";
                    }
                    if (ppx.BidApproveDate != null
                        && ppx.RiskApproveDate != null
                        && ppx.NPISApproveDate != null)
                    {
                        isAllApproved.Value = "1";
                    }

                }
            }
            else
            {
                var ppx = db.TProjectX.FirstOrDefault(x => x.ProjectId == iprojectId && x.SubId == isubId);
                if (ppx != null)
                {
                    if (ppx.NPISSubmitDate != null)
                    {
                        islocked.Value = "1";
                    }
                    if (ppx.BidApproveDate != null
                        && ppx.RiskApproveDate != null
                        && ppx.NPISApproveDate != null)
                    {
                        isAllApproved.Value = "1";
                    }
                }
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Forms/css/npisForm.css") %>" />

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/g.js")%>"></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>"></script>
    <script src="<%=ResolveUrl(string.Format("~/Forms/js/npisForm.js?_={0}", DateTime.Now.Ticks.ToString())) %>")></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>

    <title><%=SystemHelper.SystemName %></title>
    <script>
        $(function () {
            $("#t24").change(function () {
                var selVal = $("#t24 option:selected").val();
                if (selVal === "Engineering_Only") {
                    $("#t25").find("option").remove();
                    $("#t25").append("<option value='Conceptual'>Conceptual</option>");
                    $("#t25").append("<option value='FEED'>FEED</option>");
                    $("#t25").append("<option value='Detail Design'>Detail Design</option>");
                    $("#t25").append("<option value='Due Diligence'>Due Diligence</option>");
                    $("#t25").append("<option value='Design Verification'>Design Verification</option>");
                    $("#t25").append("<option value='Consulting'>Consulting</option>");
                    $("#t25").append("<option value='Owners Engineering'>Owners Engineering</option>");
                } else if (selVal === "Other_Services") {
                    $("#t25").find("option").remove();
                    $("#t25").append("<option value='C'>C</option>");
                    $("#t25").append("<option value='CM'>CM</option>");
                    $("#t25").append("<option value='Commissioning'>Commissioning</option>");
                    $("#t25").append("<option value='EP'>EP</option>");
                    $("#t25").append("<option value='EPC'>EPC</option>");
                    $("#t25").append("<option value='EPCM'>EPCM</option>");
                    $("#t25").append("<option value='O&M'>O&M</option>");
                    $("#t25").append("<option value='P'>P</option>");
                    $("#t25").append("<option value='PMC'>PMC</option>");
                } else if (selVal === "Secondment") {
                    $("#t25").find("option").remove();
                    $("#t25").append("<option value='External'>External</option>");
                    $("#t25").append("<option value='Internal'>Internal</option>");
                } else {
                    $("#t25").find("option").remove();
                }
            });

            $(".show-info1").click(function() {
                $("#modalDialog-info1").modal("show");
            });
            $(".show-info2").click(function () {
                $("#modalDialog-info2").modal("show");
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server" onload="form1_OnLoad">
        <!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" ID="Menu" />
        <!-- 导航菜单::结束 -->
        <!-- 导航地图::开始 -->
        <div>
            <strong>PIMS</strong> > <a href="../Project/Default.aspx">Project Initiation</a> > 
        <% if (Request["type"].ToString() == "1")
           {
        %>
            <a href="../Project/ProposalInitiation.aspx?projectId=<%= Request["projectId"] %>">Proposal</a> > NPIS Form
            <%
           }
           else
           { %>
            <a href="../Project/ProjectInitiation.aspx?projectId=<%= Request["projectId"] %>">Project</a> > New Project Infomation Sheet (NPIS)
            <% } %>
        </div>
        <!-- 导航地图::结束 -->
        <div class="container">
            <h2 class="text-center">New Project Infomation Sheet (NPIS)</h2>
            <div class="text-right">
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                    <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                    <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                    <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                <% if (Request["type"] == "2")
                   {
                       %><a href="javascript:void(0);" class="btn btn-default copyFromProposal">Copy from proposal</a><%
                   }
                %>
                </div>
            </div>
            <div style="background-color:lightgray;">
                Take the time to complete the New Project Information Sheet (NPIS) correctly as the data provided:<br />
                <ul>
                    <li>Affects global reporting statistics that are reported up to the Board and market place</li>
                    <li>Ensures the effective setup of project control systems to help successfully deliver the project</li>
                </ul>
                For more information with regard to the NPIS form - please see the TRAINING TAB on this Excel Spreadsheet<br />
                All items marked * are Mandatory fields. Ecosys generated NPIS form with the same revision number can also be used as an alternate.													
            </div>
            <div class="SectionName border-top border-left border-right">GENERAL INFORMATION</div>
            <%
                var db2 = new PPPEntities();
                var iprojectId2 = Convert.ToInt32(Request["projectId"]);
                var isubId2 = Convert.ToInt32(Request["subId"]);
                var npis = db2.NPISForm.FirstOrDefault(x => x.ProjectId == iprojectId2 && x.SubId == isubId2 && x.type == type.Value);
                if (npis != null)
                {
                    completedBy.Value = npis.SubmitBy;
                }
                 %>
            <table class="fullTable">
                <tr>
                    <td class="title general-information">Completed By</td>
                    <td>
                        <input type="text" id="completedBy" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title general-information">Project Start Date <span class='date-format'>(yyyy/mm/dd)</span><span class="star">*</span></td>
                    <td>
                        <input type="text" id="t1" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Project Type <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t2" runat="server" class="text-input"/>--%>
                        <select id="t2" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">WP Contracting Entity or JV<span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t3" runat="server" class="text-input"/>--%>
                        <select id="t3" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Business Line <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t4" runat="server" class="text-input"/>--%>
                        <select id="t4" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Advisian Business Line</td>
                    <td>
                        <select id="t5" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Advisian Service Line</td>
                    <td>
                        <select id="t48" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Customer Subsector *</td>
                    <td>
                        <select id="t49" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Capability Subsector <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t6" runat="server" class="text-input"/>--%>
                        <select id="t50" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Home Office Location <span class="star">*</span></td>
                    <td>
                        <input type="text" id="t7" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">GBS Project Template <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t8" runat="server" class="text-input"/>--%>
                        <select id="t8" runat="server" class="cmb-style"></select>

                    </td>
                </tr>
                <tr>
                    <td class="title">Project Title <span class="ref">(e.g. Client, Project title)</span> <span class="star">*</span><br />
                        <span class="ref">0~30 characters</span></td>
                    <td>
                        <input type="text" id="t9" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Proposal No <span class="ref">(if known)</span></td>
                    <td>
                        <input type="text" id="t10" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">CRMT Entry No</td>
                    <td>
                        <input type="text" id="t11" runat="server" class="text-input" readonly="readonly" disabled="disabled"  /></td>
                </tr>
                <tr>
                    <td class="title">Project No.<span class="ref">(created by system GBS)</span></td>
                    <td>
                        <input type="text" id="t51" runat="server" class="text-input" readonly="readonly" disabled="disabled" /></td>
                </tr>
            </table>
            <div class="SectionName border-left border-right">CONTRACTUAL INFORMATION</div>
            <table class="fullTable">
                <tr>
                    <td class="title contractual-inforation">Customer Type <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t12" runat="server" class="text-input"/>--%>
                        <select id="t12" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Internal Entity <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t13" runat="server" class="text-input"/>--%>
                        <select id="t13" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Customer Name <span class="star">*</span></td>
                    <td>
                        <input type="text" id="t14" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Existing Customer Ref No</td>
                    <td>
                        <input type="text" id="t15" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Bill to address <span class="star">*</span></td>
                    <td>
                        <input type="text" id="t16" runat="server" class="text-input" /></td>
                </tr>

                <tr>
                    <td class="title">Customer Contact Name</td>
                    <td>
                        <input type="text" id="t17" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Estimated WP Hour <span class="star">*</span></td>
                    <td>
                        <input type="text" id="t18" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Estimated WP Revenue <span class="star">*</span></td>
                    <td>
                        <input type="text" id="t19" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Contract Currency<span class='prompt'>(CNY, AUD, USD)</span> <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t20" runat="server" class="text-input"/>--%>
                        <select id="t20" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Proposal Budget<span class='prompt'>(CNY)</span></td>
                    <td>
                        <input type="text" id="t21" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Project Classification by size <a href="javascript:void(0);" class="show-info1">Help</a></td>
                    <td>
                        <%--<input type="text" id="t22" runat="server" class="text-input"/>--%>
                        <select id="t22" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Project Risk Classification <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t23" runat="server" class="text-input" />--%>
                        <select id="t23" name="t23" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Phase <span class="star">*</span></td>
                    <td>
                        <select id="t52" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Scope of Services <span class="star">*</span></td>
                    <td>
                        <select id="t53" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Country of Asset <span class="star">*</span></td>
                    <td>
                        <select id="t54" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Asset Type <span class="star">*</span></td>
                    <td>
                        <select id="t55" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Existing WP Contract <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t26" runat="server" class="text-input"/>--%>
                        <select id="t26" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Contract Number</td>
                    <td>
                        <input type="text" id="t27" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Purchase Order Number</td>
                    <td>
                        <input type="text" id="t28" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Billing Type <span class="star">*</span></td>
                    <td>
                        <%--<input type="text" id="t29" runat="server" class="text-input"/>--%>
                        <select id="t29" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
                <tr>
                    <td class="title">Contractual basis for<br />
                        commencement of billable work <span class="star">*</span> <a href="javascript:void(0);" class='show-info2'>Help</a>
                    </td>
                    <td>
                        <%--<input type="text" id="t30" runat="server" class="text-input" />--%>
                        <select id="t30" runat="server" class="cmb-style"></select>
                    </td>
                </tr>
            </table>
            <div class="SectionName border-left border-right">GBS Key Members and NPIS Distribution (Please update the GBS key member tab if there is >1 role)</div>
            <table class="fullTable">
                <tr>
                    <td></td>
                    <td class="text-center title">Key Members</td>
                    <td class="text-center title">Hard Copy NPIS form Distribution
                        <br />
                        & GBS Notification</td>
                    <td class="title">Name</td>
                    <td class="title">WP Email Address</td>
                </tr>
                <tr>
                    <td class="title">Project Manager <span class="star">*</span></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c1" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c2" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <input type="text" id="t31" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="text-center">
                        <input type="text" id="t32" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Project Accountant <span class="star">*</span></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c3" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c4" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <input type="text" id="t33" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="text-center">
                        <input type="text" id="t34" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Project Controller <span class="star">*</span></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c5" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c6" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <input type="text" id="t35" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="text-center">
                        <input type="text" id="t36" runat="server" class="text-input" /></td>
                </tr>
                <tr>
                    <td class="title">Other</td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c7" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <label>
                            <input type="checkbox" id="c8" runat="server" class="cb-style" /></label></td>
                    <td class="text-center">
                        <input type="text" id="t37" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="text-center">
                        <input type="text" id="t38" runat="server" class="text-input" /></td>
                </tr>
            </table>
            <div class="note1">Note: It is possible for same person to be nominated for mandatory project roles above.</div>
            <div class="SectionName border-left border-right border-top border-bottom">MANDATORY ATTACHMENTS TO NPIS</div>
            <div class="note1">Attach the following to the NPIS before sending it for approval to the Authorized Signatory:</div>
            <table class="fullTable">
                <tr>
                    <td>
                        <input type="checkbox" id="c9" runat="server" class="cb-style" /></td>
                    <td>Completed and approved Contract Sign-Off Checklist (CSOC) where no existing contract was in place.  Alternatively an executed Letter of Intent/Interim Agreement. Note that the CSOC is required for all contracts including those using standard T&Cs.</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="c10" runat="server" class="cb-style" /></td>
                    <td>Completed and approved Risk Classification Form (RCF).</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="c11" runat="server" class="cb-style" /></td>
                    <td>Customer Work Order/Purchase Order/Contract.</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="c12" runat="server" class="cb-style" /></td>
                    <td>If no formal proposal procedures have been followed, attach as-sold commercial basis.</td>
                </tr>
            </table>
            <a href="javascript:void(0)" class="btn btn-primary clear-border-radius btn-add-attachment">Add attachment</a>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Attach Description</th>
                        <th>Upload By</th>
                        <th>Upload Date</th>
                        <th>Action(s)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    var db = new PPPEntities();
                    var iprojectId = Convert.ToInt32(Request["projectId"]);
                    var isubId = Convert.ToInt32(Request["subId"]);
                    projectId.Value = Request["projectId"];
                    subId.Value = Request["subId"];
                    type.Value = Request["type"].ToString().Trim();
                    var atts = db.NPISAttach.Where(x => x.ProjectId == iprojectId && x.SubId == isubId && x.type == type.Value).OrderBy(x=>x.Seq);
                    foreach (NPISAttach att in atts)
                    {
                        %>
                        <tr>
                            <td><span class="hidden"><%=att.ProjectId%></span><span class="hidden"><%=att.SubId%></span><span class="hidden"><%=att.type%></span><span class="hidden"><%=att.Seq%></span> <a href="<%=string.Format("{0}Forms/NPISFiles/{1}", ResolveUrl("~"), att.FileName) %>"><%=att.Description %></a></td>
                            <td><%=att.UploadBy %></td>
                            <td><%=att.UploadDate %></td>
                            <td><a href="javascript:void(0)" class="btn btn-xs btn-danger delete-attach-row">Delete</a></td>
                        </tr>
                    <%
                    } %>
                </tbody>
            </table>
            <div class="SectionName border-left border-right border-top border-bottom">ENDORSEMENT</div>
            <table class="fullTable" style="border: 0px solid red;">
                <tr>
                    <td></td>
                    <td class="text-center title"><strong>Project Manager Name</strong></td>
                    <td></td>
                    <td class="text-center title">&nbsp;</td>
                </tr>
                <tr>
                    <td class="title">Name:</td>
                    <td>
                       <input type="text" id="t39" runat="server" class="text-input" />
                        <div  class="search-people-result"></div>
                    </td>
                    <td class="title">&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="title">Signature:</td>
                    <td>
                        <input type="text" id="t41" runat="server" class="text-input" disabled="disabled" /></td>
                    <td class="title">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="title">Date:</td>
                    <td>
                        <input type="text" id="t43" runat="server" class="text-input" disabled="disabled" /></td>
                    <td class="title">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" style="padding:0;">
                        <div class="SectionName border-left border-right border-top border-bottom">APPROVALS</div>
                    </td>
                </tr>
                <tr>
                    <td class="title"></td>
                    <td><div class="text-center"><strong>Authorized Approval Signatory Name<br />
                        (As per location Delegation of Authority)</strong></div></td>
                    <td class="title"></td>
                    <td><div class="text-center"><strong>Location Finance<br />
                        (FD/LFM/Project Account)</strong></div></td>
                </tr>
                <tr>
                    <td class="title">Name:</td>
                    <td>
                        <select runat="server" id="t40" style="width: 100%; height: 26px; " name="D1">
                            <option value=""></option>
                            <option value="10004">Tom Liao Shenli</option>
                            <option value="13246">Chen Li</option>
                            <option value="10090">Henry Xing Hairui</option>
                            <option value="16328">Jane Zhu Yuanzheng</option>
                        </select></td>
                    <td class="title">Name:</td>
                    <td>
                        <select runat="server" id="t45" style="width: 100%; height: 26px; " name="D2" disabled="disabled">
                            <option value=""></option>
                            <option value="14556">Tang Yinglu</option>
                            <option value="13116">Duan Liju</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="title">Signature:</td>
                    <td>
                        <input type="text" id="t42" runat="server" class="text-input" disabled="disabled" /></td>
                    <td class="title">Signature:</td>
                    <td>
                        <input type="text" id="t46" runat="server" class="text-input" disabled="disabled" /></td>
                </tr>
                <tr>
                    <td class="title">Date:</td>
                    <td>
                        <input type="text" id="t44" runat="server" class="text-input" disabled="disabled" /></td>
                    <td class="title">Date:</td>
                    <td>
                        <input type="text" id="t47" runat="server" class="text-input" disabled="disabled" /></td>
                </tr>
            </table>
            <div class="reject" runat="server" id="rejectSection">
                <div class="SectionName border-left border-right border-top border-bottom">Reject Comments</div>
                <table id="tblReject" class="table table-bordered">
                    <tr>
                        <td style="width:100px;">Reject By</td><td><label id="rejectBy" runat="server">zhenhua.liu</label></td>
                    </tr>
                    <tr>
                        <td>Comments</td>
                        <td><label id="rejectComments" runat="server" style="color:red"></label></td>
                    </tr>
                </table>
            </div>
            <p>&nbsp;</p>
<%--            <div class="text-right">
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-primary save-change">Save change</a>
                    <a href="javascript:void(0);" class="btn btn-default ready-for-approval">Ready for Approval</a>
                    <a href="javascript:void(0);" class="btn btn-default expediting">Expediting</a>
                    <a href="javascript:void(0);" class="btn btn-default reverse">Reverse</a>
                <% if (Request["type"] == "2")
                   {
                       %><a href="javascript:void(0);" class="btn btn-default copyFromProposal">Copy from proposal</a><%
                   }
                %>
                </div>
            </div>--%>
            <br />
            <br />
            <br />
            <br />
        </div>
        <input type="hidden" id="projectId" runat="server" />
        <input type="hidden" id="subId" runat="server" />
        <input type="hidden" id="type" runat="server" />
        <input type="hidden" id="islocked" runat="server" />
        <input type="hidden" id="isAllApproved" runat="server" />
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-info1">
            <div class="modal-dialog" style="border: 0px solid red; width: 800px;">
                <div class="modal-content" style="border: 0px solid red; width: 800px; margin: 0 auto; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Project Classification by size option description</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 135px;">Option</th>
                                        <th>Description</th>
                                    </tr>
                                    <tr>
                                        <td>Large Project</td>
                                        <td>
                                            <ul>
                                                <li>Reimbursable Engineering Only Project with a Service Value >= US$30Million</li>
                                                <li>Reimbursable Projects (EP, EPCM, CM, PMC) with a Services Value >= US$10Million</li>
                                                <li>Lump Sum Projects with a Services Value >= US$10Million</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Medium Project</td>
                                        <td>
                                            <ul>
                                                <li>Reimbursable Engineering Only Projects with a Service Value between US$2Million and US$30Million</li>
                                                <li>Reimbursable Projects (EP, EPCM, CM, PMC) with a Services Value between US$1Million and US$10Million</li>
                                                <li>Lump Sum Project with a Services Value between 1M and US10$Million</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Small Project</td>
                                        <td>
                                            <ul>
                                                <li>Reimbursable Engineering Only Projects with a Service Value <= US$2Million</li>
                                                <li>Reimbursable Projects (EP, EPCM, CM, PMC) with a Services Value <= US$1Million</li>
                                                <li>Lump Sum Project with a Services Value <=US$1Million</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
        
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-info2">
            <div class="modal-dialog" style="border: 0px solid red; width: 800px;">
                <div class="modal-content" style="border: 0px solid red; width: 800px;">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Contractual basis for commencement of billable work option description</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="container1">
                            <div class="">
                                <table class="table table-hover table-bordered">
                                    <tr>
                                        <th style="width: 80px;">Option</th>
                                        <th>Description</th>
                                    </tr>
                                    <tr>
                                        <td>Option A</td>
                                        <td>
                                            The work on the project is covered by an existing executed contract that is adequate and approprate for the services to be performed. The are two scenarios:
                                            <ul>
                                                <li>An executed contract in place for some time</li>
                                                <li>A new, fully executed contract signed by the appropriate representatives from the Customer and Company.</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Option B</td>
                                        <td>
                                            The work on the project is:<br/>
                                            Either covered by a new project contract that is adequate and appropriate for the services to be performed and is Or based on a Request for Service(RFS) form another Company office.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Option C</td>
                                        <td>
                                            The work on the project is covered by an executed letter of intent/interim agreement that has been reviewed by the Customer Contracts Representative and signed off by the company's appropriate delegated authority.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Option D</td>
                                        <td>
                                            The work on the project is not covered by any executed letter of intent/interim agreement but the senior manager in the location(or designate) has approved in writing to the Customer Contract Representative that some specific tasks can be performed and a spcified amount of financial exposure can be incurred prior to a letter of intent/interim agreement being in place or contract being signed.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>N/A</td>
                                        <td>
                                            For Proposal Only
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
        
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-delete-attach">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Delete confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm delete current item?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger delete-attach">Delete</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-exediting-confirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Exediting confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm exediting current New Project Infomation Sheet(NPIS)?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success exediting-confirm">Continue</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
    </form>
    <form id="frmUploadFile">
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-add-attach">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add attachment</h4>
                    </div>
                    <div class="modal-body">
                        <div >
                            <label for="fu">File Name <span style="color:red;">*</span></label>
                            <input type="file" id="fu" name="fu" class="form-control"/>
                            <label for="no">No <span style="color:red;">*</span></label>
                            <input type="text" id="no" name="no" class="form-control" required="required" />
                            <label for="fuDesc">Attach Description <span style="color:red;">*</span></label>
                            <input type="text" id="fuDesc" name ="fuDesc" class="form-control" required="required" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnDelete" type="button" class="btn btn-primary add-attach">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->
    </form>
</body>
</html>
