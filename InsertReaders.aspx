<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertReaders.aspx.cs" Inherits="LibraryManagement.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">


    <br />
    <h2> Insert Readers Into Database </h2>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:MultiView ID="MultiViewInsertReaders" runat="server">
        <asp:View ID="ViewReaderPersonalDetail" runat="server">

            <br />

            <br />
            <table style="border: 1px solid black;">
                <tr>
                    <td colspan="2">
                        <h3 style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Step 1 - Reader Personal Details</h3>
                    </td>
                </tr>
                <tr>

                    <td style="width: 262px">
                        <asp:Label ID="LabelCNP" runat="server" Font-Bold="True" Text="Personal identification number"></asp:Label>
                    </td>
                    <td style="width: 687px">
                        <asp:TextBox ID="TextBoxCNP" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorCNP" runat="server"
                            ControlToValidate="TextBoxCNP"
                            ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b"
                            ForeColor="red"
                            ErrorMessage="You have inserted a invalid Personal Identification Number!" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCNP" runat="server"
                            ErrorMessage="You must insert Personal identification number!"
                            ControlToValidate="TextBoxCNP" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelFirstName0" runat="server" Font-Bold="True" Text="First name"></asp:Label>
                    </td>
                    <td style="width: 687px">
                        <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorFirstName" runat="server"
                            ControlToValidate="TextBoxFirstName"
                            ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"
                            ErrorMessage="You have inserted an invalid name!" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server"
                            ErrorMessage="You must insert first name!"
                            ControlToValidate="TextBoxFirstName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelLastName0" runat="server" Font-Bold="True" Text="Last name"></asp:Label>
                    </td>
                    <td style="width: 687px">
                        <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorLastName" runat="server"
                            ControlToValidate="TextBoxLastName"
                            ValidationExpression="^[a-zA-Z]+$"
                            ErrorMessage="You have inserted an invalid name!"
                            ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelGenderId0" runat="server" Font-Bold="True" Text="Gender "></asp:Label>
                    </td>
                    <td style="width: 687px">
                        <asp:DropDownList ID="DropDownListGender" runat="server" OnSelectedIndexChanged="DropDownListGender_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">&nbsp;</td>

                    <td style="width: 687px">
                        <asp:Button ID="ButtonStep2" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" Style="margin-left: 287px" Text="Step 2 &gt;&gt;" OnClick="ButtonStep2_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />

        </asp:View>
        <asp:View ID="ViewReaderContactdetail" runat="server">

            <br />
            <table style="border: 1px solid black">
                <tr>
                    <td colspan="2">
                        <h3 style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Step 2 - Reader Contact Details</h3>
                    </td>
                </tr>
                <tr>
                    <td style="width: 258px">
                        <asp:Label ID="LabelEmail" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                    </td>
                    <td style="width: 690px">
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                            ControlToValidate="TextBoxEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ForeColor="Red"
                            ErrorMessage="You have inserted an invalid email adress!" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 258px">
                        <asp:Label ID="LabelPhoneNumber" runat="server" Font-Bold="True" Text="Phone number"></asp:Label>
                    </td>
                    <td style="width: 690px">
                        <asp:TextBox ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"
                            ErrorMessage="You have inserted an invalid phone number!"
                            ControlToValidate="TextBoxPhoneNumber" ForeColor="Red" ValidationExpression="^(?=0[723][2-8]\d{7})(?!.*(.)\1{2,}).{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 258px">
                        <asp:Button ID="ButtonBackToStep1" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" Text="&lt;&lt; Step 1" OnClick="ButtonBackToStep1_Click" />
                    </td>
                    <td style="width: 690px">
                        <asp:Button ID="ButtonStep3" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" Style="margin-left: 313px" Text="Step 3 &gt;&gt;" OnClick="ButtonStep3_Click" />
                    </td>
                </tr>


            </table>
            <br />

        </asp:View>
        <asp:View ID="ViewAdressDetail" runat="server">
            <table style="border: 1px solid black;">
                <tr>
                    <td colspan="2">
                        <h3 style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            Step 3 - Reader Adress Details</h3>
                        <tr>
                            <td style="width: 262px">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                            </td>
                            <td style="width: 678px">
                                <asp:Label ID="LabelAdressID" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelCountry" runat="server" Font-Bold="True" Text="Country"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxCountry" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="TextBoxCountry"
                            ValidationExpression="^[a-zA-Z]+$"
                            ErrorMessage="You have inserted an invalid country name!"
                            ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server"
                            ErrorMessage="You must insert a country name!"
                            ControlToValidate="TextBoxCountry" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelRegion" runat="server" Font-Bold="True" Text="Region"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxRegion" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelCity" runat="server" Font-Bold="True" Text="City"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="TextBoxCity"
                            ValidationExpression="^[a-zA-Z]+$"
                            ErrorMessage="You have inserted an invalid city name!"
                            ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server"
                            ErrorMessage="You must insert a city name!"
                            ControlToValidate="TextBoxCity"
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelStreet" runat="server" EnableTheming="True" Font-Bold="True" Text="Street name"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxStreetName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelStreetNumber" runat="server" Font-Bold="True" Text="Street number"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxStreetNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelBlock" runat="server" Font-Bold="True" Text="Block"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxBlock" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelApartment" runat="server" Font-Bold="True" Text="Apartment number"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxApartmentNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelFloor" runat="server" Font-Bold="True" Text="Floor"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxFloor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="LabelPostal_code" runat="server" Font-Bold="True" Text="Postal code"></asp:Label>
                    </td>
                    <td style="width: 678px">
                        <asp:TextBox ID="TextBoxPostalCode" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                            ForeColor="Red"
                            HeaderText="The page errors are:" />
                    </td>
                    <td style="width: 678px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Button ID="ButtonBackToStep2" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" OnClick="ButtonBackToStep1_Click" Text="&lt;&lt; Step 2" />
                    </td>
                    <td style="width: 678px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="ButtonStep4" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" OnClick="ButtonStep4_Click" Text="Step 4 &gt;&gt;" />
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>

        <asp:View ID="ViewReaderSummary" runat="server">

            <table style="border: 1px solid black">
                <tr>
                    <td colspan="2">
                        <h2 style="color: black; text-align: center;">Step 4 - Summary</h2>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h4 style="text-align: center">&nbsp;&nbsp; Personal Details</h4>
                    </td>
                </tr>
                <tr>

                    <td style="width: 363px">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Personal identification number"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryCNP" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 363px">
                        <asp:Label ID="LabelAdress" runat="server" Font-Bold="True" Text="Adress"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryAdress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 363px; height: 23px;">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="First name"></asp:Label>
                    </td>
                    <td style="width: 592px; height: 23px;">
                        <asp:Label ID="LabelSummaryFN" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 363px">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Last name"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryLN" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 363px">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Gender "></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryGender" runat="server"></asp:Label>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <h4 style="text-align: center">Contact Details</h4>
                    </td>
                </tr>
                <tr>
                    <td style="width: 364px">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Adress id" Visible="False"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryAdressId" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 364px">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 364px">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Phone number"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryPhone" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adress Details</h4>
                    </td>
                </tr>

                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Country"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryCountry" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Region"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryRegion" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="City"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelCitySummary" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label11" runat="server" EnableTheming="True" Font-Bold="True" Text="Street name"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryStreetName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Street number"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryStreetNumber" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Block"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryBlock" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Apartment number"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryApartment" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Floor"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryFloor" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 367px">
                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Postal code"></asp:Label>
                    </td>
                    <td style="width: 592px">
                        <asp:Label ID="LabelSummaryPostalCode" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 364px">
                        <asp:Button ID="ButtonBackStep3" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" Text="&lt;&lt; Step 3" OnClick="ButtonBackStep2_Click" />
                    </td>
                    <td style="width: 592px">
                        <asp:Button ID="ButtonSubmit" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" Style="margin-left: 313px" Text="Submit" OnClick="ButtonSubmit_Click" />
                    </td>
                </tr>

                <asp:Label ID="LabelDataState" runat="server" Text=""></asp:Label>

            </table>


        </asp:View>
    </asp:MultiView>


</asp:Content>
