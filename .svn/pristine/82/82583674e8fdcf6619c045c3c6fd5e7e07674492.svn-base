using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// TransHelper 的摘要说明
/// </summary>
public class TransCodeHelper
{
    public TransCodeHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static string TransCSG(string csgId)
    {
        switch (csgId)
        {
            case "CC":
                return "CC-Chemicals";
            case "HU":
                return "HU-Hydrocarbons Upstream";
            case "HH":
                return "HH-Hydrocarbons Downstream";
            case "PP":
                return "PP-Power";
            case "PH":
                return "PH-Power Workshare";
            case "MM":
                return "MM-Minerals&amp;Metals";
            case "MH":
                return "MH-Minerals&amp;Metals Workshare";
            case "IE":
                return "IE-Infrastructure";
            case "IH":
                return "IH-Infrastructure Workshare";
            case "LC":
                return "LC-LYG";
        }
        return csgId;
    }

    public static string TransOffice(string officeId)
    {
        switch (officeId)
        {
            case "11":
                return "11-Beijing Office";
            case "12":
                return "12-Shanghai Office";
            case "13":
                return "13-Nanjing Office";
            case "14":
                return "14-Tianjin Office";
            case "20":
                return "20-Chengdu Office";
            case "21":
                return "21-PAS (21 including Procurement)";
            case "31":
                return "31-GDC BJ";
            case "33":
                return "33-GDC NJ";
            case "34":
                return "34-GDC TJ";
            case "41":
                return "41-Advisian BJ";
            case "53":
                return "53-International Chemicals NJ";
        }
        return officeId;
    }

    public static string TransPhase(string phaseId)
    {
        switch (phaseId)
        {
            case "A":
                return "A-Advisory";
            case "C":
                return "C-Consulting / Selected (Pre-FEED)";
            case "D":
                return "D-Execute, FEED/Identify/Evaluate/Define EPCM/EPC, PMC/DED/Deliver";
            case "M":
                return "M-Major Project";
        }
        return phaseId;
    }

    public static string TransWPContractingEntityOrJV(string id)
    {
        switch (id)
        {
            case "WPC":
                return "WPC - Beijing WorleyParsons Engineering and Technology Co., Ltd.";
            case "WPCNJ":
                return "WPCNJ - Beijing WorleyParsons Engineering and Technology Co., Ltd. Nanjing Branch";
            case "WPCSH":
                return "WPCSH - Beijing WorleyParsons Engineering and Technology Co., Ltd. Shanghai Branch";
            case "UNET":
                return "UNET - Beijing WorleyParsons Project Management Co., Ltd.";
            case "LYG":
                return "LYG - Lianyungang WorleyParsons Engineering Co., Ltd.";
            case "LYGBJ":
                return "LYGBJ - Lianyungang WorleyParsons Engineering Co., Ltd. Beijing Branch";
            case "LYGCD":
                return "LYGCD - Lianyungang WorleyParsons Engineering Co., Ltd. Chengdu Branch";
            case "LYGNJ":
                return "LYGNJ - Lianyungang WorleyParsons Engineering Co., Ltd. Nanjing Branch";
            case "LYGSH":
                return "LYGSH - Lianyungang WorleyParsons Engineering Co., Ltd. Shanghai Branch";
            case "LYGTJ":
                return "LYGTJ - Lianyungang WorleyParsons Engineering Co., Ltd. Tianjin Branch";
            case "MPEC":
                return "MPEC - Beijing MaisonParsons Engineering &amp; Technology Co., Ltd.";
            case "TJWPC":
                return "TJWPC - Tianjin WorleyParsons Engineering and Technology Co., Ltd.";
            case "CDWPC":
                return "CDWPC - Chengdu WorleyParsons Engineering and Technology Co; Ltd.";
        }

        return id;
    }

