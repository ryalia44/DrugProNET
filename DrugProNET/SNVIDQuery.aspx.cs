﻿using DrugProNET.Scripts;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrugProNET
{
    public partial class SNVIDQuery : Advertisement.AdvertiseablePage
    {
        private const string NO_MATCHES_MESSAGE = "No matching items found";

        protected new void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        protected void Search_Textbox_Changed(object sender, EventArgs e)
        {
            Protein_Information protein = EF_Data.GetProtein(search_textBox.Text);

            if (protein != null)
            {
                List<PDB_Information> pdbList = EF_Data.GetPDBInfoUsingProtein(protein.Uniprot_ID);
                List<Drug_Information> drugList = new List<Drug_Information>();

                foreach (PDB_Information pdb in pdbList)
                {
                    Drug_Information drug = EF_Data.GetDrug(pdb.Drug_PDB_ID);
                    if (drug != null)
                    {
                        drugList.Add(drug);
                    }
                }

                if (drugList.Count > 0)
                {
                    drug_specification_drop_down.Items.Clear();
                    foreach (Drug_Information drug in drugList)
                    {
                        drug_specification_drop_down.Items.Add(drug.Drug_Name_for_Pull_Down_Menu);
                    }
                }
                else
                {
                    drug_specification_drop_down.Items.Clear();
                    drug_specification_drop_down.Items.Add(NO_MATCHES_MESSAGE);
                }
            }
        }

        protected void LoadAminoAcidDropDown(object sender, EventArgs e)
        {
            using (DrugProNETEntities context = new DrugProNETEntities())
            {
                Protein_Information protein = EF_Data.GetProtein(search_textBox.Text);
                Drug_Information drug = EF_Data.GetDrugsUsingDropDownName(drug_specification_drop_down.SelectedItem.Value);


            }
        }

        private List<ListItem> GenerateListItemsFromValues(params string[] values)
        {
            List<ListItem> listItemList = new List<ListItem>();

            foreach (string value in values)
            {
                if (!string.IsNullOrEmpty(value))
                {
                    listItemList.Add(new ListItem(value, value, true));
                }
            }

            return listItemList;
        }

        [WebMethod]
        [ScriptMethod]
        public static List<string> GetAutoCompleteData(string prefixText, int count)
        {

            int minPrefixLength = 3;
            List<string> valuesList = new List<string>();

            if (prefixText.Length >= minPrefixLength)
            {
                try
                {
                    using (DrugProNETEntities context = new DrugProNETEntities())
                    {
                        DbSet<Protein_Information> dbSet = context.Protein_Information;

                        foreach (Protein_Information p in dbSet)
                        {
                            if (HasMatch(prefixText,
                                p.NCBI_Gene_Name,
                                p.Protein_Full_Name,
                                p.Protein_Short_Name,
                                p.Uniprot_ID,
                                p.NCBI_RefSeq_NP_ID))
                            {
                                if (!string.IsNullOrEmpty(p.Uniprot_ID))
                                {
                                    valuesList.Add(p.Uniprot_ID);
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            int maxAutocompleteLength = 5;

            // Get first 5 elements of the list
            return valuesList.Count >= maxAutocompleteLength ? valuesList.GetRange(0, 5) : valuesList;
        }

        private static bool HasMatch(string searchTerm, params string[] values)
        {
            foreach (string value in values)
            {
                if (!string.IsNullOrEmpty(value) && value.ToLower().Contains(searchTerm.ToLower()))
                {
                    return true;
                }
            }

            return false;
        }

        private static void AddIfExists(List<string> list, params string[] values)
        {
            foreach (string value in values)
            {
                if (!string.IsNullOrEmpty(value))
                {
                    list.Add(value);
                }
            }
        }
    }
}