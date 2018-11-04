﻿<%@ Page Language="C#" Title="DrugProNET | Home" AutoEventWireup="true" MasterPageFile="~/BasePage.Master" CodeBehind="Default.aspx.cs" Inherits="DrugProNET.Default" %>

<asp:Content runat="server" ContentPlaceHolderID="HeadContentPlaceHolder">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyContentPlaceHolder">
    <div class="c-row">
          <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <%-- Needs to be here as a place holder for the side bar, since the base style of the website is 2 columns for each row, 
                without it the sidebar will disappear --%>
        </div>
        <div class="c-col body-content">
            <h2>About DrugProNET...</h2>
            <p>
                DrugProNET is an open-access, knowledgebase developed by Kinexus Bioinformatics Corporation to
                    foster
                    the identification of the most critical atomic interactions between drugs and their protein targets
                    based on 3D x-ray crystallographic analyses. Defining the key amino acid residues for drug binding
                    in
                    proteins permits the prediction of specific mutations in human genomes that will affect the
                    sensitivities of individuals to these compounds. The bond distances in Angstroms between the
                    closest
                    protein and drug atoms in each crystal complex are provided in downloadable tables, along with
                    definition of the closest amino acid residue side-chains. DrugProNET features comprehensive
                    information
                    on over 2000 compounds that have been co-crystallized with over 480 different human proteins in
                    over
                    4400 protein-compound structures retrieved from the Research Collaboratory for Structural
                    Bioinformatics (RCSB) Protein Databank (PDB). In addition, information is also available for an
                    additional 748 compounds that are inhibitors of protein kinases. The protein and drug data were
                    retrieved from several sources, including the RCSB PDB, Wikipedia, the Universal Protein Resource
                    (UniProt), the National Center for Biotechnology Information’s (NCBI) RefSeq and PubChem websites,
                    and
                    the European Molecular Biology Laboratory (EMBL) European Bioinformatics Institute’s Kinase SARFari
                    and
                    ChEMBL websites.
            </p>
            <h2>Instructions</h2>
            <p>
                DrugProNET is designed to be fast and simple to navigate. Just follow the steps outlined in each
                    query.
                    Presently, there are four different types of queries that you can perform with DrugProNET. You can
                    search for target proteins if you know their UniProt ID, RefSeq ID, or one of their common gene or
                    protein names. You can also query for approved drugs and other compound of interest if you know
                    their
                    CAS ID, PubChem CID, ChEMBL ID or one of their common or chemical names. A list of possible options
                    for
                    proteins or compounds are generated by typing at least two letters of their names or identification
                    numbers, and waiting for a few moments for a complete list to appear.
            </p>
            <h2>Other Useful Onlnie Resources From Kinexus...</h2>
            <p>
                DrugProNET is one of several useful open-access, online resources that are available from Kinexus
                    to
                    foster cell signalling research by academic and industrial scientists. Direct links to several of
                    our
                    other knowledgebases in the SigNET KnowledgeBank are provided just below the header at the top of
                    each
                    webpage in DrugProNET. Our related DrugKiNET knowledgebase features comprehensive information on
                    over
                    800 compounds that have been experimentally determined to inhibit human protein kinases. This
                    includes
                    the retrieval of the lowest reported compound IC50, Ki and Kd values from several reputable sources
                    for
                    over 105,000 experimentally tested, non-redundant kinase-compound pairs. Using this information for
                    training, we developed two kinase inhibitor prediction algorithms to further predict another
                    200,000
                    possible kinase-compound interactions. TranscriptoNET provides gene expression information on over
                    20,300 human genes in over 600 diverse human cell lines, organs and tissues. PhosphoNET features
                    data
                    on nearly 1 million confirmed or predicted human phosphorylation sites in the proteins encoded by
                    these
                    genes. KinATLAS reveals interactions between these proteins with each other in signalling systems
                    as
                    well as interactions with kinase inhibitory compounds. KinaseNET offers detailed information about
                    536
                    human protein kinases, whereas OncoNET provides expression and mutation information for 3000
                    cancer-related proteins in diverse human tissues and cell lines. For semi-quantitative data on
                    actual
                    protein expression in over 2,000 diverse biological specimens, please also visit our open-access
                    KiNET
                    DataBank with over 2000 antibody microarray analyses with over 1700 diverse panand
                    phosphosite-specific
                    antibodies. Most of these antibodies are available from Kinexus for screening lysates from cells
                    and
                    tissues using our Kinex™ KAM antibody microarrays or as stand-alone products at our
                    www.kinexusproducts.ca website.
            </p>
        </div>
    </div>
</asp:Content>
