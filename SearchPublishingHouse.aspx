<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchPublishingHouse.aspx.cs" Inherits="LibraryManagement.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <h2 style="color:brown"> &nbsp;&nbsp;</h2>
    <h2 style="color:black; text-align: center;"> Search publishing house </h2>
    <br />
    <p>
       
        <asp:Label ID="LabelNamePb" runat="server" Font-Bold="True" Text="Search books by name publishing house:"></asp:Label>

        <asp:TextBox ID="TextBoxPbH" runat="server" style="margin-bottom: 0em"></asp:TextBox>

        <asp:Button ID="ButtonSearch" runat="server" BackColor="#FFFFCC" Font-Bold="True" OnClick="ButtonSearch_Click" Text="Search" />
    </p>
    <p>
        &nbsp;&nbsp;
        <asp:GridView ID="GridViewPbHName" EmptyDataText=" There are no publisher to display!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
 
<p>
        &nbsp;<p>
        &nbsp;<p>
        &nbsp;</asp:Content>
