﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class PPPEntities : DbContext
{
    public PPPEntities()
        : base("name=PPPEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<BIDForm> BIDForm { get; set; }
    public virtual DbSet<BNBAttach> BNBAttach { get; set; }
    public virtual DbSet<NPISAttach> NPISAttach { get; set; }
    public virtual DbSet<NPISForm> NPISForm { get; set; }
    public virtual DbSet<PAAF> PAAF { get; set; }
    public virtual DbSet<PIFForm> PIFForm { get; set; }
    public virtual DbSet<RiskClassificationForm> RiskClassificationForm { get; set; }
    public virtual DbSet<SysDictionary> SysDictionary { get; set; }
    public virtual DbSet<SystemEMail> SystemEMail { get; set; }
    public virtual DbSet<SystemEmailReciver> SystemEmailReciver { get; set; }
    public virtual DbSet<SystemRiskManagementEmail> SystemRiskManagementEmail { get; set; }
    public virtual DbSet<TAccount> TAccount { get; set; }
    public virtual DbSet<TAccountRole> TAccountRole { get; set; }
    public virtual DbSet<TApproval> TApproval { get; set; }
    public virtual DbSet<TCRMTLoader> TCRMTLoader { get; set; }
    public virtual DbSet<TCRMTLoaderDetail> TCRMTLoaderDetail { get; set; }
    public virtual DbSet<TFunction> TFunction { get; set; }
    public virtual DbSet<TFYear> TFYear { get; set; }
    public virtual DbSet<TFYearSerial> TFYearSerial { get; set; }
    public virtual DbSet<TPeople> TPeople { get; set; }
    public virtual DbSet<TProject> TProject { get; set; }
    public virtual DbSet<TProjectBasicInfo> TProjectBasicInfo { get; set; }
    public virtual DbSet<TProjectContactList> TProjectContactList { get; set; }
    public virtual DbSet<TProjectOwner> TProjectOwner { get; set; }
    public virtual DbSet<TProjectRegister> TProjectRegister { get; set; }
    public virtual DbSet<TProjectX> TProjectX { get; set; }
    public virtual DbSet<TProposalRegister> TProposalRegister { get; set; }
    public virtual DbSet<TProposalX> TProposalX { get; set; }
    public virtual DbSet<TRiskWorkshare> TRiskWorkshare { get; set; }
    public virtual DbSet<TRole> TRole { get; set; }
    public virtual DbSet<TRoleDetail> TRoleDetail { get; set; }
    public virtual DbSet<TStaffingBasicInfo> TStaffingBasicInfo { get; set; }
    public virtual DbSet<TStaffingPlan> TStaffingPlan { get; set; }
    public virtual DbSet<TStaffingPlanDetail> TStaffingPlanDetail { get; set; }
    public virtual DbSet<TStaffingPlanDetailYearMonth> TStaffingPlanDetailYearMonth { get; set; }
    public virtual DbSet<TSProjectTotalHMs> TSProjectTotalHMs { get; set; }
    public virtual DbSet<TOrganization> TOrganization { get; set; }
    public virtual DbSet<TOrganizationPeoples> TOrganizationPeoples { get; set; }
}