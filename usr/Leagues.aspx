<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true"
    CodeFile="Leagues.aspx.cs" Inherits="UserPages_Leagues" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="Button12" runat="server" Text="Button" OnClick="Button12_Click" Visible="False" />
    <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
        <tr>
            <td style="font-weight: bold; font-family: Verdana; color: white;" align="left" colspan="2">
                Enter the following information
            </td>
        </tr>
        <tr>
            <td style="width: 30%" align="right">
                <asp:Label ID="dd" runat="server" Text="Select League" />
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlLeague" runat="server" Width="128px">
                    <%--<asp:ListItem>League1</asp:ListItem>
                    <asp:ListItem>League2</asp:ListItem>
                    <asp:ListItem>League3</asp:ListItem>--%>
                </asp:DropDownList>
                
                
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 21%;">
                <asp:Label ID="lblNoOfTeams" runat="server" AssociatedControlID="txtNoOfTeams">No 
                of Teams &nbsp;</asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtNoOfTeams" runat="server" OnTextChanged="txtNoOfTeams_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNoOfTeam" runat="server" ErrorMessage="*" ControlToValidate="txtNoOfTeams" />
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 21%">
                <asp:Label ID="lblNoOfPlayers" Text="No of Players" runat="server" />
            </td>
            <td align="left">
                <asp:TextBox ID="txtNoOfPlayersPerTeam" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvplayers" runat="server" ErrorMessage="*" ControlToValidate="txtNoOfPlayersPerTeam" />
            </td>
        </tr>
        <tr>
            <td >
                
            </td>    
                    
                        <td align="left" >
                            <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="Make Teams" />
                        </td>
                
            
        </tr>
        <%--<asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />
                <asp:GridView ID="GridView2" runat="server">
                </asp:GridView>--%>
        </tr>
        <tr>
            <td style="width: 21%">
                <div id="lblTeamName" runat="server">
                </div>
            </td>
            <td>
                <div id="gvTeam" runat="server">
                    <asp:Label ID="lblError" runat="server" Text="" ></asp:Label>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
