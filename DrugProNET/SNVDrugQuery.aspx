﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BasePage.Master" AutoEventWireup="true" CodeBehind="SNVDrugQuery.aspx.cs" Inherits="DrugProNET.SNVDrugQuery" MaintainScrollPositionOnPostback="true" %>

<asp:Content runat="server" ContentPlaceHolderID="HeadContentPlaceHolder">
    <link rel="stylesheet" href="./css/3_column.css" />
    <link rel="stylesheet" href="./css/snv_drug_query.css">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyContentPlaceHolder">
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <h3 class="h3-side-title">Query Type</h3>
        </div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">SNV-focused Protein-Drug interaction Identification</h3>
            <p>
                This query provides a listing of protein interactions that may be affected by a specific single nucleotide variant (SNV)
                in the human genome. The SNV must be documented in the DrugProNET database as selected from the examination of atom-to-atom 
                interaction pairs between a small drug molecule and a protein target based on the extracted fro coordinate information of 
                co-crystalization files in the RCSB PDB Protein Data Bank.
            </p>
        </div>
        <div class="c-col advertisment-content">
            <asp:UpdatePanel ID="ad_update_panel" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="ad_refresh_timer" runat="server" Interval="3000" OnPreRender="RenewAdvertisement" OnTick="RenewAdvertisement"></asp:Timer>
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
            <h3 class="h3-side-title">Filters</h3>
        </div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Step 1 - SNV Specification</h3>
            <p>Provide the SNV exactly with the format shown here. After a few letters are entered, select from one of the options presented in the pull down menu. Required format:</p>
            <p><span class="yellow">NCBI Gene Location ID</span><span class="gray">(<span class="white">HGNC Gene Name</span>):c</span><span class="yellow">Nucleotide Number</span><span class="white">Common Nucleotide Base Type</span><span class="gray">></span><span class="yellow">Variant Nucleotide Base</span><span class="gray">(p<span class="white">Original Amino Acid Residue Type</span><span class="yellow">Amino Acid Residue Number</span><span class="white">Variant Amino Acid Residue Type</span>)</span></p>
            <p>e.g.&nbsp;<span class="white">NC_000007.14(EGFR):c55181386A>G(pMet793Val)</span></p>
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
        </div>
        <div class="c-col body-content">
            <asp:TextBox CssClass="textBox" ID="snv_specification_textbox" runat="server" value="" placeholder="Type in the SNV according to format above" />
        </div>
    </div>

    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
        </div>
        <div class="c-col body-content">

            <h3 class="h3-body-title">Step 2 - Report Generation</h3>
            <p>Click on the box below to produce custom tables with results or to reset the parameters.</p>

            <asp:Button ID="generate_table_button" CssClass="button" Text="Generate Table" OnClick="Generate_Table_Button_Click" runat="server" />
            <span>&emsp;&emsp;</span>
            <asp:Button ID="reset_button" CssClass="button" Text="Reset" runat="server" OnClick="Reset_Button_Click" />

        </div>
    </div>

</asp:Content>