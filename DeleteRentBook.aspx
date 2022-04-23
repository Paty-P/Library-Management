<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteRentBook.aspx.cs" Inherits="LibraryManagement.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">

////////folosim in loc de atr, propr
    function toggleSelectionUsingHeaderCheckBox(source) {
        $("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDeleteRow']").each(function () {
            $(this).prop('checked', source.checked);
        });
        }

        //
        function toggleSelectionOfHeaderCheckBox() {
            if ($("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDeleteRow']").length == $("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDeleteRow']:checked").length)
            {
                $("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDelete']").first().prop('checked', true);
            }
            else {
                $("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDelete']").first().prop('checked', false);
            }
        }

        $(document).ready(function () {
            $("#<%=ButtonDelete.ClientID%>").click(function () {
                var rowsSelected = $("#<%=GridViewDeleteRentBook.ClientID%> input[name$='CheckBoxDeleteRow']:checked").length;
                if (rowsSelected == 0) {
                    alert('No rows selected');
                    return false;
                }
                else
                    return confirm(rowsSelected + ' row(s) will be deleted');
            });
        });

        </script>
    <p>
        &nbsp;</p>
   
    <h2 style="color:maroon; text-align: center;">
         Delete rent books from database<br />
    </h2>
    <p>
        <asp:Button ID="ButtonDelete" runat="server" Text="Delete" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" OnClick="ButtonDelete_Click" />
    </p>
    <p>
        <asp:GridView ID="GridViewDeleteRentBook" runat="server" AutoGenerateColumns="False" CellPadding="2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBoxDelete" runat="server"  onclick="toggleSelectionUsingHeaderCheckBox(this)"/>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxDeleteRow" runat="server" onclick="toggleSelectionOfHeaderCheckBox()"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reader id" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelReaderId" runat="server" Text='<%# Bind("reader_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="book_id" HeaderText="Book id" Visible="False" />
                <asp:BoundField DataField="registration_number" HeaderText="Registration number" />
                <asp:BoundField DataField="borrow_date" HeaderText="Borrow date"  DataFormatString="{0: yyyy-MM-dd}"  />
                <asp:BoundField DataField="return_date" HeaderText="Return date"  DataFormatString="{0: yyyy-MM-dd}"  />
                <asp:BoundField DataField="status" HeaderText="Status" />
                
                <asp:BoundField DataField="rent_id" HeaderText="rent_id" Visible="False" />
                
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

        <asp:Label ID="LabelMessage" runat="server" Font-Bold="true"></asp:Label>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
<p>
    </p>
<p>
    </p>      
        &nbsp;</asp:Content>
