<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true" CodeFile="AddPlayers.aspx.cs" Inherits="usr_AddPlayers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="font-size: 10pt; font-family: Verdana; width: 400px;" border="0">
    <tr>
        <td class="normal_txt">
            <asp:Label ID="lblHeading" Text="Enter Players Information" runat="server" />
        </td>
    </tr>
    
    <tr>
    <td>
        Select League
    </td>
        <td>
            <asp:DropDownList ID="ddlLeague" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="leagueId" DataValueField="leagueId" 
                onselectedindexchanged="ddlLeague_SelectedIndexChanged" >
                
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:sports1ConnectionString2 %>" 
                SelectCommand="SELECT [leagueId] FROM [leagues] WHERE ([orgId] = @orgId2)">
                <SelectParameters>
                    <asp:SessionParameter Name="orgId2" SessionField="orgid" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    
    <tr>
        <td>
            <asp:Label ID="lblError" runat="server" ></asp:Label>
        </td>
        <td align="right" style="color:Red">
            *Required
        </td>
    </tr>
        <tr>
            <td align="right" class="normal_txt">
                Name &nbsp;
            </td>
            <td style="width: 83px">
                <asp:TextBox ID="txt_playerName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="txt_playerName"
                    ErrorMessage="Enter the Player Name">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        
        
        <tr>
            <td align="right" width="175" class="normal_txt">
                <%--Fielding --%>
                <asp:Label ID="lblFielding" runat="server" /> 
                &nbsp;
            </td>
            <td style="width: 175px">
                <asp:DropDownList ID="cmbx_fielding" runat="server" Width="128px"  OnSelectedIndexChanged="cmbx_fielding_SelectedIndexChanged">
                    <asp:ListItem Text="[Rate]" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="valFielding" runat="server" InitialValue="[Rate]"
                    ControlToValidate="cmbx_fielding" ErrorMessage="Rating in terms of Fielding is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" width="175" class="normal_txt">
                <%--Pitching --%>
                <asp:Label ID="lblPitching" runat="server" />
                &nbsp;
            </td>
            <td style="width: 175px">
                <asp:DropDownList ID="cmbx_pitching" runat="server" Width="128">
                    <asp:ListItem Text="[Rate]" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="[Rate]"
                    ControlToValidate="cmbx_pitching" ErrorMessage="Rating in terms of Picthing is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" width="175" class="normal_txt">
                <%--Base Running --%>
                <asp:Label ID="lblBaseRunning" runat="server" />
                &nbsp;
            </td>
            <td style="width: 175px">
                <asp:DropDownList ID="cmbx_running" runat="server" Width="128">
                    <asp:ListItem Text="[Rate]" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="[Rate]"
                    ControlToValidate="cmbx_running" ErrorMessage="Rating in terms of Base Running is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" width="175" class="normal_txt">
                <%--Hitting --%>
                <asp:Label ID="lblHitting" runat="server" />
                &nbsp;
            </td>
            <td style="width: 175px">
                <asp:DropDownList ID="cmbx_hitting" runat="server" Width="128">
                    <asp:ListItem Text="[Rate]" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="[Rate]"
                    ControlToValidate="cmbx_hitting" ErrorMessage="Rating in terms of Hitting is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" width="175" class="normal_txt">
                <%--Speed --%>
                <asp:Label ID="lblSpeed" runat="server" />
                &nbsp;
            </td>
            <td style="width: 175px">
                <asp:DropDownList ID="cmbx_speed" runat="server" Width="128px">
                    <asp:ListItem Text="[Rate]" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="[Rate]"
                    ControlToValidate="cmbx_speed" ErrorMessage="Rating in terms of Speed is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="normal_txt">
                <asp:Label ID="lblAverage" Text="Average" runat="server" /> &nbsp;
            </td>
            <td style="width: 83px">                
               <asp:TextBox ID="txt_average" runat="server" ReadOnly="True">1</asp:TextBox>                    
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
        
            
            <td align="center" colspan="2" >
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="txt_submitPlayerInfo1_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" 
                    CausesValidation="False" />
            </td>
            
            <td>
                &nbsp;
            </td>
            
            
            
        </tr>
    </table>


</asp:Content>

