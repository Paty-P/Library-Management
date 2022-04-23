<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchReaders.aspx.cs" Inherits="LibraryManagement.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <br />    
    <h2 style="color: black; text-align: center;"> Search readers
    </h2>
    <fieldset style="width:554px">
        <legend><b>Search By</b></legend>
        <asp:RadioButton ID="RadioButtonReaderName" runat="server" GroupName="SearchBy" Text="Reader name" AutoPostBack="True" BackColor="#FAFAE7" BorderColor="Black" BorderStyle="None" ForeColor="Black" OnCheckedChanged="RadioButtonReaderName_CheckedChanged" Width="261px" />
        <asp:RadioButton ID="RadioButtonCNP" runat="server" GroupName="SearchBy" Text="Personal identification number" OnCheckedChanged="RadioButtonCNP_CheckedChanged" AutoPostBack="True" BackColor="#FAFAE7" ForeColor="Black" />
    </fieldset>          

    <asp:Panel ID="PanelReaderName" runat="server">

        <h3 style="color:black; text-align: center;"> Search by reader name</h3>

        <table style="align-content:center; width: 454px;">
            <tr>
                <td style="width: 185px; text-align: center; height: 42px;">
                    <asp:Label ID="Label1" runat="server" Text="First name" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 407px; text-align: left; height: 42px;">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" style="margin-bottom: 0.6em"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 185px; text-align: center; height: 32px;">
                    <asp:Label ID="Label2" runat="server" Text="Last name" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 407px; height: 32px;">
                    <asp:TextBox ID="TextBoxLastName" runat="server" style="margin-bottom: 0.4em"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 390px">&nbsp; 
                <br />                   
                    <asp:Button ID="ButtonSearchReaderName" runat="server" Font-Bold="True" Style="margin-left: 207px" Text="Search" BackColor="#FAFAE7" ForeColor="Maroon" OnClick="ButtonSearchReaderName_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>   
        <asp:Label ID="LabelNotFound" runat="server"></asp:Label>
    

    <asp:Panel ID="PanelCNP" runat="server">
        <h3 style="color:black"> Search by personal identification number of the reader</h3>
        <table align="center">
            <tr>
                <td style="width: 405px; text-align: center;">
                    <asp:Label ID="LabelCNP" runat="server" Text="Personal identification number" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 235px">
                    <asp:TextBox ID="TextBoxCNP" runat="server" Style="margin-left: 0px; margin-bottom: 0em;" OnTextChanged="TextBoxCNP_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;
                <br />                 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 
                <asp:Button ID="ButtonSearchByCNP" runat="server" BackColor="#FAFAE7" Font-Bold="True" ForeColor="Maroon" Style="margin-left: 45px" Text="Search" OnClick="ButtonSearchByCNP_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div style="text-align: center">
    <asp:GridView ID="GridViewReaderName" runat="server" align="center" EmptyDataText="Sorry! There is no data present. Please add or wait for others to enter record."
        EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-BorderStyle="Solid" CellPadding="2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EmptyDataRowStyle BorderStyle="Solid" ForeColor="Red"></EmptyDataRowStyle>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    </div>
    <p>
        <asp:GridView ID="GridViewCNP" runat="server" align="center"
            EmptyDataText="Sorry! There is no data present. Please add or wait for others to enter record."
            EmptyDataRowStyle-ForeColor="Red" CellPadding="2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">

            <AlternatingRowStyle BackColor="PaleGoldenrod" />

            <EmptyDataRowStyle ForeColor="Red"></EmptyDataRowStyle>

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

</asp:Content>