    public static string TransCustomerSubsector(string id)
    {
        switch (id)
        {
            case "2001":
                return "2001 MM: Bauxite and Alumina";
            case "2002":
                return "2002 MM: Aluminium";
            case "2003":
                return "2003 MM: Base Metals";
            case "2004":
                return "2004 MM: Coal";
            case "2005":
                return "2005 MM: Mined Fertilizers";
            case "2006":
                return "2006 MM: Iron Ore";
            case "2050":
                return "2050 CH: Inorganic Chemicals";
            case "2051":
                return "2051 CH: Petrochemicals (note 1)";
            case "2052":
                return "2052 CH: Polymers";
            case "2053":
                return "2053 CH: Specialty Chemicals";
            case "3003":
                return "3003 I: Marine and Coastal Facilities";
            case "3004":
                return "3004 I: Rail";
            case "3006":
                return "3006 I: Roads and Airports";
            case "3007":
                return "3007 I: Social and Industrial Facilities";
            case "3008":
                return "3008 I: Water";
            case "3009":
                return "3009 I: Fossil Energy";
            case "3011":
                return "3011 I: Nuclear";
            case "3012":
                return "3012 I: Power Networks";
            case "3013":
                return "3013 I: Resource Infrastructure";
            case "4001":
                return "4001 HC: Heavy Oil and Sands";
            case "4002":
                return "4002 HC: LNG";
            case "4003":
                return "4003 HC: Offshore - Topsides and Fixed Substructures";
            case "4004":
                return "4004 HC: Onshore – Conventional Oil and Gas";
            case "4005":
                return "4005 HC: Onshore Pipeline Systems";
            case "4006":
                return "4006 HC: Refining";
            case "4007":
                return "4007 HC: Subsea and Floating Systems";
            case "4008":
                return "4008 HC: Sulphur";
            case "4009":
                return "4009 HC: Unconventional Oil and Gas";
            case "4010":
                return "4010 HC: Petrochemicals";
        }

        return id;
    }

    public static string TransCapabilitySubsector(string id)
    {
        switch (id)
        {
            case "2001":
                return "2001 Bauxite and Alumina";
            case "2002":
                return "2002 Aluminium";
            case "2003":
                return "2003 Base Metals";
            case "2004":
                return "2004 Coal";
            case "2005":
                return "2005 Mined Fertilizers";
            case "2006":
                return "2006 Iron Ore";
            case "2007":
                return "2007 Precious Metals";
            case "2050":
                return "2050 Inorganic Chemicals";
            case "2051":
                return "2051 Petrochemicals";
            case "2052":
                return "2052 Polymers";
            case "2053":
                return "2053 Specialty Chemicals";
            case "3001":
                return "3001 Environment and Society";
            case "3002":
                return "3002 Geoscience";
            case "3003":
                return "3003 Marine and Coastal Facilities";
            case "3004":
                return "3004 Rail";
            case "3005":
                return "3005 Restore";
            case "3006":
                return "3006 Roads and Airports";
            case "3007":
                return "3007 Social and Industrial Facilities";
            case "3008":
                return "3008 Water";
            case "3009":
                return "3009 Fossil Energy";
            case "3010":
                return "3010 New Energy and Renewables";
            case "3011":
                return "3011 Nuclear";
            case "3012":
                return "3012 Power Networks";
            case "3013":
                return "3013 Resource Infrastructure";
            case "4001":
                return "4001 Heavy Oil and Sands";
            case "4002":
                return "4002 LNG";
            case "4003":
                return "4003 Offshore - Topsides and Fixed Substructures";
            case "4004":
                return "4004 Onshore – Conventional Oil and Gas";
            case "4005":
                return "4005 Onshore Pipeline Systems";
            case "4006":
                return "4006 Refining";
            case "4007":
                return "4007 Subsea and Floating Systems";
            case "4008":
                return "4008 Sulphur";
            case "4009":
                return "4009 Unconventional Oil and Gas";
            case "5001":
                return "5001 Specialist Advisian Capability";
        }

        return id;
    }

}