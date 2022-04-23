<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteBooks.aspx.cs" Inherits="LibraryManagement.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

  
  <br />        
        <h2 style="color:black">Delete books from database
        </h2>
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" 
            DeleteCommand="DELETE FROM [tblBook] WHERE [book_id] = @book_id" 
            
            SelectCommand="SELECT * FROM [tblBook]">
            <DeleteParameters>
                <asp:Parameter Name="book_id" Type="Int32" />
            </DeleteParameters>
           
            
        </asp:SqlDataSource>
  
      
        <asp:GridView ID="GridView1" EmptyDataRowStyle-ForeColor="Red" EmptyDataText="Sorry! There is no data present. Please add or wait for others to enter record." runat="server" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="book_id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="book_id" HeaderText="Book id" InsertVisible="False" ReadOnly="True" SortExpression="book_id" Visible="False" />
                <asp:BoundField DataField="author_id" HeaderText="Author id" SortExpression="author_id" Visible="False" />
                <asp:BoundField DataField="publishing_house_id" HeaderText="Publishing house id" SortExpression="publishing_house_id" Visible="False" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="number_copies" HeaderText="Number of copies" SortExpression="number_copies" />
                <asp:BoundField DataField="published_date" HeaderText="Published date" SortExpression="published_date"  DataFormatString="{0: yyyy-MM-dd}"/>
                <asp:BoundField DataField="domain_id" HeaderText="Domain id" SortExpression="domain_id" Visible="False" />
                <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" Visible="False" />
                <asp:BoundField DataField="registration_date" HeaderText="Registration date" SortExpression="registration_date"  DataFormatString="{0: yyyy-MM-dd}" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            </Columns>

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
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
 
</asp:Content>
