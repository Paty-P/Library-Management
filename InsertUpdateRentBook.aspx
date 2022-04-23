<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertUpdateRentBook.aspx.cs" Inherits="LibraryManagement.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <style>
fieldset {
  background-color:tan;
  width:500px;
}
        </style>
   
    <br />
<asp:Label ID="Label2" runat="server" Text="Insert CNP"></asp:Label>
   <asp:TextBox ID="TextBoxCNP" runat="server" OnTextChanged="TextBoxCNP_TextChanged" AutoPostBack="True" style="margin-bottom: 0em"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCNP" runat="server"
                                ControlToValidate="TextBoxCNP"
                                ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b" 
                                ForeColor="red"
                                ErrorMessage="You have inserted a invalid Personal Identification Number!" Display="Dynamic"></asp:RegularExpressionValidator>
     <strong><span style="font-size: medium"><asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Search" style="margin-left: 28px" />
    <br />
   
    <asp:Label ID="Label3" runat="server" Text="Reader Name:"></asp:Label>

    <asp:Label ID="LabelName" runat="server"></asp:Label>
   
    <br />
    </span></strong><br />
    <br />
    <asp:Label ID="LabelData" runat="server" ForeColor="Green"></asp:Label>
    <br />
    <asp:RadioButton ID="RadioButtonInsert" runat="server" AutoPostBack="True" BackColor="#FFFF99" Font-Bold="True" ForeColor="Black" GroupName="RBRentBook" OnCheckedChanged="RadioButtonInsert_CheckedChanged" Text="Borrow" />
    <asp:RadioButton ID="RadioButtonUpdate" runat="server" AutoPostBack="True" BackColor="#FFFF99" Font-Bold="True" GroupName="RBRentBook" OnCheckedChanged="RadioButtonUpdate_CheckedChanged" Text="Return" />
    <br />
    <br />
    <asp:Panel ID="PanelInsert" runat="server" align-text="center">
        <fieldset>
        <br />
         <h2> Insert Rent Book</h2>
    <table style="align-content:flex-start; width: 454px;">
        <tr>
             <td style="font-size: medium; text-align: right; width: 507px">Registration Number</td>
            <td style="width: 135px">
                <asp:TextBox ID="TextBoxRegistrationNumber" runat="server" AutoPostBack="True" Height="30px" Width="130" OnTextChanged="TextBoxRegistrationNumber_TextChanged" style="margin-bottom: 0em"></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td style="font-size: medium; text-align: right; width: 507px">Borrow Date</td>
            <td style="width: 135px">
                &nbsp;&nbsp;
                <br />
&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" Height="18px" ImageUrl="~/Images/unnamed.png" OnClick="ImageButton1_Click" Width="19px" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBoxBorrowDate" runat="server" Width="130px" Height="30px"  style="margin-bottom: 0em"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Calendar ID="CalendarBorrowdate" runat="server" BackColor="#FFFF99" BorderColor="#999999" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="CalendarBorrowdate_DayRender" OnSelectionChanged="CalendarBorrowdate_SelectionChanged" Width="200px" CellPadding="4">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 507px; height: 22px;">Status:</td>
            <td style="width: 135px; height: 41px;">
                <asp:Label ID="LabelStatus" runat="server" Text="Unknown"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 507px">&nbsp;</td>
            <td style="width: 135px">
                <asp:Button ID="ButtonSubmit" runat="server" style="margin-left: 0px; margin-top: 29px" Text="Submit" Width="130px" Height="30px" OnClick="ButtonSubmit_Click" />
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 507px">
                <asp:HiddenField ID="HiddenFieldRaderId" runat="server" />
            </td>
            <td style="width: 135px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 507px">
                <asp:HiddenField ID="HiddenFieldBookId" runat="server" />
            </td>
            <td style="width: 135px">&nbsp;</td>
        </tr>
    </table>
            </fieldset>
        </asp:Panel>

    <asp:Panel ID="PanelUpdate" runat="server">
      <fieldset>
          

        <h2> Update Rent Book</h2>
       <table style="align-content:flex-start; width: 454px;">
             <tr>
            <td style="font-size: medium; text-align: right; width: 489px">Registration Number</td>
            <td style="width: 135px">
                <asp:TextBox ID="TextBoxRegistrationNrUpdate" runat="server" Height="30px" Width="130px" style="margin-bottom: 0em"></asp:TextBox>
            </td>
        </tr>
             <tr>
                 <td style="font-size: medium; text-align: right; width: 489px">Return Date</td>
                 <td style="width: 135px; text-align: left;">&nbsp;&nbsp;
                     <br />
                     &nbsp;
                     <asp:ImageButton ID="ImageButton2" runat="server" Height="18px" ImageUrl="~/Images/unnamed.png" OnClick="ImageButton2_Click" Width="19px" />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="TextBoxReturndate" runat="server" Width="130px" Height="30px" style="margin-bottom: 0em"></asp:TextBox>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Calendar ID="CalendarReturnDate" runat="server" BackColor="#FFFF99" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="CalendarReturnDate_DayRender" OnSelectionChanged="CalendarReturnDate_SelectionChanged" Width="200px">
                         <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                         <NextPrevStyle VerticalAlign="Bottom" />
                         <OtherMonthDayStyle ForeColor="#808080" />
                         <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                         <SelectorStyle BackColor="#CCCCCC" />
                         <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                         <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                         <WeekendDayStyle BackColor="#FFFFCC" />
                     </asp:Calendar>
                     </td>
             </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 489px">Status:</td>
            <td style="width: 135px" height="41px">
                <asp:Label ID="LabelUpdate" runat="server" Text="Unknown"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 489px">&nbsp;</td>
            <td style="width: 135px">
                <asp:Button ID="ButtonUpdate" runat="server" style="margin-left: 0px; margin-top: 29px" Text="Update" Width="135px" Height="30px" OnClick="ButtonUpdate_Click" />
                <br />
            </td>
        </tr>
        </table>
        </fieldset>
    </asp:Panel>
    <br />
    <br />
    <br />

    <br />
    <br />


</asp:Content>
