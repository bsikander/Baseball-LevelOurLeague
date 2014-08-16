<%@ Page Language="C#" MasterPageFile="~/Simple/Admin.master" AutoEventWireup="true" CodeFile="AddModiOrg.aspx.cs" Inherits="Simple_AddModiOrg" Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
    <tr>
    <td>
        <asp:Label ID="lblHeading" Text="Organization Details" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Medium" Font-Underline="true"/>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbl" Text="Organization Name" runat="server" />
        </td>
        <td>
            <asp:Label ID="lblOrganizationName" Text="" runat="server" />
         </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbl1" runat="server" Text="Total Amount Paid" />
        </td>
        <td>
            <asp:Label ID="lblTotalAmount" runat="server" Text="" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblTotalLeagues" runat="server" Text="Leagues" />
        </td>
        <td>
            <asp:DropDownList ID="ddlList" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlList_SelectedIndexChanged" />
        </td>        
    </tr>
    <tr>
        <td>
            <asp:Label ID="lble" runat="server" Text="Registration Date " />            
        </td>
        <td>
            <asp:Label ID="lblRegDate" runat="server" Text="" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Expiry Date " />            
        </td>
        <td>
            <asp:Label ID="lblExpDate" runat="server" Text="" />
        </td>
    </tr>
    
    <tr>
        <td colspan="2">
        <asp:Label ID="lblNoPlayers" runat="server" Text="No Players In Your Organization" 
                Visible="False" Font-Bold="True"/>
        
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="playerId" DataSourceID="SqlDataSource1" AllowPaging="True" 
                AllowSorting="True" BackColor="White"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black"
                    GridLines="Vertical"  >
        <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:BoundField DataField="playerName" HeaderText="Player Name" 
                        SortExpression="playerName" >
                        <ControlStyle Width="60px" />
                        <HeaderStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fielding" HeaderText="Fielding" 
                        SortExpression="fielding" >
                        <ControlStyle Width="30px" />
                        <HeaderStyle Width="15%" />
                        
                    </asp:BoundField>
                    <asp:BoundField DataField="hitting" HeaderText="Hitting" 
                        SortExpression="hitting" >
                        <ControlStyle Width="30px" />
                        <HeaderStyle Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pitching" HeaderText="Pitching" 
                        SortExpression="pitching" >
                        <ControlStyle Width="30px" />
                        <HeaderStyle Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="baseRunning" HeaderText="Base Running" 
                        SortExpression="baseRunning" >
                        <ControlStyle Width="30px" />
                        <HeaderStyle Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="speed" HeaderText="Speed" SortExpression="speed" >
                        <ControlStyle Width="30px" />
                        <HeaderStyle Width="15%" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                
                <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#66FF99" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#99FF99" />
                
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:sports1ConnectionString %>" 
                DeleteCommand="DELETE FROM player WHERE (playerId = @playerId)" 
                SelectCommand="SELECT playerName, average, fielding, hitting, pitching, baseRunning, speed, playerId FROM player WHERE (organizationId = @organizationId) AND (leagueId = @leagueId)" 
                
                UpdateCommand="UPDATE player SET playerName = @playerName, fielding = @fielding, hitting = @hitting, pitching = @pitching, baseRunning = @baseRunning, speed = @speed">
                <SelectParameters>
                      <asp:QueryStringParameter Name="organizationId" QueryStringField="orgId" />                      
                      <asp:ControlParameter ControlID="ddlList" Name="leagueId" 
                          PropertyName="SelectedValue" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="playerId" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="playerName" />
                    <asp:Parameter Name="fielding" />
                    <asp:Parameter Name="hitting" />
                    <asp:Parameter Name="pitching" />
                    <asp:Parameter Name="baseRunning" />
                    <asp:Parameter Name="speed" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </td>
    </tr>
</table>
</asp:Content>

