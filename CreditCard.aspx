<%@ Page Language="C#" MasterPageFile="~/lgn/Login.master" AutoEventWireup="true" CodeFile="CreditCard.aspx.cs" Inherits="CreditCard" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
          <%-- <tr>
                                <td style="font-weight: bold; color: white; background-color: #6b696b" align="center" colspan="2">
                                    Credit Card Number
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CardNumberLabel" runat="server" AssociatedControlID="txt_CredirCardNumber">Credit Card Number &nbsp;</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txt_CreditCardNumber" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CreditCardNumberRequired" runat="server" ToolTip="Credir Card Number is required."
                                        ErrorMessage="Credit Card Number is required." ValidationGroup="CreateUserWizard1" ControlToValidate="txt_CredirCardNumber">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ExpirationLabel" runat="server" AssociatedControlID="txt_CardExpirationDate">Card Expiration Date &nbsp;</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txt_CardExpirationDate" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CardExpirationDateRequired" runat="server" ToolTip="Card Expiration Date is required."
                                        ErrorMessage="Card Expiration Date is required." ValidationGroup="CreateUserWizard1" ControlToValidate="txt_CardExpirationDate">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CCVLabel" runat="server" AssociatedControlID="txt_CCV">CCV &nbsp;</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CCV" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CCVRequired" runat="server" ToolTip="CCV is required."
                                        ErrorMessage="CCV is required." ValidationGroup="CreateUserWizard1"
                                        ControlToValidate="txt_CCV">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="AmountLabel" runat="server" AssociatedControlID="txt_Amount">Amount &nbsp;</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Amount" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ToolTip="Amount is required."
                                        ErrorMessage="Amount is required." ValidationGroup="CreateUserWizard1"
                                        ControlToValidate="txt_Amount">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>   
                            
                            
                            --%>                 
    
    <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                     
                         
                         <tr>
                                <td style="font-weight: bold; color: white; align="center" colspan="2">
                                    Enter Your Credit Card Details</td>
                         </tr>   
                         
                         
                  <tr>
                  
                  <td align="right">
                           <asp:Label ID="Label6" runat="server" AssociatedControlID="FirstNameTextBox">First 
                           Name &nbsp;</asp:Label>
                  </td>
                  
                  <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
                            runat="server" ErrorMessage="First Name is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FirstNameTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                  </td>
                                    
                  </tr>
                  
                  <tr>
                  
                  <td align="right">
                           <asp:Label ID="Label7" runat="server" AssociatedControlID="LastNameTextBox">Last 
                           Name &nbsp;</asp:Label>
                  </td>
                  
                    <td>
                        
                        <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox"
                            runat="server" ErrorMessage="Last Name is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="LastNameTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td colspan="2" rowspan="2">
                        <!-- (c) 2006. Authorize.Net is a registered trademark of Lightbridge, Inc. -->

                        <script type="text/javascript" language="javascript">
                            var ANS_customer_id = "1ae28d18-9cbf-488c-a5a3-3fdce9333f50";</script>

                        <script type="text/javascript" language="javascript" src="//VERIFY.AUTHORIZE.NET/anetseal/seal.js"></script>

                        <!--   End Seal  -->
                    </td>
                </tr>
                
                <tr>
                
                    <td align="right">
                               <asp:Label ID="Label8" runat="server" AssociatedControlID="AddressTextBox">Address 
                               &nbsp;</asp:Label>
                    </td>
                
                    <td colspan="2">
                        
                        <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AddressTextBox"
                            runat="server" ErrorMessage="Address is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AddressTextBox"
                            ErrorMessage="Please limit the length of the content entered to 60 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,60}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
               
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label9" runat="server" AssociatedControlID="CityTextBox">City &nbsp;</asp:Label>
                </td>
                
                    <td>
                        
                        <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="CityTextBox"
                            runat="server" ErrorMessage="City is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="CityTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                    </tr>
                   
                    <tr>
                    
                        <td align="right">
                                   <asp:Label ID="Label10" runat="server" AssociatedControlID="StateTextBox">State 
                                   &nbsp;</asp:Label>
                        </td>
                        
                    <td>        
                        <asp:TextBox ID="StateTextBox" runat="server" MaxLength="30" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="StateTextBox"
                            runat="server" ErrorMessage="State is Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="StateTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label11" runat="server" AssociatedControlID="ZipTextBox">Postal 
                           Code &nbsp;</asp:Label>
                </td>
                
                    <td>
                        
                        <asp:TextBox ID="ZipTextBox" runat="server" CssClass="mediumTextBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ZipTextBox"
                            runat="server" ErrorMessage="Zip Code Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ZipTextBox"
                            ErrorMessage="Please limit the length of the content entered to 15 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,15}$">*</asp:RegularExpressionValidator>
                    </td>
                 </tr>
                 
                 <tr>   
                 
                     <td align="right">
                               <asp:Label ID="Label12" runat="server" AssociatedControlID="CountryTextBox">Country 
                               &nbsp;</asp:Label>
                     </td>
                 
                    <td>
                        
                        <asp:TextBox ID="CountryTextBox" runat="server" CssClass="mediumTextBox" Text="USA"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="CountryTextBox"
                            runat="server" ErrorMessage="Country Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                            ControlToValidate="CountryTextBox" ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                
                    <td align="right">
                         <asp:Label ID="Label13" runat="server" AssociatedControlID="PhoneTextBox">Phone 
                         &nbsp;</asp:Label>
                    </td>
                     
                    <td colspan="4">
                        
                        <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="PhoneTextBox"
                            runat="server" ErrorMessage="Phone is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                         
                         
                         
                         
                            
                 <tr>
                     <td align="right">
                           <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="EmailTextBox">Email 
                           &nbsp;</asp:Label>
                     </td>
                 
                    <td>
                        
                        <asp:TextBox ID="EmailTextBox" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="EmailTextBox"
                            runat="server" ErrorMessage="Email is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="EmailTextBox"
                            ErrorMessage="Please limit the length of the content entered to 255 characters"
                            ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,255}$">*</asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator49" runat="server"
                            ControlToValidate="EmailTextBox" ErrorMessage="Please Enter a valid Email Address"
                            ValidationGroup="Authorize" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                
                    <td align="right">
                           <asp:Label ID="Label1" runat="server" AssociatedControlID="CreditCardTextBox">Credit 
                           Card Number &nbsp;</asp:Label>
                     </td>
                    
                    <td colspan="4">
                        
                        <asp:TextBox ID="CreditCardTextBox" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="CreditCardTextBox"
                            runat="server" ErrorMessage="Credit Card is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="CreditCardTextBox"
                            ErrorMessage="Please Enter a valid Credit Card Number" ValidationGroup="Authorize"
                            ValidationExpression="^[\s\S]{0,22}$">*</asp:RegularExpressionValidator>
                        <br />
                        <sup style="color: Red;">1111222233334444</sup>
                    </td>
                </tr>
                <tr>
                
                    <td align="right">
                           <asp:Label ID="Label2" runat="server" AssociatedControlID="MonthDropDownList">Expiration 
                           Month &nbsp;</asp:Label>
                     </td>
                    
                    <td colspan="1">
                       
                        <asp:DropDownList ID="MonthDropDownList" runat="server">
                            <asp:ListItem Value="01" Text="01 - January"></asp:ListItem>
                            <asp:ListItem Value="02" Text="02 - February"></asp:ListItem>
                            <asp:ListItem Value="03" Text="03 - March"></asp:ListItem>
                            <asp:ListItem Value="04" Text="04 - April"></asp:ListItem>
                            <asp:ListItem Value="05" Text="05 - May"></asp:ListItem>
                            <asp:ListItem Value="06" Text="06 - June"></asp:ListItem>
                            <asp:ListItem Value="07" Text="07 - July"></asp:ListItem>
                            <asp:ListItem Value="08" Text="08 - August"></asp:ListItem>
                            <asp:ListItem Value="09" Text="09 - September"></asp:ListItem>
                            <asp:ListItem Value="10" Text="10 - October"></asp:ListItem>
                            <asp:ListItem Value="11" Text="11 - November"></asp:ListItem>
                            <asp:ListItem Value="12" Text="12 - December"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    </tr>
                <tr>    
                
                    <td align="right">
                           <asp:Label ID="Label3" runat="server" AssociatedControlID="YearDropDownList">Expiration 
                           Year &nbsp;</asp:Label>
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
                           <asp:Label ID="Label4" runat="server" AssociatedControlID="CCVTextBox">CCV &nbsp;</asp:Label>
                     </td>
                  
                    <td colspan="1">
                        
                        <asp:TextBox ID="CCVTextBox" runat="server">
                        </asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="CCVTextBox"
                            ErrorMessage="Please Enter a valid CCV Number" ValidationGroup="Authorize" ValidationExpression="^[\s\S]{0,4}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label5" runat="server" AssociatedControlID="AmountTextBox">Amount 
                           &nbsp;</asp:Label>
                     </td>
                
                    <td colspan="3">
                        
                        <asp:TextBox ID="AmountTextBox" runat="server" Text="">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="AmountTextBox"
                            runat="server" ErrorMessage="Amount is a Required Field" Text="*" ValidationGroup="Authorize"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" Type="Currency" Operator="DataTypeCheck"
                            ValidationGroup="Authorize" ErrorMessage="Invalid Amount, only numbers and '.' allowed"
                            ControlToValidate="AmountTextBox">*</asp:CompareValidator><br />
                    </td>
                </tr>
                <tr>
                    <td align=center colspan="3">
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" OnServerValidate="CustomValidator1_ServerValidate"
                            ValidationGroup="Authorize"></asp:CustomValidator><br />
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit Payment" CausesValidation="true"
                            ValidationGroup="Authorize" OnClick="SubmitButton_Click" />
                    </td>
                </tr>                         
       </table>
                        
    
    
    
</asp:Content>

