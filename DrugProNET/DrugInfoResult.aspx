﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BasePage.Master" AutoEventWireup="true" CodeBehind="DrugInfoResult.aspx.cs" Inherits="DrugProNET.DrugInfoResult" %>

<asp:Content runat="server" ContentPlaceHolderID="CSSContentPlaceHolder">
    <link href="./css/drug_info_result.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/3_column.css">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyContentPlaceHolder">

    <%-- First row --%>
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <h3 class="h3-side-title">General Info</h3>
        </div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Compound Description</h3>
            <p class="p-general-info">This report provides detailed information on one of over 2000 drugs that have been experimentally identified as inhibitors for proteins and co-crystallized with these proteins. The data has been annotated from multiple sources, including the US National Center for Biotechnology Information,  EMBL and other reputable databases and direct url links are provided to their websites.</p>
        </div>
        <div class="c-col advertisment-content">
            <asp:Timer ID="ad_refresh_timer" runat="server" Interval="3000" OnPreRender="RenewAdvertisement" OnTick="RenewAdvertisement"></asp:Timer>
            <asp:UpdatePanel ID="ad_update_panel" runat="server">
                <ContentTemplate>
                    <asp:HyperLink ID="adLink" NavigateUrl="navigateurl" runat="server">
                        <asp:Image ImageUrl="imageUrl" runat="server" ID="adBanner" AlternateText="" />
                    </asp:HyperLink>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ad_refresh_timer" EventName="Tick"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <br />
        </div>
        <div class="c-col body-content">
        </div>
        <div class="c-col advertisment-content"></div>
    </div>

    <%-- ------- --%>
    <div class="c-row" ID="compound_name_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Compound Name:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="compound_name" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="chemical_name_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Chemical Name:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="chemical_name" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="compound_alias_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Compound Alias:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="compound_alias" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="compound_inchl_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Compound InChl ID:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="compound_inchl_id" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="drug_formula_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Drug Formula:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="drug_formula" runat="server"></p>
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col body-content-long-full">
            <div class="flex-container">
                <div class="flex-row">
                    <div class="flex-col">
                        <div class="flex-row" ID="molecular_mass_row" runat="server">
                            <div class="side">
                                <p class="p-side">Molecular Mass:</p>
                            </div>
                            <div class="body">
                                <p id="molecular_mass" runat="server"></p>
                            </div>
                        </div>
                        <div class="flex-row" ID="pdb_drug_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">PDB Drug ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="pdb_drug_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>
                        <div class="flex-row" ID="compound_cas_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">Compound CAS ID:</p>
                            </div>
                            <div class="body">
                                <p id="compound_cas_id" runat="server"></p>
                            </div>
                        </div>
                        <div class="flex-row" ID="pubchem_cid_row" runat="server">
                            <div class="side">
                                <p class="p-side">PubChem CID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="pubchem_cid" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>
                        <div class="flex-row" ID="chembl_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">ChEMBL ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="chembl_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="kinase_sarfair_row" runat="server">
                            <div class="side">
                                <p class="p-side">Kinase SARfair:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="kinase_sarfair" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="pubchem_sid_row" runat="server">
                            <div class="side">
                                <p class="p-side">PubChem SID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="pubchem_sid" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="chemspider_sid_row" runat="server">
                            <div class="side">
                                <p class="p-side">ChemSpider SID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="chemspider_sid" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="chebi_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">ChEBI ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="chebi_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="bindingdb_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">BindingDB ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="bindingdb_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="drugbank_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">DrugBank ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="drugbank_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="drug_reg_row" runat="server">
                            <div class="side">
                                <p class="p-side">Drug Registration:</p>
                            </div>
                            <div class="body">
                                <p id="drug_registration" runat="server"></p>
                            </div>
                        </div>

                        <div class="flex-row" ID="kegg_drug_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">KEGG Drug ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="kegg_drug_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="therapeautic_target_row" runat="server">
                            <div class="side">
                                <p class="p-side">Therapeutic Targets ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="therapeutic_target_id" NavigateUrl="navigateurl" runat="server"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="flex-row" ID="pharmgkb_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">PharmGKB ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="pharmgkb_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="het_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">HET ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="het_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="drug_product_row" runat="server">
                            <div class="side">
                                <p class="p-side">Drug Product ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="drug_product_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="rxlist_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">RxList ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="rxlist_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="drugs_com_id_row" runat="server">
                            <div class="side">
                                <p class="p-side">Drugs.com ID:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="drugs_com_id" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="wikipedia_row" runat="server">
                            <div class="side">
                                <p class="p-side">Wikipedia:</p>
                            </div>
                            <div class="body">
                                <asp:HyperLink class="white-link" ID="wikipedia" NavigateUrl="navigateurl" runat="server" />
                            </div>
                        </div>

                        <div class="flex-row" ID="general_targets_row" runat="server">
                            <div class="side">
                                <p class="p-side">General Targets:</p>
                            </div>
                            <div class="body">
                                <p id="general_targets" runat="server"></p>
                            </div>
                        </div>

                        <div class="flex-row" ID="general_activity_row" runat="server">
                            <div class="side">
                                <p class="p-side">General Activity:</p>
                            </div>
                            <div class="body">
                                <p id="general_activity" runat="server"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex-col" ID="compound_structure_col" runat="server">
                    <div class="image-label">
                        <p class="p-side">Compound Structure:</p>
                    </div>
                    <div class="image-content">
                        <img id="compound_structure" runat="server" src="./Images/placeholder.jpg" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- ---------- --%>

    <div class="c-row" ID="commentary_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Commentary:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="commentary" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="source_type_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Source Type:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="source_type" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="living1_source_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Living Source:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="living_source1" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="living2_source_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Living Source:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="living_source2" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="approved_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Clinically Approved:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="clinically_approved" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="latest_stage_trial_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Lastest Stage Trials:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="latest_stage_trials" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="producer_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Producer:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="producer" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="disease_applications_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Disease Applications:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="disease_applications" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="toxic_effects_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Toxic Effects:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="toxic_effects" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="reference1_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Reference 1:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="reference_1" runat="server"></p>
        </div>
    </div>

    <div class="c-row" ID="reference2_row" runat="server">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <p class="p-side">Reference 2:</p>
        </div>
        <div class="c-col body-content-long">
            <p id="reference_2" runat="server"></p>
        </div>
    </div>

    <%-- Copy drug info query below! --%>
</asp:Content>
