﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DrugProNET
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DrugProNETEntities : DbContext
    {
        public DrugProNETEntities()
            : base("name=DrugProNETEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Protein_Information> Protein_Information { get; set; }
        public virtual DbSet<PDB_Distance> PDB_Distance { get; set; }
        public virtual DbSet<PDB_Interaction> PDB_Interaction { get; set; }
        public virtual DbSet<SNV_Mutation> SNV_Mutation { get; set; }
        public virtual DbSet<PDB_Information> PDB_Information { get; set; }
        public virtual DbSet<Drug_Information> Drug_Information { get; set; }
    }
}
