<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRentBook.aspx.cs" Inherits="LibraryManagement.WebForm14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2 style="color: black; text-align: center;">Search for reader rent books   </h2>
    <br />
    <fieldset style="width: 300px">
        <legend><b>Search By</b></legend>
        <asp:RadioButton ID="RadioButtonReaderRentBookCNP" runat="server" GroupName="SearchBy" Text="Reader CNP" AutoPostBack="True" BackColor="#FFFFCC" BorderColor="Black" BorderStyle="None" ForeColor="Black" OnCheckedChanged="RadioButtonReaderRentBookCNP_CheckedChanged" />
        <asp:RadioButton ID="RadioButtonReaderRentBookTitle" runat="server" GroupName="SearchBy" Text="Book Title" OnCheckedChanged="RadioButtonReaderRentBookTitle_CheckedChanged" AutoPostBack="True" BackColor="#FFFFCC" ForeColor="Black" />
    </fieldset>
    <asp:Panel ID="Panel1" runat="server">
        &nbsp;&nbsp; &nbsp;<asp:Label ID="LabelCNP" runat="server" Font-Bold="True" Text="Insert CNP:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxCNP" runat="server" style="margin-bottom: 0em"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorCNP" runat="server"
            ControlToValidate="TextBoxCNP"
            ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b"
            ForeColor="red"
            ErrorMessage="You have inserted a invalid Personal Identification Number!" Display="Dynamic">
        </asp:RegularExpressionValidator>

        <asp:Button ID="ButtonSearch" runat="server" BackColor="#FFFF99" Font-Bold="True" Text="Search" OnClick="ButtonSearch_Click" />

        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
          <br />
        <asp:GridView ID="GridViewRentBookAfterCNP" EmptyDataText="There are no rent books to display for this reader!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False">
            
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText="First name" />
                <asp:BoundField DataField="last_name" HeaderText="Last name" />
                <asp:BoundField DataField="phone_number" HeaderText="Phone number" />
                <asp:BoundField DataField="title" HeaderText="Book title" />
                <asp:BoundField DataField="Authorname" HeaderText="Author name" />
                <asp:BoundField DataField="registration_number" HeaderText="Registration number" />
                <asp:BoundField DataField="borrow_date" HeaderText="Borrow date" DataFormatString="{0: yyyy-MM-dd}" />
                <asp:BoundField DataField="return_date" HeaderText="Return date" DataFormatString="{0: yyyy-MM-dd}" />
                <asp:BoundField DataField="status" HeaderText="Status book" />
            </Columns>

            <EmptyDataRowStyle Font-Bold="True" ForeColor="Red"></EmptyDataRowStyle>

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

    <asp:Panel ID="Panel2" runat="server">
        &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Insert book title:"></asp:Label>
        <asp:TextBox ID="TextBoxTitle" runat="server" Width="145px" style="margin-bottom: 0em"></asp:TextBox>
        <asp:Button ID="ButtonSearchTitle" runat="server" BackColor="#FFFF99" Font-Bold="True" OnClick="ButtonSearchTitle_Click" Text="Search" Style="margin-left: 38px" Width="124px" />


        <p>
            <asp:GridView ID="GridViewRentBooksAfterTitle" runat="server" EmptyDataText="There are no books with this title!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
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
    </asp:Panel>

    <br />

</asp:Content>
