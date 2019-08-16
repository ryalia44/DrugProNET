﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace DrugProNET
{
    public static class EF_Data
    {
        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static Drug_Information GetDrugUsingDropDownName(string query)
        {
            Drug_Information drug = null;

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                drug = context.Drug_Information.Where(d =>
                    d.Drug_Name_for_Pull_Down_Menu.ToLower().Contains(query.ToLower())).FirstOrDefault();
            }

            return drug;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static Drug_Information GetDrugByDrugPDBID(string query)
        {
            Drug_Information drug = null;

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                drug = context.Drug_Information.Where(d =>
                    d.Drug_PDB_ID.ToLower().Contains(query.ToLower())).FirstOrDefault();
            }

            return drug;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<Drug_Information> GetDrugsQuery(string query)
        {
            List<Drug_Information> drugs = new List<Drug_Information>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                drugs = context.Drug_Information.Where(d =>
                    d.Other_Drug_Name_Alias.ToLower().Contains(query.ToLower())
                    || d.Drug_Common_Name.ToLower().Contains(query.ToLower())
                    || d.Drug_Chemical_Name.ToLower().Contains(query.ToLower())
                    || d.Compound_CAS_ID.ToLower().Contains(query.ToLower())
                    || d.PubChem_CID.ToLower().Contains(query.ToLower())
                    || d.ChEMBL_ID.ToLower().Contains(query.ToLower())
                 ).ToList();
            }

            return drugs;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<Drug_Information> GetDrugsInfoQuery(string query)
        {
            List<Drug_Information> drugs = new List<Drug_Information>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                drugs = context.Drug_Information.Where(d =>
                d.Compound_CAS_ID.ToLower().Contains(query.ToLower())
                || d.ChEMBL_ID.ToLower().Contains(query.ToLower())
                || d.PubChem_SID.ToLower().Contains(query.ToLower())
                || d.Drug_PDB_ID.ToLower().Contains(query.ToLower())
                || d.Drug_Common_Name.ToLower().Contains(query.ToLower())
                || d.Drug_Chemical_Name.ToLower().Contains(query.ToLower())
                || d.Other_Drug_Name_Alias.ToLower().Contains(query.ToLower())
                || d.Drug_InChl.ToLower().Contains(query.ToLower())
                || d.ChemSpider_ID.ToLower().Contains(query.ToLower())
                || d.ChEBI_ID.ToLower().Contains(query.ToLower())
                ).ToList();
            }

            return drugs;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static Protein_Information GetProteinByUniprotID(string uniprotID)
        {
            Protein_Information protein = null;

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                protein = context.Protein_Information.Where(p => p.Uniprot_ID.ToLower().Contains(uniprotID.ToLower())).FirstOrDefault();
            }

            return protein;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static Protein_Information GetProtein(string query)
        {
            Protein_Information protein = null;

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                DbSet<Protein_Information> dbSet = context.Protein_Information;

                foreach (Protein_Information p in dbSet)
                {
                    if (IsQueryInValues(query,
                        p.Protein_Short_Name,
                        p.Protein_Full_Name,
                        p.NCBI_Gene_ID,
                        p.PDB_Protein_Name,
                        p.Protein_Alias,
                        p.Uniprot_ID,
                        p.NCBI_RefSeq_NP_ID,
                        p.NCBI_Gene_Name,
                        p.PhosphoNET_Name))
                    {
                        protein = p;
                    }
                }
            }

            return protein;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<Protein_Information> GetProteinsInfoQuery(string query)
        {
            List<Protein_Information> proteins = new List<Protein_Information>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                proteins = context.Protein_Information.Where(p =>
                    p.Protein_Short_Name.ToLower().Contains(query.ToLower())
                    || p.Protein_Full_Name.ToLower().Contains(query.ToLower())
                    || p.NCBI_Gene_ID.ToLower().Contains(query.ToLower())
                    || p.PDB_Protein_Name.ToLower().Contains(query.ToLower())
                    || p.Protein_Alias.ToLower().Contains(query.ToLower())
                    || p.Uniprot_ID.ToLower().Contains(query.ToLower())
                    || p.NCBI_RefSeq_NP_ID.ToLower().Contains(query.ToLower())
                    || p.NCBI_Gene_Name.ToLower().Contains(query.ToLower())
                    || p.PhosphoNET_Name.ToLower().Contains(query.ToLower())
                ).ToList();
            }

            return proteins;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static PDB_Interaction GetPDB_Interaction(string uniprot_ID, string drug_PDB_ID, string amino_acid_specification)
        {
            PDB_Interaction PDB_interaction = new PDB_Interaction();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                PDB_interaction = context.PDB_Interaction
                    .Where(i => i.UniProt_ID.ToLower().Contains(uniprot_ID.ToLower())
                    && i.Drug_PDB_ID.ToLower().Contains(drug_PDB_ID.ToLower())
                    && (i.AA_Residue_Type + "-" + i.Uniprot_Residue_Number).ToLower().Contains(amino_acid_specification.ToLower())
                ).FirstOrDefault();
            }

            return PDB_interaction;
        }

        /// <summary>
        /// Author: Andy Tang
        /// </summary>
        public static PDB_Information GetPDBInfo(Protein_Information protein, Drug_Information drug)
        {
            PDB_Information PDBInfo = null;

            if (protein == null || drug == null)
            {
                return PDBInfo;
            }

            string uniprot_ID = protein.Uniprot_ID;
            string drug_PDB_ID = drug.Drug_PDB_ID;

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                DbSet<PDB_Information> dbSet = context.PDB_Information;
                foreach (PDB_Information pdb in dbSet)
                {
                    if (string.Equals(pdb.Uniprot_ID, uniprot_ID, StringComparison.OrdinalIgnoreCase)
                        && string.Equals(pdb.Drug_PDB_ID, drug_PDB_ID, StringComparison.OrdinalIgnoreCase))
                    {
                        PDBInfo = pdb;
                    }
                }
            }

            return PDBInfo;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<PDB_Information> GetPDBInfoUsingProtein(string uniprot_ID)
        {
            List<PDB_Information> list = new List<PDB_Information>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                list = context.PDB_Information.Where(pdb =>
                    pdb.Uniprot_ID.ToLower().Contains(uniprot_ID.ToLower())).ToList();
            }

            return list;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<PDB_Information> GetPDBInfoUsingDrug(string drug_pdb_id)
        {
            List<PDB_Information> PDB_information = new List<PDB_Information>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                PDB_information = context.PDB_Information.Where(p =>
                    p.Drug_PDB_ID.ToLower().Contains(drug_pdb_id.ToLower())).ToList();
            }

            return PDB_information;
        }

        public static Dictionary<PDB_Distance, string> GetDistanceAndUniprotResidueNumbers(string PDB_File_ID, double interaction_distance)
        {
            var DistanceAndUniprotResidueNumbers = new Dictionary<PDB_Distance, string>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                DistanceAndUniprotResidueNumbers = context.PDB_Distance.Where(distance =>
                   distance.PDB_File_ID == PDB_File_ID
                   && distance.Distance <= interaction_distance)
                   .Join(context.PDB_Interaction,
                   distance => new
                   {
                       PDB_File_ID = distance.PDB_File_ID,
                       Protein_Residue = distance.Protein_Residue,
                       Protein_Residue_Number = distance.Protein_Residue_Number,
                   },
                   interaction => new
                   {
                       PDB_File_ID = interaction.PDB_File_ID,
                       Protein_Residue = interaction.AA_Residue_Type,
                       Protein_Residue_Number = interaction.PDB_Residue_Number,
                   },
                   (distance, interaction) => new
                   {
                       distance,
                       interaction,
                   }
                   )
                   .OrderBy(a => a.distance.Distance)
                   .ToDictionary(a => a.distance, a => a.interaction.PDB_Residue_Number);
            }

            return DistanceAndUniprotResidueNumbers;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<SNV_Mutation> GetMutations(string uniprot_ID, string drug_PDB_ID, string PDB_File_ID)
        {
            List<SNV_Mutation> SNV_Mutation = new List<SNV_Mutation>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                SNV_Mutation = context.SNV_Mutation.Where(m =>
                    m.UniProt_ID.Equals(uniprot_ID, StringComparison.OrdinalIgnoreCase)
                    && m.Drug_PDB_ID.Equals(drug_PDB_ID, StringComparison.OrdinalIgnoreCase)
                    && m.PDB_File_No.Equals(PDB_File_ID, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            return SNV_Mutation;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static SNV_Mutation GetMutationBySNVKey(string SNV_Key)
        {
            SNV_Mutation SNV_mutation = new SNV_Mutation();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                SNV_mutation = context.SNV_Mutation.Where(m => m.SNV_Key.Equals(SNV_Key, StringComparison.OrdinalIgnoreCase)).SingleOrDefault();
            }

            return SNV_mutation;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static SNV_Mutation GetMutationBySNVIDKey(string SNV_ID_Key)
        {
            SNV_Mutation SNV_mutation = GetMutationsBySNVIDKey(SNV_ID_Key).First();

            return SNV_mutation;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<SNV_Mutation> GetMutationsBySNVIDKey(string SNV_ID_Key)
        {
            List<SNV_Mutation> SNV_Mutation = new List<SNV_Mutation>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                SNV_Mutation = context.SNV_Mutation.Where(m =>
                       m.SNV_P1W_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P2W_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P3W_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P1M1_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P1M2_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P1M3_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P2M1_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P2M2_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P2M3_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P3M1_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P3M2_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                    || m.SNV_P3M3_ID.Equals(SNV_ID_Key, StringComparison.OrdinalIgnoreCase)
                ).ToList();
            }

            return SNV_Mutation;
        }

        /// <summary>
        /// Author: Ryan Liang
        /// </summary>
        public static List<SNV_Mutation> GetMutationsBySNVIDKeyContains(string SNV_ID_Key)
        {
            List<SNV_Mutation> SNV_Mutation = new List<SNV_Mutation>();

            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                SNV_Mutation = context.SNV_Mutation.Where(m =>
                       m.SNV_P1W_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P2W_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P3W_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P1M1_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P1M2_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P1M3_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P2M1_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P2M2_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P2M3_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P3M1_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P3M2_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                    || m.SNV_P3M3_ID.ToLower().Contains(SNV_ID_Key.ToLower())
                ).ToList();
            }

            return SNV_Mutation;
        }

        /// <summary>
        /// Author: Andy Tang
        /// </summary>
        private static bool IsQueryInValues(string query, params string[] values)
        {
            return values.Select(value => value?.ToLower()).ToArray().Contains(query?.ToLower());
        }
    }
}
