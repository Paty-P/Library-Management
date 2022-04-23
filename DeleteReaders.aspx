<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteReaders.aspx.cs" Inherits="LibraryManagement.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">

////////folosim in loc de atr, propr
    function toggleSelectionUsingHeaderCheckBox(source) {
        $("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDeleteRow']").each(function () {
            $(this).prop('checked', source.checked);
        });
        }

        //
        function toggleSelectionOfHeaderCheckBox() {
            if ($("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDeleteRow']").length == $("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDeleteRow']:checked").length)
            {
                $("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDelete']").first().prop('checked', true);
            }
            else {
                $("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDelete']").first().prop('checked', false);
            }
        }

        $(document).ready(function () {
            $("#<%=ButtonDelete.ClientID%>").click(function () {
                var rowsSelected = $("#<%=GridViewDeleteReaders.ClientID%> input[name$='CheckBoxDeleteRow']:checked").length;
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
   
        
    <h2 style="color:black">
       Delete readers from database<br />
    </h2>
   
        <asp:Button ID="ButtonDelete" runat="server" Text="Delete" BackColor="#FFFFCC" Font-Bold="True" ForeColor="Maroon" OnClick="ButtonDelete_Click" />
   
        <asp:GridView ID="GridViewDeleteReaders" runat="server" AutoGenerateColumns="False" CellPadding="2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
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
                <asp:BoundField DataField="personal_identification_number" HeaderText="Personal identification number" />
                <asp:BoundField DataField="adress_id" HeaderText="Adress id" />
                <asp:BoundField DataField="first_name" HeaderText="First name" />
                <asp:BoundField DataField="last_name" HeaderText="Last name" />
                <asp:BoundField DataField="gender_id" HeaderText="Gender id" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="phone_number" HeaderText="Phone number" />
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
    <p>
    </p>
</asp:Content>
