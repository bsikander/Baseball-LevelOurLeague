<%@ Page Language="C#" MasterPageFile="~/usr/User.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="usr_Payments" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                    <tr>
                        <td style="color: white; font-weight: bold;" align="center" colspan="2">
                            Enter Your Credit Card Details<br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 49px">
                            <asp:Label ID="lblInstruction3" runat="server" Text="Instructions" ForeColor="Orange"
                                Font-Bold="true"></asp:Label>
                            <br />
                            <asp:Label ID="lblInstruction4" runat="server" Text="This is Test Mode. Use the Test Credit Card Number 4007000000027."></asp:Label>
                        </td>
                    </tr>
                    <%--<asp:Label ID="lblCreditCard" runat="server"></asp:Label>--%>
                    
                    <tr>
                        <td align="center" colspan="2">
                           
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                            <asp:Label ID="Errorlbl" runat="server"></asp:Label>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="right">
                            Expired Leagues
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLeauges" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label6" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="FirstNameTextBox" 
                                ErrorMessage="First Name is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="FirstNameTextBox" 
                                ErrorMessage="Please limit the length of the content entered to 40 characters" 
                                ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="LastNameTextBox"
                                ErrorMessage="Last Name is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="LastNameTextBox"
                                ErrorMessage="Please limit the length of the content entered to 40 characters"
                                ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                        </td>
                        <td rowspan="3">
                            <!-- (c) 2006. Authorize.Net is a registered trademark of Lightbridge, Inc. -->

                            <script language="javascript" type="text/javascript">

                            var ANS_customer_id = "1ae28d18-9cbf-488c-a5a3-3fdce9333f50";</script>

                            <script language="javascript" src="//VERIFY.AUTHORIZE.NET/anetseal/seal.js" type="text/javascript">
                            </script>

                            <!--   End Seal  -->
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="AddressTextBox"
                                ErrorMessage="Address is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AddressTextBox"
                                ErrorMessage="Please limit the length of the content entered to 60 characters"
                                ValidationExpression="^[\s\S]{0,60}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="CityTextBox"
                                ErrorMessage="City is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="CityTextBox"
                                ErrorMessage="Please limit the length of the content entered to 40 characters"
                                ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="StateTextBox" runat="server" MaxLength="30"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="StateTextBox"
                                ErrorMessage="State is Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="StateTextBox"
                                ErrorMessage="Please limit the length of the content entered to 40 characters"
                                ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ZipTextBox" runat="server" CssClass="mediumTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ZipTextBox"
                                ErrorMessage="Zip Code Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ZipTextBox"
                                ErrorMessage="Please limit the length of the content entered to 15 characters"
                                ValidationExpression="^[\s\S]{0,15}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" CssClass="mediumTextBox" Text="USA"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="CountryTextBox"
                                ErrorMessage="Country Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                ControlToValidate="CountryTextBox" ErrorMessage="Please limit the length of the content entered to 40 characters"
                                ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="PhoneTextBox"
                                ErrorMessage="Phone is a Required Field" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="EmailTextBox"
                                ErrorMessage="Email is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="EmailTextBox"
                                ErrorMessage="Please limit the length of the content entered to 255 characters"
                                ValidationExpression="^[\s\S]{0,255}$">*</asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator49" runat="server"
                                ControlToValidate="EmailTextBox" ErrorMessage="Please Enter a valid Email Address"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCredit" runat="server" Text="Credit Card Number"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="CreditCardTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="CreditCardTextBox"
                                ErrorMessage="Credit Card is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="CreditCardTextBox"
                                ErrorMessage="Please Enter a valid Credit Card Number" ValidationExpression="^[\s\S]{0,22}$">*</asp:RegularExpressionValidator>
                            <br />
                            <sup style="color: Red;">4007000000027</sup>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblExpirationMonth" runat="server" Text="Expiration Month"></asp:Label>
                        </td>
                        <td colspan="1">
                            <asp:DropDownList ID="MonthDropDownList" runat="server">
                                <asp:ListItem Text="01 - January" Value="01"></asp:ListItem>
                                <asp:ListItem Text="02 - February" Value="02"></asp:ListItem>
                                <asp:ListItem Text="03 - March" Value="03"></asp:ListItem>
                                <asp:ListItem Text="04 - April" Value="04"></asp:ListItem>
                                <asp:ListItem Text="05 - May" Value="05"></asp:ListItem>
                                <asp:ListItem Text="06 - June" Value="06"></asp:ListItem>
                                <asp:ListItem Text="07 - July" Value="07"></asp:ListItem>
                                <asp:ListItem Text="08 - August" Value="08"></asp:ListItem>
                                <asp:ListItem Text="09 - September" Value="09"></asp:ListItem>
                                <asp:ListItem Text="10 - October" Value="10"></asp:ListItem>
                                <asp:ListItem Text="11 - November" Value="11"></asp:ListItem>
                                <asp:ListItem Text="12 - December" Value="12"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblExpirationYear" runat="server" Text="Expiration Year"></asp:Label>
                        </td>
                        <td colspan="1">
                            <asp:DropDownList ID="YearDropDownList" runat="server">
                                <asp:ListItem Value="08">2008</asp:ListItem>
                                <asp:ListItem Value="09">2009</asp:ListItem>
                                <asp:ListItem Value="10">2010</asp:ListItem>
                                <asp:ListItem Value="11">2011</asp:ListItem>
                                <asp:ListItem Value="12">2012</asp:ListItem>
                                <asp:ListItem Value="13">2013</asp:ListItem>
                                <asp:ListItem Value="14">2014</asp:ListItem>
                                <asp:ListItem Value="15">2015</asp:ListItem>
                                <asp:ListItem Value="16">2016</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCCV" runat="server" Text="CCV"></asp:Label>
                        </td>
                        <td colspan="1">
                            <asp:TextBox ID="CCVTextBox" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="CCVTextBox"
                                ErrorMessage="Please Enter a valid CCV Number" ValidationExpression="^[\s\S]{0,4}$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblAmount" runat="server"  Text="Amount $"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="AmountTextBox" runat="server" 
                                ReadOnly="True" Text="1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="AmountTextBox"
                                ErrorMessage="Amount is a Required Field" Text="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="AmountTextBox"
                                ErrorMessage="Invalid Amount, only numbers and '.' allowed" Operator="DataTypeCheck"
                                Type="Currency">*</asp:CompareValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <br />
                            <asp:Button ID="SubmitButton" runat="server" 
                                Text="Submit Payment" Visible="true" />
                        </td>
                    </tr>
                </table>

</asp:Content>

