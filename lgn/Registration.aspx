<%@ Page Language="C#" MasterPageFile="~/lgn/Login.master" AutoEventWireup="true"
    CodeFile="Registration.aspx.cs" Inherits="Registration" Title="Untitled Page"
    MaintainScrollPositionOnPostback="true" %>    
    

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
    function JavaFunc(source, args)
    {
      var check = document.getElementById('<%= ((CheckBox)CreateUserWizardStep3.ContentTemplateContainer.FindControl("chkAgree")).ClientID %>');
        if (!check.checked)
        {

            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }  
</script>
    <%--<table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                     
                         
                         <tr>
                                <td style="color:white; align="center" colspan="2">
                                    Enter Your Credit Card Details<br /><br /></td>
                         </tr>   
                         <tr>
                            <asp:Label ID="lblCreditCard" runat="server" />
                         </tr>
                         
                         
                  <tr>
                  
                  <td align="right">
                           <asp:Label ID="Label6" runat="server" AssociatedControlID="FirstNameTextBox">First 
                           Name &nbsp;</asp:Label>
                  </td>
                  
                  <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="FirstNameTextBox"
                            runat="server" ErrorMessage="First Name is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FirstNameTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                  </td>
                                    
                  </tr>
                  
                  <tr>
                  
                  <td align="right">
                           <asp:Label ID="Label7" runat="server" AssociatedControlID="LastNameTextBox">City 
                           &nbsp;</asp:Label>
                  </td>
                  
                    <td>
                        
                        <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="LastNameTextBox"
                            runat="server" ErrorMessage="Last Name is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="LastNameTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                    <td rowspan="2">
                        <!-- (c) 2006. Authorize.Net is a registered trademark of Lightbridge, Inc. -->

                        <script type="text/javascript" language="javascript">
                            var ANS_customer_id = "1ae28d18-9cbf-488c-a5a3-3fdce9333f50";</script>

                        <script type="text/javascript" language="javascript" src="//VERIFY.AUTHORIZE.NET/anetseal/seal.js"></script>

                        <!--   End Seal  -->
                    </td>
                </tr>
                
                <tr>
                
                    <td align="right">
                               <asp:Label ID="Label8" runat="server" AssociatedControlID="AddressTextBox">State 
                               &nbsp;</asp:Label>
                    </td>
                
                    <td colspan="2">
                        
                        <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="AddressTextBox"
                            runat="server" ErrorMessage="Address is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AddressTextBox"
                            ErrorMessage="Please limit the length of the content entered to 60 characters"
                            ValidationExpression="^[\s\S]{0,60}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
               
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label9" runat="server" AssociatedControlID="CityTextBox">Postal 
                           Code &nbsp;</asp:Label>
                </td>
                
                    <td>
                        
                        <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="CityTextBox"
                            runat="server" ErrorMessage="City is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="CityTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                            ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                    </tr>
                   
                    <tr>
                    
                        <td align="right">
                                   <asp:Label ID="Label10" runat="server" AssociatedControlID="StateTextBox">Country 
                                   &nbsp;</asp:Label>
                        </td>
                        
                    <td>        
                        <asp:TextBox ID="StateTextBox" runat="server" MaxLength="30" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="StateTextBox"
                            runat="server" ErrorMessage="State is Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="StateTextBox"
                            ErrorMessage="Please limit the length of the content entered to 40 characters"
                             ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label11" runat="server" AssociatedControlID="ZipTextBox">Phone &nbsp;</asp:Label>
                </td>
                
                    <td>
                        
                        <asp:TextBox ID="ZipTextBox" runat="server" CssClass="mediumTextBox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ZipTextBox"
                            runat="server" ErrorMessage="Zip Code Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ZipTextBox"
                            ErrorMessage="Please limit the length of the content entered to 15 characters"
                             ValidationExpression="^[\s\S]{0,15}$">*</asp:RegularExpressionValidator>
                    </td>
                 </tr>
                 
                 <tr>   
                 
                     <td align="right">
                               <asp:Label ID="Label12" runat="server" AssociatedControlID="CountryTextBox">Email 
                               &nbsp;</asp:Label>
                     </td>
                 
                    <td>
                        
                        <asp:TextBox ID="CountryTextBox" runat="server" CssClass="mediumTextBox" Text="USA"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="CountryTextBox"
                            runat="server" ErrorMessage="Country Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                            ControlToValidate="CountryTextBox" ErrorMessage="Please limit the length of the content entered to 40 characters"
                             ValidationExpression="^[\s\S]{0,40}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                
                    <td align="right">
                         <asp:Label ID="Label13" runat="server" AssociatedControlID="PhoneTextBox">Credit 
                         Card Number &nbsp;</asp:Label>
                    </td>
                     
                    <td colspan="2">
                        
                        <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="PhoneTextBox"
                            runat="server" ErrorMessage="Phone is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                         
                         
                         
                         
                            
                 <tr>
                     <td align="right">
                           <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="EmailTextBox">Expiration 
                           Month &nbsp;</asp:Label>
                     </td>
                 
                    <td>
                        
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="EmailTextBox"
                            runat="server" ErrorMessage="Email is a Required Field" Text="*" ></asp:RequiredFieldValidator>
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
                           <asp:Label ID="Label1" runat="server" AssociatedControlID="CreditCardTextBox">Expiration 
                           Year &nbsp;</asp:Label>
                     </td>
                    
                    <td colspan="2">
                        
                        <asp:TextBox ID="CreditCardTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="CreditCardTextBox"
                            runat="server" ErrorMessage="Credit Card is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="CreditCardTextBox"
                            ErrorMessage="Please Enter a valid Credit Card Number" 
                            ValidationExpression="^[\s\S]{0,22}$">*</asp:RegularExpressionValidator>
                        <br />
                        <sup style="color: Red;">4007000000027</sup>
                    </td>
                </tr>
                <tr>
                
                    <td align="right">
                           <asp:Label ID="Label2" runat="server" AssociatedControlID="MonthDropDownList">CCV 
                           &nbsp;</asp:Label>
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
                           <asp:Label ID="Label3" runat="server" AssociatedControlID="YearDropDownList">Amount 
                           $ &nbsp;</asp:Label>
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
                           <asp:Label ID="Label4" runat="server" AssociatedControlID="CCVTextBox"></asp:Label>
                     </td>
                  
                    <td colspan="1">
                        
                        <asp:TextBox ID="CCVTextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="CCVTextBox"
                            ErrorMessage="Please Enter a valid CCV Number"  ValidationExpression="^[\s\S]{0,4}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                
                <td align="right">
                           <asp:Label ID="Label5" runat="server" AssociatedControlID="AmountTextBox"></asp:Label>
                     </td>
                
                    <td colspan="2">
                        
                        <asp:TextBox ID="AmountTextBox" runat="server" Text="" ReadOnly="True">1</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="AmountTextBox"
                            runat="server" ErrorMessage="Amount is a Required Field" Text="*" ></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" Type="Currency" Operator="DataTypeCheck"
                             ErrorMessage="Invalid Amount, only numbers and '.' allowed"
                            ControlToValidate="AmountTextBox">*</asp:CompareValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblError" Text=""  runat="server" Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td align=center colspan="3">
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" 
                            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator><br />
                             <asp:Button ID="SubmitButton" runat="server" Text="Submit Payment" CausesValidation="true"
                             OnClick="SubmitButton_Click" />
                        
                    </td>
                </tr>                         
       </table>--%>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Width="491px" OnCreatedUser="CreateUserWizard1_CreatedUser"
        ContinueDestinationPageUrl="~/lgn/Login.aspx" OnNextButtonClick="CreateUserWizard1_NextButtonClick"
        OnActiveStepChanged="CreateUserWizard1_ActiveStepChanged" 
        oncreatinguser="CreateUserWizard1_CreatingUser" 
        CompleteSuccessText="Your account has been successfully created. " 
        onpreviousbuttonclick="CreateUserWizard1_PreviousButtonClick" 
        oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick">
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                Text="Previous" />
            <asp:Button ID="StepNextButton" runat="server" CausesValidation="true" CommandName="MoveNext"
                Text="Next" />
        </StepNavigationTemplate>
        <WizardSteps>
            <asp:WizardStep ID="CreateUserWizardStep0" runat="server" Title="Step 0: Organization Information">
                <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                    <tr>
                        <td style="color: white; font-weight: bold" align="center" colspan="2">
                            Information about Organization
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            Organization Name &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_OrgName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ToolTip="Organization Name is required."
                                ErrorMessage="Organization is required." ControlToValidate="txt_OrgName">
                                        *</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            Number of Leagues &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_league" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ToolTip="Enter Number of Leagues."
                                ErrorMessage="Number of Leagues is required." ControlToValidate="txt_league">
                                        *</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            Number of Players &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txt_players" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ToolTip="Enter Number of Players."
                                ErrorMessage="Number of Players is required." ControlToValidate="txt_players">
                                        *</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="CreateUserWizardStep1" runat="server" Title="Step 1: Select Start and End Date">
                <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label runat="server" Text="Enter League Information" Font-Bold="True" ForeColor="White"
                                ID="lblLeaguelbl"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblInstructions" runat="server" Text="Instructions:" ForeColor="Orange"></asp:Label>
                            <br />
                            <asp:Label ID="lblInstructions1" runat="server" Text="From this page you have to Select the Start and End Date of each League. From the 
                            Drop Down List Select the League and then Select the Start and End Dates from the Calenders below. After Selecting the Dates Press Add Button. You will have to repeat 
                            this process for all of your Leagues. "></asp:Label>
                            <br />
                            <asp:Label ID="lblInstructions2" runat="server" Text="Note: You can Add the Start and End Date for Each League Only Once."
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            Select League
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlTotalLeagues">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            Start Date
                        </td>
                        <td>
                            <asp:Calendar runat="server" CellPadding="4" DayNameFormat="Shortest" BackColor="White"
                                BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                                Height="180px" Width="200px" ID="calStartDate">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt"></DayHeaderStyle>
                                <NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
                                <OtherMonthDayStyle ForeColor="Gray"></OtherMonthDayStyle>
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White"></SelectedDayStyle>
                                <SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True"></TitleStyle>
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black"></TodayDayStyle>
                                <WeekendDayStyle BackColor="#FFFFCC"></WeekendDayStyle>
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="175">
                            End Date
                        </td>
                        <td>
                            <asp:Calendar runat="server" CellPadding="4" DayNameFormat="Shortest" BackColor="White"
                                BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                                Height="180px" Width="200px" ID="calEndDate">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt"></DayHeaderStyle>
                                <NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
                                <OtherMonthDayStyle ForeColor="Gray"></OtherMonthDayStyle>
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White"></SelectedDayStyle>
                                <SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True"></TitleStyle>
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black"></TodayDayStyle>
                                <WeekendDayStyle BackColor="#FFFFCC"></WeekendDayStyle>
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label runat="server" ForeColor="Red" ID="lblErrorMessage" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="left">
                            <asp:Button runat="server" Text="Add" ID="btnAdd" OnClick="btnAdd_Click"></asp:Button>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="CreateUserWizardStep2" runat="server" Title="Step 2: Credit Card Details" >
                
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
                            <asp:TextBox ID="AmountTextBox" runat="server" OnTextChanged="AmountTextBox_TextChanged"
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
                            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" 
                                Text="Submit Payment" Visible="False" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep3" runat="server" Title="Step 3: Basic User Information" >
                <ContentTemplate>
                    <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                        <tr>
                            <td style="font-size: 14; color: white; font-weight: bold;" align="center" colspan="2">
                                Create Your Account
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblInstructions4" runat="server" Text="Instructions:" Font-Bold="true"
                                    ForeColor="Orange"></asp:Label>
                                <asp:Label ID="lblInstructions5" runat="server" Text="The Following Information will be used to Login and Manage Your Organization. "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">UserName 
                                &nbsp;</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ToolTip="User Name is required."
                                    ErrorMessage="User Name is required." ValidationGroup="CreateUserWizard1" ControlToValidate="UserName">
                                        *</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password 
                                &nbsp;</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ToolTip="Password is required."
                                    ErrorMessage="Password is required." ValidationGroup="CreateUserWizard1" ControlToValidate="Password">
                                        *</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Re-Type 
                                Password &nbsp;</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ToolTip="Confirm Password is required."
                                    ErrorMessage="Confirm Password is required." ValidationGroup="CreateUserWizard1"
                                    ControlToValidate="ConfirmPassword">
                                        *</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email &nbsp;</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ToolTip="Email is required."
                                    ErrorMessage="Email is required." ValidationGroup="CreateUserWizard1" ControlToValidate="Email">
                                        *</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                        <tr>
                            <td style="font-size: 14; color: white;" align="center" colspan="2">
                                If You Forget Your Password
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="175">
                                Security Question &nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="Question" runat="server" Width="170">
                                    <asp:ListItem Text="[Select a Question]" />
                                    <asp:ListItem Text="Favorite Pet" />
                                    <asp:ListItem Text="Mother's Maiden Name" />
                                    <asp:ListItem Text="Who was your childhood hero?" />
                                    <asp:ListItem Text="Your favorite pasttime?" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" InitialValue="[Select a Question]"
                                    ControlToValidate="Question" ErrorMessage="Select a Security Question" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Your Answer &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                    ErrorMessage="RequiredFieldValidator" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:CheckBox ID="chkAgree"  Text="I Agree with the" runat="server" ValidationGroup="CreateUserWizard1" />
                                &nbsp;<asp:HyperLink ID="hylAgree" Text="Terms and Conditions" NavigateUrl="~/Documents/terms_of_use_1.pdf" Target="_blank" runat="server" />
                                <asp:CustomValidator ID="rfvAgree" ClientValidationFunction="JavaFunc" runat="server"
                                    ErrorMessage="*" ValidationGroup="CreateUserWizard1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ErrorMessage="The Password and Confirmation Password must match."
                                    ValidationGroup="CreateUserWizard1" ControlToValidate="ConfirmPassword" ControlToCompare="Password"
                                    Display="Dynamic">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red" align="center" colspan="2">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="InsertExtraInfo" runat="server" ConnectionString="<%$ ConnectionStrings:WEBConnectionString %>"
                        InsertCommand="INSERT INTO [OrgInfo] ([UserId], [orgName], [noOfLeagues], [noOfPlayers], [creditCardNumber], [expiryMonth], [expiryYear], [CCV], [Amount]) VALUES (@UserId ,@orgName ,@noOfLeagues, @noOfPlayers, @creditCardNumber, @expiryMonth, @expiryYear, @CCV, @Amount)"
                        ProviderName="<%$ ConnectionStrings:WEBConnectionString.ProviderName %>">
                        <InsertParameters>
                            <asp:ControlParameter Name="orgName" Type="String" ControlID="txt_OrgName" PropertyName="Text" />
                            <asp:ControlParameter Name="noOfLeagues" Type="Int32" ControlID="txt_league" PropertyName="Text" />
                            <asp:ControlParameter Name="noOfPlayers" Type="Int32" ControlID="txt_players" PropertyName="Text" />
                            <asp:ControlParameter Name="creditCardNumber" Type="String" ControlID="CreditCardTextBox"
                                PropertyName="Text" />
                            <asp:ControlParameter Name="expiryMonth" Type="String" ControlID="MonthDropDownList"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter Name="expiryYear" Type="String" ControlID="YearDropDownList"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter Name="CCV" Type="Int32" ControlID="CCVTextBox" PropertyName="Text" />
                            <asp:ControlParameter Name="Amount" Type="Int32" ControlID="AmountTextBox" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    &nbsp;       
</asp:Content>
