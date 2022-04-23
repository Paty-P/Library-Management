<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="LibraryManagement.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <%-- <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>

    <br />
   <h2 style="text-align: center"> Search Book</h2>
   

    <fieldset style="width: 300px">
        <legend><b>Search By</b></legend>
        <asp:RadioButton ID="RadioButtonAuthor" runat="server" GroupName="SearchBy" Text="Author" AutoPostBack="True" BackColor="#FFFFCC" BorderColor="Black" BorderStyle="None" ForeColor="Black" OnCheckedChanged="RadioButtonAuthor_CheckedChanged" />
        <asp:RadioButton ID="RadioButtonBook" runat="server" GroupName="SearchBy" Text="Book" OnCheckedChanged="RadioButtonBook_CheckedChanged" AutoPostBack="True" BackColor="#FFFFCC" ForeColor="Black" />
    </fieldset>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxSearch" runat="server" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonSearch" runat="server" Text="Search" BorderStyle="Outset" Font-Bold="True" ForeColor="Black" OnClick="ButtonSearch_Click1" BackColor="#FFFFCC" />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Font-Italic="True" ForeColor="Red" Visible="False"></asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Panel ID="PanelAuthor" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spDetailAuthor" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSearch" Name="authorName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
        <asp:GridView ID="GridViewAuthor" EmptyDataText="Sorry! There is no data present. Please add or wait for others to enter record."
            EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-BorderStyle="Solid" runat="server"
            CellPadding="2"
            AutoGenerateColumns="False"
            DataKeyNames="author_id"
            DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">

            <AlternatingRowStyle BackColor="PaleGoldenrod" />

            <Columns>
                <asp:BoundField DataField="author_id" HeaderText="Author id" InsertVisible="False" ReadOnly="True" SortExpression="author_id" />
                <asp:BoundField DataField="Authorname" HeaderText="Author name" ReadOnly="True" SortExpression="Authorname" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:CheckBoxField DataField="status" HeaderText="Status" SortExpression="status" />
                <asp:BoundField DataField="registration_number" HeaderText="Registration number" SortExpression="registration_number" />
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

    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="PanelBook" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spListBookAfterTitle" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSearch" Name="Title" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridViewBook" EmptyDataText="Sorry! There is no data present. Please add or wait for others to enter record."
            EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-BorderStyle="Solid" runat="server"
            CellPadding="2"
            AutoGenerateColumns="False"
            DataKeyNames="book_id"
            DataSourceID="SqlDataSource2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">

            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="book_id" HeaderText="Book id" InsertVisible="False" ReadOnly="True" SortExpression="book_id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" ReadOnly="True" SortExpression="Author" />
                <asp:BoundField DataField="Publishing" HeaderText="Publishing" SortExpression="Publishing" />
                <asp:BoundField DataField="Domain" HeaderText="Domain" SortExpression="Domain" />
                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
                <asp:BoundField DataField="Publishing Date" HeaderText="Publishing Date" ReadOnly="True" SortExpression="Publishing Date" DataFormatString="{0: yyyy-MM-dd}" />
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

    </asp:Panel>
    <br />

</asp:Content>
