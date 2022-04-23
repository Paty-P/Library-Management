<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertUpdateDeleteAuthors.aspx.cs" Inherits="LibraryManagement.WebForm20" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="jquery/pikaday.js"></script>
    <p>
    </p>
    <h2 style="color: black; text-align: center;">Insert Update or Delete Authors from database</h2>
    <br />

    <p>
        <asp:GridView ID="GridViewInsertUpdateDeleteAuthors" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="author_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" ShowFooter="True">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure to delete?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author id" InsertVisible="False" SortExpression="author_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("author_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("author_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButtonInsert" ValidationGroup="INSERT" OnClick="LinkButton_Click" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of birth" SortExpression="date_of_birth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" runat="server" Text='<%# Bind("date_of_birth", "{0: yyyy-MM-dd}") %>'></asp:TextBox>
                        <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    field: document.getElementById('TextBox1'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2020-12-31'),
                                    yearRange: [1800, 2020],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                        </script>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server"
                            ErrorMessage="You must insert date of birth!"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" DataFormatString="{0: yyyy-MM-dd}" runat="server" Text='<%# Bind("date_of_birth","{0: yyyy-MM-dd}" ) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxDateOfBirth" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" runat="server"></asp:TextBox>
                        <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    field: document.getElementById('TextBoxDateOfBirth'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2020-12-31'),
                                    yearRange: [1800, 2020],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                        </script>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOBfooter" ValidationGroup="INSERT" runat="server"
                            ErrorMessage="You must insert date of birth!"
                            ControlToValidate="TextBoxDateOfBirth" Text="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="First name" SortExpression="first_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFN" runat="server"
                            ErrorMessage="You must insert first name!"
                            ControlToValidate="TextBox2" ForeColor="Red" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFNfooter" ValidationGroup="INSERT" runat="server"
                            ErrorMessage="You must insert first name!"
                            ControlToValidate="TextBoxFirstName" ForeColor="Red" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last name" SortExpression="last_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLN" runat="server"
                            ErrorMessage="You must insert last name!"
                            ControlToValidate="TextBox3" ForeColor="Red" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLNfooter" ValidationGroup="INSERT" runat="server"
                            ErrorMessage="You must insert last name!"
                            ControlToValidate="TextBoxLastName" ForeColor="Red" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    </FooterTemplate>
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
        <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />
        <p>
            <asp:ValidationSummary ID="ValidationSummaryupdate" ForeColor="Red" runat="server" />
            <p>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [tblAuthor] WHERE [author_id] = @author_id"
                    InsertCommand="INSERT INTO [tblAuthor] ([first_name], [last_name], [date_of_birth]) VALUES (@first_name, @last_name, @date_of_birth )" SelectCommand="SELECT * FROM [tblAuthor]" UpdateCommand="UPDATE [tblAuthor] SET [first_name] = @first_name, [last_name] = @last_name, [date_of_birth] = @date_of_birth WHERE [author_id] = @author_id">
                    <DeleteParameters>
                        <asp:Parameter Name="author_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter DbType="Date" Name="date_of_birth" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />

                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter DbType="Date" Name="date_of_birth" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="author_id" Type="Int32" />

                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
    <p>
</asp:Content>
