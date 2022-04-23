<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayReaders.aspx.cs" Inherits="LibraryManagement.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">


    <h2 style="color:maroon">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Total Readers
    </h2>
    <br />
    <br />
        <asp:GridView ID="GridViewDisplayReaders" runat="server" AutoGenerateColumns="False" CellPadding="2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Reader id" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelReaderId" runat="server" Text='<%# Bind("reader_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="personal_identification_number" HeaderText="Personal identification number" />
                <asp:BoundField DataField="adress_id" HeaderText="Adress id" />
                <asp:BoundField DataField="first_name" HeaderText="First name" />
                <asp:BoundField DataField="last_name" HeaderText="Last name" />
                <asp:BoundField DataField="gender_id" HeaderText="Gender id" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="phone_number" HeaderText="Phone number" />
            </Columns>
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
<br />
<br />
<br />
</asp:Content>
