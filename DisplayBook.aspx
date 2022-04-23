<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayBook.aspx.cs" Inherits="LibraryManagement.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="margin-left:auto; margin-right:auto;">
     &nbsp; &nbsp;
    <h2 style="color:black; text-align: center;"> Total Books</h2>
    <asp:SqlDataSource ID="SqlDataSourceDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblBook]"></asp:SqlDataSource>

    <center>

    <asp:GridView ID="GridViewDisplay" runat="server" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="book_id" DataSourceID="SqlDataSourceDisplay" ForeColor="Black" GridLines="None" style="margin-right: 161px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="book_id" HeaderText="Book id" InsertVisible="False" ReadOnly="True" SortExpression="book_id" Visible="False" />
            <asp:BoundField DataField="author_id" HeaderText="Author id" SortExpression="author_id" Visible="False" />
            <asp:BoundField DataField="publishing_house_id" HeaderText="Publishing house id" SortExpression="publishing_house_id" Visible="False" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="number_copies" HeaderText="Number of copies" SortExpression="number_copies" />
            <asp:BoundField DataField="published_date" HeaderText="Published date" SortExpression="published_date"  DataFormatString="{0: yyyy-MM-dd}" />
            <asp:BoundField DataField="domain_id" HeaderText="Domain id" SortExpression="domain_id" Visible="False" />
            <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" Visible="False" />
            <asp:BoundField DataField="registration_date" HeaderText="Registration date" SortExpression="registration_date"  DataFormatString="{0: yyyy-MM-dd}" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
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
</center>
</div>






</asp:Content>
