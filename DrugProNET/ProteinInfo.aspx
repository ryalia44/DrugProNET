﻿<%@ Page Language="C#" Title="DrugProNET | Protein Information" MasterPageFile="~/BasePage.Master" AutoEventWireup="true" CodeBehind="ProteinInfo.aspx.cs" Inherits="DrugProNET.ProteinInfo" MaintainScrollPositionOnPostback="true" %>

<asp:Content runat="server" ContentPlaceHolderID="CSSContentPlaceHolder">
    <link rel="stylesheet" href="./css/3_column.css">
    <link rel="stylesheet" href="./css/protein_info.css">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BodyContentPlaceHolder">
    <div class="c-row">
        <div class="c-col side-spacing"></div>
        <div class="c-col side-content">
            <h3 class="h3-side-title">Query Type</h3>
        </div>
        <div class="c-col body-content">
            <h3 class="h3-body-title">Protein Information</h3>
            <p>
                This query provides detailed information on over 600 proteins that have been experimentally
                    identified as targets fro inhbitory drugs. Follow the instructions below to retrieve information on
                    a specific protein of interest.
            </p>
        </div>
        <div class="c-col advertisment-content">
            <asp:Timer ID="ad_refresh_timer" runat="server" Interval="3000" OnPreRender="RenewAdvertisement" OnTick="RenewAdvertisement"></asp:Timer>
            <asp:UpdatePanel ID="ad_update_panel" runat="server" UpdateMode="Conditional">
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
            <h3 class="h3-side-title">Filters</h3>
        </div>
        <div class="c-col body-content">
            <asp:UpdatePanel ID="button_update_panel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <h3 class="h3-body-title">Step 1 - Protein Specification</h3>
                    <p>
                        Enter the first few characters for a gene name, protein name, UniProtID or NCBI RefSeq ID of the
                    target human protein and then select the desired search term from the Drop Down list;
                    </p>
                    <asp:TextBox CssClass="textBox" ID="search_textBox" runat="server" value="" placeholder="Type in at least 3 letters of the search term" />
                    <h3 class="h3-body-title">Step 2 - Retrieve Protein Information</h3>
                    <p>
                        Click on the buttons below to retrieve information on the
                    protein of interest or to reset the parameters for a new query.
                    </p>
                    <asp:Button ID="retrieve_button" CssClass="button" Text="Retrieve Information" runat="server" OnClick="retrieve_button_Click" />
                    <span>&emsp;&emsp;</span>
                    <asp:Button ID="reset_button" CssClass="button" Text="Reset" runat="server" OnClick="reset_button_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
