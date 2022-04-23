<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateReaderAndAdress.aspx.cs" Inherits="LibraryManagement.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2 style="color: black; text-align: center;">Update reader</h2>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Insert Reader CNP"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server" Style="margin-left: 64px; margin-bottom: 0em;"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" BackColor="Tan" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound1">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" Text="Update" runat="server" BackColor="Tan" OnClick="btnUpdate_Click"></asp:Button>
                </ItemTemplate>
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
        <br />
    <fieldset style="padding:20px;top:230px; position:center;">
                      <legend>Reader Details</legend>
      <table>
          <tr>
              <td>
                  
                      <table>
                          <tr>
                              <td>
                                  CNP</td>
                                <td>
                                    <asp:TextBox ID="txtCNP" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  First Name</td>
                                <td>
                                    <asp:TextBox ID="txtFN" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td>
                                  Last Name</td>
                                <td>
                                    <asp:TextBox ID="txtLN" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td style="height: 42px">
                                  Gender</td>
                                <td style="height: 42px">
                                    <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                              </td>
                          </tr>
                           <tr>
                              <td style="height: 42px">
                                  Email</td>
                                <td style="height: 42px">
                                    <asp:TextBox ID="txtEmail" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                      </table>
                 
              </td>
               <td>
                  
                      <table>
                          <tr>
                              <td>
                                  Phone</td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Country</td>
                                <td>
                                    <asp:TextBox ID="txtCountry" runat="server" style="margin-bottom: 0.2em"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td>
                                  Region</td>
                                <td>
                                    <asp:TextBox ID="txtRegion" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>                         
                          </tr>
                           <tr>
                              <td>
                                  <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCity" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label8" runat="server" Text="Street Name"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxStreetName" runat="server" style="margin-bottom: 0.2em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2" align ="center">
                                  <asp:Button ID="ButtonSave" runat="server" Text="Save" BackColor="Tan" ForeColor="Black" Height="31px" Width="243px" align="center" OnClick="ButtonSave_Click" />
                              </td>

                      </table>
                 
              </td>
               <td>
                   
                        <table>
                            
                            <tr>
                                <td style="height: 32px">
                                    <asp:Label ID="Label10" runat="server" Text="Street Number"></asp:Label>
                                </td>
                                <td style="height: 32px">
                                    <asp:TextBox ID="TextStreetNumber" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text="Apartment"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxApartment" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Text="Floor"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFloor" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                              <td>
                                  <asp:Label ID="Label7" runat="server" Text="Postal Code"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPostalCode" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                             <tr>
                              <td>
                                  Block</td>
                                <td>
                                    <asp:TextBox ID="TextBoxBlock" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                        </table>
               </td>
          </tr>
      </table>
             </fieldset>
&nbsp;<asp:SqlDataSource ID="SqlDataSourceGV" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [vwSelectPubliserAndAdress]">
        </asp:SqlDataSource>
  
<br />
                <asp:HiddenField ID="HiddenFieldAdressId" runat="server"  />
            <asp:HiddenField ID="HiddenFieldReaderId" runat="server" />
</asp:Content>
