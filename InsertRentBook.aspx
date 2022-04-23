<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertRentBook.aspx.cs" Inherits="LibraryManagement.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">


    <br />
    <h2 style="text-align: center"> Insert Rent Book</h2>
    
    <asp:Label ID="Label2" runat="server" Text="Insert CNP"></asp:Label>
    <asp:TextBox ID="TextBoxCNP" runat="server" OnTextChanged="TextBoxCNP_TextChanged" AutoPostBack="True" style="margin-bottom: 0em"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCNP" runat="server"
        ControlToValidate="TextBoxCNP"
        ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b"
        ForeColor="red"
        ErrorMessage="You have inserted a invalid Personal Identification Number!" Display="Dynamic"></asp:RegularExpressionValidator>
    <strong><span style="font-size: medium">
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Search" Style="margin-left: 28px" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Reader Name:"></asp:Label>

        <asp:Label ID="LabelName" runat="server"></asp:Label>
        <br />
        
    </span></strong>
    <br />
   
    <asp:Label ID="LabelData" runat="server" ForeColor="Green"></asp:Label>
    <br />
    <br />
    <asp:RadioButton ID="RadioButtonInsert" runat="server" AutoPostBack="True" BackColor="#FFFF99" Font-Bold="True" ForeColor="Black" GroupName="RBRentBook" OnCheckedChanged="RadioButtonInsert_CheckedChanged" Text="Borrow" />
    <asp:RadioButton ID="RadioButtonUpdate" runat="server" AutoPostBack="True" BackColor="#FFFF99" Font-Bold="True" GroupName="RBRentBook" OnCheckedChanged="RadioButtonUpdate_CheckedChanged" Text="Return" />
    <asp:Panel ID="PanelInsert" runat="server">
       <br />
        <h2 style="color: black">Insert Rent Book</h2>
       
        <table style="align-content:center; width: 454px;">
            <tr>
                <td style="height: 33px; font-size: medium; text-align: center; width: 212px">
                    <asp:HiddenField ID="HiddenFieldRaderId" runat="server" />
                </td>
                <td style="height: 33px; width: 135px" text-align: center; >&nbsp;</td>
            </tr>
            <tr>
                <td -style="font-size: medium; width: 155px"; text-align: center; ">
                    <asp:HiddenField ID="HiddenFieldBookId" runat="server" />
                </td>
                <td style="width: 135px">&nbsp;</td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 212px; height: 33px;">Registration Number</td>
                <td style="width: 135px; height: 50px;">
                    <asp:TextBox ID="TextBoxRegistrationNumber" runat="server" AutoPostBack="True" Height="30px" OnTextChanged="TextBoxRegistrationNumber_TextChanged" style="margin-bottom: 0.8em; margin-left: 2;" Width="100px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="font-size: medium; text-align: center; width: 212px">Borrow Date</td>
                <td style="width: 135px">&nbsp;&nbsp;
                <br />
                    <asp:TextBox ID="TextBoxBorrowDate" runat="server" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" Height="30px" style="margin-bottom: 0em" Text='<%# Bind("borrow_date", "{0: yyyy-MM-dd}") %>' Width="100px" AutoCompleteType="Disabled"></asp:TextBox>
                    <script type="text/javascript">

                    var picker = new Pikaday(
                        {
                            field: document.getElementById('TextBoxBorrowDate'),
                            firstDay: 1,
                            minDate: new Date('1800-01-01'),
                            maxDate: new Date('2021-12-31'),
                            yearRange: [1800, 2021],
                            numberOfMonths: 1,
                            theme: 'dark-theme'
                           
                            });
                       
                        </script>
                <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="18px" ImageUrl="~/Images/unnamed.png" OnClick="ImageButton1_Click" Width="19px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>

                <%--<asp:TextBox ID="TextBoxBorrowDate" runat="server" Width="100px" style="margin-bottom: 0em" Height="30px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 212px">Status:</td>
                <td style="width: 135px">
                    <asp:Label ID="LabelStatus" runat="server" Text="Borowed"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 212px">&nbsp;</td>
                <td style="width: 135px"; text-align: center;>
                    <asp:Button ID="ButtonSubmit" runat="server"  Text="Submit" Width="100px" OnClick="ButtonSubmit_Click" Height="30px" />
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="PanelUpdate" runat="server">
        <br />
        <h2 style="color: black">Update Rent Book</h2>
        <br />
        <table style="align-content:center;width: 454px;">
            <tr>
                <td style="font-size: medium; text-align: center; width: 200px; height: 50px;">Registration Number</td>
                <td style="width: 135px; height: 50px;">
         <asp:TextBox ID="TextBoxRegistrationNrUpdate" runat="server"  Height="30px" style="margin-bottom: 0.8em" Width="100px"></asp:TextBox>
                
                </td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 200px; height: 50px;">Return Date</td>
                <td style="width: 135px; height: 50px;" text-align: center"><asp:TextBox ID="TextBoxReturndate" runat="server" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" Height="30px" style="margin-bottom: 0em" Text='<%# Bind("return_date", "{0: yyyy-MM-dd}") %>' Width="100px" AutoCompleteType="Disabled" OnChange="TextBoxReturndate_TextChanged"></asp:TextBox>
                     
                    <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    field: document.getElementById('TextBoxReturndate'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2021-12-31'),
                                    yearRange: [1800, 2021],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                       </script>
                   

                    &nbsp;&nbsp;&nbsp;<br /> </td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 200px">Status:</td>
                <td style="width: 135px" text-align: center">
                    <asp:Label ID="LabelUpdate" runat="server" Text="Returned"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-size: medium; text-align: center; width: 200px">&nbsp;</td>
                <td style="width: 135px" text-align: center">
                    <asp:Button ID="ButtonUpdate" runat="server"  Text="Update" Width="100px" OnClick="ButtonUpdate_Click" Height="30px" />
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />

</asp:Content>
