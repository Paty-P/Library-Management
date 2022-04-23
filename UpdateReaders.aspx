<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateReaders.aspx.cs" Inherits="LibraryManagement.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <br />
    <h2 style="color:black; text-align: center;">
        Update readers
    </h2>
    <br/>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="reader_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="reader_id" HeaderText="Reader Id" InsertVisible="False" ReadOnly="True" SortExpression="reader_id" />
            <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
            <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkGoldenrod" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkGoldenrod" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
   
        <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" Height="50px" Width="599px" AutoGenerateRows="False" DataKeyNames="reader_id" DataSourceID="SqlDataSource2" OnItemUpdated="DetailsView1_ItemUpdated" Style="margin-right: 123px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkGoldenrod" ForeColor="GhostWhite" />
            <Fields>
                <asp:BoundField DataField="reader_id" HeaderText="Reader id" InsertVisible="False" ReadOnly="True" SortExpression="reader_id" Visible="False" />
                <asp:BoundField DataField="personal_identification_number" HeaderText="Personal Identification Number" SortExpression="personal_identification_number" />
                <asp:BoundField DataField="adress_id" HeaderText="Adress Id" SortExpression="adress_id" />
                <asp:BoundField DataField="first_name" HeaderText="First Nname" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="Last_Name" SortExpression="last_name" />
                <asp:TemplateField HeaderText="gender_id" SortExpression="gender_id">
                    <EditItemTemplate>
                        
                        <asp:DropDownList ID="DropDownList1" runat="server"  datatextfield="FieldName" datavaluefield="FieldValue"> 
                             <asp:ListItem text="" value="gender_id" selected="False">Feminin</asp:ListItem>
                                        <asp:ListItem text="" value="gender_id" selected="False">Masculin</asp:ListItem>
                        </asp:DropDownList>
                    <%--    <%#DataBinder.Eval(Container.DataItem,"field")%>--%>
                       <%-- <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("gender_id") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                   <%-- <InsertItemTemplate> <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("gender_id") %>'></asp:TextBox> </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("gender_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="phone_number" HeaderText="Phone Number" SortExpression="phone_number" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkGoldenrod" HorizontalAlign="Center" />
        </asp:DetailsView>
    <p style="color: brown">
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [reader_id], [first_name], [last_name] FROM [tblReader]"></asp:SqlDataSource>
    </p>
    <p style="color: brown">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [tblReader] WHERE [reader_id] = @reader_id" InsertCommand="INSERT INTO [tblReader] ([personal_identification_number], [adress_id], [first_name], [last_name], [gender_id], [email], [phone_number]) VALUES (@personal_identification_number, @adress_id, @first_name, @last_name, @gender_id, @email, @phone_number)" SelectCommand="select  *  
from tblreader 
" UpdateCommand="UPDATE [tblReader] SET [personal_identification_number] = @personal_identification_number, [adress_id] = @adress_id, [first_name] = @first_name, [last_name] = @last_name, [gender_id] = @gender_id, [email] = @email, [phone_number] = @phone_number WHERE [reader_id] = @reader_id">
            <DeleteParameters>
                <asp:Parameter Name="reader_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="personal_identification_number" Type="String" />
                <asp:Parameter Name="adress_id" Type="Int32" />
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="gender_id" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone_number" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="personal_identification_number" Type="String" />
                <asp:Parameter Name="adress_id" Type="Int32" />
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="gender_id" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone_number" Type="String" />
                <asp:Parameter Name="reader_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblGender]"></asp:SqlDataSource>
    </p>
    <p style="color: brown">
        &nbsp;</p>

</asp:Content>
