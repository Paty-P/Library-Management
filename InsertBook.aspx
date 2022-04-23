<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertBook.aspx.cs" Inherits="LibraryManagement.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
   
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="jquery/pikaday.js"></script>
    <br />
<h2 style="text-align: center">INSERT BOOKS INTO DATABASE</h2> 
    <br />
  
    <table style="width: 100%">
        <tr>
            <td style="height: 33px; font-size: medium; text-align: right; width: 155px"><strong>Author name</strong></td>
            <td style="height: 33px; width: 135px">
                
                <asp:DropDownList ID="ddlAuthorName" runat="server" style="font-size: medium" DataSourceID="SqlDataSource5" DataTextField="Authorname" DataValueField="author_id" ValidateRequestMode="Enabled">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Publishing house</strong></td>
            <td style="width: 135px">
                <asp:DropDownList ID="ddlPublishingHouse" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="publishing_house_id" Height="27px" Width="114px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Title</strong></td>
            <td style="width: 135px">
                <asp:TextBox ID="TextBoxTitle" runat="server" style="margin-bottom: 0.4em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px; height: 54px;"><strong>Number of copies</strong></td>
            <td style="width: 135px; height: 54px;">
                <asp:TextBox ID="TextBoxNrCopies" runat="server" style="margin-bottom: 0.6em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px; height: 35px;"><strong>Published date</strong></td>
            <td style="width: 135px; height: 35px;">
                <br />
                <script type="text/javascript">
                            var picker = new Pikaday(
                                {
                                    
                                    field: document.getElementById('TextBoxPublishedDate'),
                                    firstDay: 1,
                                    minDate: new Date('1800-01-01'),
                                    maxDate: new Date('2021-12-31'),
                                    yearRange: [1800, 2021],
                                    numberOfMonths: 1,
                                    theme: 'dark-theme'
                                });
                        </script>

                <%--<asp:Calendar ID="CalendarPublisheddate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="CalendarPublisheddate_DayRender" OnSelectionChanged="CalendarPublisheddate_SelectionChanged" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>--%>
                <asp:TextBox ID="TextBoxPublishedDate" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}" runat="server" Text='<%# Bind("published_date", "{0: yyyy-MM-dd}") %>' Width="138px" Height="34px" style="margin-bottom: 0em" AutoCompleteType="Disabled"></asp:TextBox>
                <script type="text/javascript">

                    var picker = new Pikaday(
                        {
                            field: document.getElementById('TextBoxPublishedDate'),
                            firstDay: 1,
                            minDate: new Date('1800-01-01'),
                            maxDate: new Date('2021-12-31'),
                            yearRange: [1800, 2021],
                            numberOfMonths: 1,
                            theme: 'dark-theme'
                        });
                        </script>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Domain</strong></td>
            <td style="width: 135px">
                <asp:DropDownList ID="ddlDomain" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="domain_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Language</strong></td>
            <td style="width: 135px">
                <asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="SqlDataSource4" DataTextField="language_name" DataValueField="language_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Registration date</strong></td>
            <td style="width: 135px">
                <asp:TextBox ID="TextBoxRegistrationDate" ClientIDMode="Static" DataFormatString="{0: yyyy-MM-dd}"  runat="server" Text='<%# Bind("registration_date","{0: yyyy-MM-dd}" ) %>' style="margin-bottom:0em; margin-top: 1em;" Height="34px" Width="138px" AutoCompleteType="Disabled"></asp:TextBox>
                &nbsp;<script type="text/javascript">
                    var picker = new Pikaday(
                        {
                            field: document.getElementById('TextBoxRegistrationDate'),
                            firstDay: 1,
                            minDate: new Date('1800-01-01'),
                            maxDate: new Date('2021-12-31'),
                            yearRange: [1800, 2021],
                            numberOfMonths: 1,
                            theme: 'dark-theme'
                        });
                        </script><br />
               <%-- <asp:Calendar ID="CalendarRegistrationDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="CalendarRegistrationDate_DayRender" OnSelectionChanged="CalendarRegistrationDate_SelectionChanged" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>--%>
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px"><strong>Price</strong></td>
            <td style="width: 135px">
                <asp:TextBox ID="TextBoxPrice" runat="server" style="margin-bottom: 0.2em"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px">&nbsp;</td>
            <td style="width: 135px">
                <asp:HiddenField ID="HiddenFieldBook_Id" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; text-align: right; width: 155px">&nbsp;</td>
            <td style="width: 135px">
                <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmitClick" style="margin-left: 148px; margin-top: 29px" Text="Submit" Width="100px" />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblBook]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [name], [domain_id] FROM [tblDomain]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [publishing_house_id], [name] FROM [tblPublishingHouse]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [language_id], [language_name] FROM [tblLanguage]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spAuthorName" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
