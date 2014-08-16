<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true"
    CodeFile="ScoringParameter.aspx.cs" Inherits="usr_ScoringParameter" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="font-size: 10pt; font-family: Verdana; width: 400px;" border="0">
    <tr>
        <td colspan ="2">
            Enter your desired names for Scoring Parameters
        </td>
    </tr>
        <tr>
            <td align="right" width="200px">
                Fielding&nbsp;&nbsp;
            </td>
            <td width="200px">
                <asp:TextBox ID="txtField" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Pitching&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtPitching" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Base Running&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtBase" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Speed&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtSpeed" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Hitting&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtHitting" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
