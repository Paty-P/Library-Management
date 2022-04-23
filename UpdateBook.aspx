<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateBook.aspx.cs" Inherits="LibraryManagement.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <br />

    <h2 style="color: black; text-align: center;">&nbsp;Update books</h2>
    <table class="auto-style3">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Insert Book Title" ></asp:Label>
                
            </td>
            <td style="height: 47px"><asp:TextBox ID="txtSearch" runat="server" style="margin-left: 0; margin-bottom: 0em" ></asp:TextBox></td>
            <td style="height: 47px">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" BackColor="Tan" Width="63px"  />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" EmptyDataText=" There is no title to display!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" CellPadding="2" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" Text="Update" runat="server" BackColor="Tan" OnClick="btnUpdate_Click"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
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
    <table class="auto-style3" align="center">
        <tr>
            <td>
               Title
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" style="margin-bottom: 0em" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Author
            </td>
            <td>
                <asp:DropDownList ID="ddlAuthor" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Publisher
            </td>
            <td>
                <asp:DropDownList ID="ddlPublisher" runat="server" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Domain
            </td>
            <td>
                <asp:DropDownList ID="ddlDomain" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
               Language
            </td>
            <td>
                <asp:DropDownList ID="ddlLanguage" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
               Price
            </td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" style="margin-bottom: 0em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Copies
            </td>
            <td>
                <asp:TextBox ID="txtCopies" runat="server" style="margin-bottom: 0em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Publishing Date
            </td>
            <td> <asp:TextBox ID="txtPublishingDate" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" runat="server" Text='<%# Bind("published_date", "{0: yyyy-MM-dd}") %>' style="margin-bottom: 0.6em" AutoCompleteType="Disabled" ></asp:TextBox>
                <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    field: document.getElementById('txtPublishingDate'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2021-12-31'),
                                    yearRange: [1800, 2021],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                        </script>                
            </td>
        </tr>
        <tr>
            <td style="height: 44px">
                
                Registration Date</td>
            <td style="height: 44px">
                  <asp:TextBox ID="txtRegistrationDate" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" runat="server" Text='<%# Bind("published_date", "{0: yyyy-MM-dd}") %>' style="margin-bottom: 0em"></asp:TextBox>
                <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    field: document.getElementById('txtRegistrationDate'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2021-12-31'),
                                    yearRange: [1800, 2021],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                        </script>                             
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" BackColor="Tan" Width="63px"  />
            </td>
        </tr>
    </table>
</asp:Content>
