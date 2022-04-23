<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchAuthor.aspx.cs" Inherits="LibraryManagement.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <h2 style="text-align: center"> Search books availible in library by author name</h2>
    <h2> &nbsp;</h2>

    <asp:Label ID="LabelData" runat="server"></asp:Label>

        <table>
            <tr>
                <td style="width: 172px">
                    <asp:Label ID="Label1" runat="server" Text="Insert author name:" Font-Bold="True" ForeColor="Black"></asp:Label>
                </td>
                <td style="width: 264px">
                    <asp:TextBox ID="TextBoxAuthorName" runat="server" style="margin-left: 0; margin-bottom: 0em"></asp:TextBox>
                </td>
                <td style="width: 100px">
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" Width="144px" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Black" OnClick="ButtonSearch_Click" />
                </td>
            </tr>
        </table>

    <p>
        <asp:GridView ID="GridViewAuthorName" EmptyDataText=" There is no author to display!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False" Width="587px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="author_id" HeaderText="Author id" Visible="False" />
                <asp:BoundField DataField="Authorname" HeaderText="Author name" />
                <asp:BoundField DataField="title" HeaderText="Book title" />
                <asp:BoundField DataField="registration_number" HeaderText="Registration number" />
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
    </p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
    
</asp:Content>
