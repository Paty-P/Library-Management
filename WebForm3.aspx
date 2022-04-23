<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="LibraryManagement.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">


    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Page_Load" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="book_id" HeaderText="Book id" />
            <asp:BoundField DataField="author_id" HeaderText="Author id" />
            <asp:BoundField DataField="publishing_house_id" HeaderText="Publishing house" />
            <asp:BoundField DataField="title" HeaderText="Title" />
            <asp:BoundField DataField="number_copies" HeaderText="Number of copies" />
            <asp:BoundField DataField="domain_id" HeaderText="Domain id" />
            <asp:BoundField DataField="language" HeaderText="Language" />
            <asp:BoundField DataField="published_date" HeaderText="Published date" DataFormatString="{0:yyyy/MM/dd}"/>
            <asp:BoundField DataField="registration_date" HeaderText="Registration date"  DataFormatString="{0:yyyy/MM/dd}"/>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

</asp:Content>
