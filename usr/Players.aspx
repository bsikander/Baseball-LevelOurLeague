<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true"
    CodeFile="Players.aspx.cs" Inherits="Players" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
    <tr>
        <td >
            <asp:Label ID="lblText" Text="Players Management Page" runat="server" 
                Font-Bold="True" Font-Size="Small" />
        </td>
    </tr>
        <tr>
            <td>
                <asp:Button ID="btnAddNew" runat="server" Text="Add New Player" 
                    onclick="btnAddNew_Click" />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                    Text="Button" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sports1ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT playerName, average, playerId FROM player WHERE (organizationId = @organizationId) AND (leagueId = @leagueId)" 
                    DeleteCommand="DELETE FROM player WHERE (playerId = @playerId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="organizationId" SessionField="orgid" Type="Int32" 
                            DefaultValue="10" />
                        <asp:ControlParameter ControlID="ddlLeagues" Name="leagueId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="playerId" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl" Text="Select League" runat="server" />
                &nbsp;
                <asp:DropDownList ID="ddlLeagues" runat="server" AutoPostBack="true" />
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
        <td colspan="2">
        
        
                <asp:GridView ID="gvPlayersList" runat="server" DataKeyNames="playerId"
            AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black"
                    GridLines="Vertical" AllowPaging="True"             
            DataSourceID="SqlDataSource1" AllowSorting="True" 
            >
                    <PagerSettings PageButtonCount="20" />
                    <RowStyle BackColor="#F7F7DE" />
                    <Columns>
                        <asp:BoundField DataField="playerName" HeaderText="playerName" 
                            SortExpression="playerName" />
                        <asp:HyperLinkField DataNavigateUrlFields="playerId" 
                            DataNavigateUrlFormatString="AddPlayers.aspx?PlayerId={0}" 
                            DataTextField="playerName" HeaderText="Player Name" />
                        <asp:BoundField DataField="average" 
                            HeaderText="average" SortExpression="average" />
                        <asp:BoundField DataField="playerId" HeaderText="playerId" 
                            SortExpression="playerId" InsertVisible="False" ReadOnly="True" />
                            
                        <asp:CommandField ShowDeleteButton="True" />
                            
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#66FF99" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#99FF99" />
                </asp:GridView>
                </td>
                </tr>
                
    </table>
</asp:Content>
