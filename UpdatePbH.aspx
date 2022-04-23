<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdatePbH.aspx.cs" Inherits="LibraryManagement.WebForm18" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <br />
    <h2 style="color: black; text-align: center;">Update&nbsp; Publishing House</h2>
    <asp:Panel ID="Panel1" runat="server">
    <table style="align-items:center">
       <tr>
           <td style="height: 30px">
               <asp:Label ID="Label5" runat="server" Text="Insert Publishing House Name"></asp:Label>
           </td>
           <td style="height: 30px">
               <asp:TextBox ID="TextBoxSearch" runat="server" style="margin-bottom: 0em" AutoCompleteType="Disabled"></asp:TextBox>
           </td>
           <td style="height: 30px">
               <asp:Button ID="Buttonsearch" runat="server" Text="Search" OnClick="Buttonsearch_Click" BackColor="Tan" />
           </td>
       </tr>
   </table>
            <asp:GridView ID="GridView1" EmptyDataText=" There are no publishing to display!" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-Font-Bold="true" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server"  Text="Update" OnClick="btnUpdate_Click" style="background-color:tan"/>
                            <%--<asp:Button ID="btnDelete" runat="server"  Text="Delete" OnClick=" btnDelete_Click" style="background-color:tan"/>--%>
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
        <fieldset style="padding:20px;top:230px; position:center;">
                      <legend>Publishing House Details</legend>
      <table>
          <tr>
              <td>
                  
                      <table>
                          <tr>
                              <td>
                                  Publishing House Name</td>
                                <td>
                                    <asp:TextBox ID="TextBoxPHName" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Phone Number</td>
                                <td>
                                    <asp:TextBox ID="TextBoxPhoneNumber" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td>
                                  <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCountry" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td style="height: 42px">
                                  <asp:Label ID="Label6" runat="server" Text="Region"></asp:Label>
                              </td>
                                <td style="height: 42px">
                                    <asp:TextBox ID="TextBoxRegion" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                      </table>
                 
              </td>
               <td>
                  
                      <table>
                          <tr>
                              <td>
                                  <asp:Label ID="Label13" runat="server" Text="City"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCity" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label14" runat="server" Text="Street Name"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxStreetName" runat="server" style="margin-bottom: 0.2em"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td>
                                  <asp:Label ID="Label4" runat="server" Text="Street Number"></asp:Label>
                              </td>
                                <td>
                                    <asp:TextBox ID="TextBoxStreetnumber" runat="server" style="margin-bottom: 0em"></asp:TextBox>
                              </td>                         
                          </tr>
                          <tr>
                              <td colspan="2" align ="center">
                                  <asp:Button ID="ButtonSave" runat="server" Text="Save" BackColor="Tan" ForeColor="Black" Height="31px" Width="243px" align="center" OnClick="ButtonSave_Click1" />
                              </td>
                          </tr>
                      </table>
                 
              </td>
               <td>
                   
                        <table>
                            
                            <tr>
                                <td style="height: 32px">
                                    <asp:Label ID="Label10" runat="server" Text="Block"></asp:Label>
                                </td>
                                <td style="height: 32px">
                                    <asp:TextBox ID="TextBoxBlock" runat="server" style="margin-bottom: 0em"></asp:TextBox>
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
                        </table>
               </td>
          </tr>
      </table>
             </fieldset>
    
   
        <asp:SqlDataSource ID="SqlDataSourceGV" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [vwSelectPubliserAndAdress]">
        </asp:SqlDataSource>
  
        <asp:HiddenField ID="HiddenFieldPH_Id" runat="server" />
        <asp:HiddenField ID="HiddenFieldAdressId" runat="server" />
  
        <br />
        <br />
        <br />
        <br />
        <br />
  
        &nbsp;</asp:Panel>
        <br />

</asp:Content>
