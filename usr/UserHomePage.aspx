<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            
            <table>
            <tr>
                <td align="center">
                    <asp:LinkButton runat="server" ID="ChangePassword" Font-Bold="True" 
                        ForeColor="White" onclick="ChangePassword_Click" >Change Password</asp:LinkButton>                    
                </td>
                <td align="center">
                    <asp:LinkButton runat="server" ID="lManagePlayers" Font-Bold="True" 
                        ForeColor="White" onclick="lManagePlayers_Click" >Manage Players</asp:LinkButton>
                </td>
                <td align="center" width="120px">
                    <asp:LinkButton runat="server" ID="lCreateLeagues" Font-Bold="true" 
                        ForeColor="White" onclick="lCreateLeagues_Click">Create Leagues</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOrgName" Text="Organization Name" runat="server" 
                        Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="lblOrganizationName" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTP" Text="Total Players" runat="server" Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="lblTotalPlayers" Text="" runat="server" />
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lblLR" Text="Leagues Registered" runat="server" Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="lblLeaguesRegistered" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTMP" Text="Total Amount Paid" runat="server" Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="lblTotalAmountPaid" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvOrg" runat="server">
                    
                    </asp:GridView>
                </td>
            </tr>
            </table>

</asp:Content>

