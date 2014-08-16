using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SharpAuthorize;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.IO;


public partial class Registration : System.Web.UI.Page
{
    public String error;
    bool createUser = false;

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //CustomValidator1.Visible = false;
        //CreateUserWizardStep ws = (CreateUserWizardStep)CreateUserWizard1.FindControl("CreateUserWizardStep3");
        //CheckBox chk= (CheckBox)ws.ContentTemplateContainer.FindControl("chkAgree");

        
        
    }

    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        //bool v = CustomValidator1.Visible;
        //CustomValidator1.Visible = true;
        Errorlbl.Text = (string)ViewState["Error"];
        Errorlbl.ForeColor = System.Drawing.Color.Red;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
        lblErrorMessage.Visible = false;
        //CustomValidator1.Visible = true;        
        
        //WizardStepBase a = CreateUserWizard1.ActiveStep;
        //Button btn = new Button();
        //if (a.ID == "CreateUserWizardStep2")
        //{
        //    btn = CreateUserWizard1.FindControl("CreateUserWizardStep3").FindControl("StepNextButton") as Button;
        string val= ((CheckBox)CreateUserWizardStep3.ContentTemplateContainer.FindControl("chkAgree")).ClientID;

        

        //}
        if (!IsPostBack)
        {
            if (Request.Params["Amount"] != null)  //simple to pass in amount as query string
            {
                AmountTextBox.Text = Convert.ToString(Request.Params["Amount"]);
                AmountTextBox.Enabled = false;
                AmountTextBox.ReadOnly = true;
            }
        }
    }

    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        
        bool result = InsertDataInDB();
        if (result == true)
        {
            bool paymentResult = AuthorizePayment();    
            if (paymentResult == true)
            {
                CreateUserWizard1.CompleteSuccessText = "You Account has been successfully created .The Amount USD " + AmountTextBox.Text + " has been transferred. You will recieve the payment information shortly.Thank you.";
            }
            else
            {
                //DO ALTERNATE
                //SHOW ERROR
                //e.Cancel = false;
                
                //CreateUserWizard1.CreateUserStep.AllowReturn = true;
                TextBox UserNameTextBox =
                   (TextBox)CreateUserWizardStep3.ContentTemplateContainer.FindControl("UserName");

                MembershipUser User = Membership.GetUser(UserNameTextBox.Text);

                Membership.DeleteUser(User.UserName, true);

                //CreateUserWizard1.ActiveStepIndex = 2;

                //Delete the Entry in the Leagues and Organization Table
                //Show Error.
                //Session["LastStepError"] = ViewState["Error"].ToString();

                CreateUserWizard1.CompleteSuccessText = "Error Occured! User NOT created. " + ViewState["Error"].ToString();
                CreateUserWizard1.CompleteSuccessTextStyle.ForeColor = System.Drawing.Color.Red;
                //Set this Variable to 1 if there was some error in the registration process.
                ViewState["Check"] = 1;

            }
        }
        else
        { 
            //SHOW ERROR
            CreateUserWizard1.CompleteSuccessText = "Error Occured in the Database. Kindly Signup again." ;
            CreateUserWizard1.ContinueButtonStyle.ForeColor = System.Drawing.Color.Red;
            //Set this Variable to 1 if there was some error in the registration process.
            ViewState["Check"] = 1;
            

        }

        


    }

    private bool InsertDataInDB()
    {
        int check = 0;
        SqlTransaction sqltran;
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        con.Open();
        MembershipUser User;

        TextBox UserNameTextBox =
               (TextBox)CreateUserWizardStep3.ContentTemplateContainer.FindControl("UserName");

        //SqlDataSource DataSource =
        //    (SqlDataSource)CreateUserWizardStep3.ContentTemplateContainer.FindControl("InsertExtraInfo");

        User = Membership.GetUser(UserNameTextBox.Text);

        sqltran = con.BeginTransaction();

        try
        {
            string getOrgId = "SELECT max( orgId ) FROM Organization";
            cmd = new SqlCommand(getOrgId, con, sqltran);
            //cmd.Connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            bool rows = dr.HasRows;
            //int orgId= (int)dr["orgId"];
            bool ab = dr.Read();
            int orgId = (int)dr.GetInt32(0) + 1;
            dr.Close();


            object UserGUID = User.ProviderUserKey;

            //DataSource.InsertParameters.Add("UserId", UserGUID.ToString());
            int test = ddlTotalLeagues.SelectedIndex;

            string query = "INSERT INTO Organization (userId,orgName,organizationPlayerNumber,organizationStatus,totalAmountPaid,dateOfRegistration,organizationOwner,totalLeagues)" +
             "VALUES ('" + UserGUID.ToString() + "','" + txt_OrgName.Text + "'," + Convert.ToInt32(txt_players.Text) + ",1," + Convert.ToDouble(AmountTextBox.Text) + ",'" + DateTime.Now + "','" + UserNameTextBox.Text + "'," + Convert.ToInt32(txt_league.Text) + ")";

            
            //TODO: Removed these lines.
            //cmd = new SqlCommand(query, con);
            //cmd.Transaction = sqltran;

            cmd.CommandText = query;

            //cmd.Connection.Open();

            // Begin the execution of Insert Statement.

            int k = cmd.ExecuteNonQuery();
            if (k > 0)
            {
                check += 1;
            }


            //cmd.Connection.Close();

            

            //cmd.Connection.Close();

            ArrayList gt = (ArrayList)ViewState["arr"];
            DateTime startDateTesting, endDateTesting;
            bool startDateSuccess = false;
            bool endDateSuccess = false;


            for (int i = 0; i < gt.Count; i = i + 3)
            {
                startDateSuccess = DateTime.TryParse(gt[i + 1].ToString(), out startDateTesting);
                endDateSuccess = DateTime.TryParse(gt[i + 2].ToString(), out endDateTesting);
                if (startDateSuccess == true && endDateSuccess == true)
                {
                    string insertQuery = "INSERT INTO Leagues (leagueId,orgId , startDate , endDate , status )" +
                    "VALUES (" + Convert.ToInt32((string)gt[i]) + "," + orgId + ",'" + startDateTesting + "','" + endDateTesting + "','Y')";


                    //string insertQuery = "INSERT INTO Leagues (leagueId,orgId , startDate , endDate , status )" +
                    //"VALUES (" + Convert.ToInt32((string)gt[i]) + "," + orgId + ",'" + (DateTime)gt[i + 1] + "','" + (DateTime)gt[i + 2] + "','Y')";
                    //cmd = new SqlCommand(insertQuery, con, sqltran);
                    //cmd.Connection.Open();
                    cmd.CommandText = insertQuery;
                    k = cmd.ExecuteNonQuery();
                    
                    //cmd.Connection.Close();

                    if (k > 0)
                    {
                        check += 1;
                    }

                }
                else
                {
                    TextWriter tx = new StreamWriter(@"C:\Users\sikander\Documents\Visual Studio 2008\WebSites\LevelOurLeague\Baseball1\ErrorLogger.txt", true);
                    tx.WriteLine("----- Start ----");
                    tx.WriteLine("LeagueId: " + gt[i].ToString());
                    tx.WriteLine("Start Date: " + gt[i + 1].ToString());
                    tx.WriteLine("End Date: " + gt[i + 2].ToString());
                    tx.WriteLine("---- END ----");
                    tx.WriteLine("\n");

                    tx.Close();

                    sqltran.Rollback();


                }
            }

            

            if (check == (1 + (gt.Count/3)))
            {
                sqltran.Commit();
                return true;
            }
            else
            {
                sqltran.Rollback();
                Membership.DeleteUser(User.UserName);
                return false;
            }
            
        }
        catch (Exception e)
        {
            sqltran.Rollback();
            Membership.DeleteUser(User.UserName);
            
            return false;
        }
        con.Close();
    }

    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    //args.IsValid = true;

        
    //    //if (args.Value.Length >= 0)
    //    //{
    //    //    args.IsValid = false;
    //    //}
        
    //}
    private bool AuthorizePayment()
    {
        //ConfigurationSettings.AppSettings["MerchantEmailAddress"];
        //ConfigurationSettings.AppSettings["LoginId"];
        

        //CustomValidator1.ErrorMessage = "";
        string AuthNetVersion = "3.1"; // Contains CCV support
        //string AuthNetLoginID = "88gfA9W6"; //Set your AuthNetLoginID here
        //string AuthNetTransKey = "376GYSHpK938aBnS";  // Get this from your authorize.net merchant interface
        string AuthNetLoginID = ConfigurationSettings.AppSettings["LoginId"];
        string AuthNetTransKey = ConfigurationSettings.AppSettings["TransactionKey"];



        //string AuthNetVersion = "3.1"; // Contains CCV support
        //string AuthNetLoginID = "3y32rPqAvT"; //Set your AuthNetLoginID here
        //string AuthNetTransKey = "9286u9rNyHn4A8Sn";  // Get this from your authorize.net merchant interface

        WebClient webClientRequest = new WebClient();
        System.Collections.Specialized.NameValueCollection InputObject = new System.Collections.Specialized.NameValueCollection(30);
        System.Collections.Specialized.NameValueCollection ReturnObject = new System.Collections.Specialized.NameValueCollection(30);

        byte[] ReturnBytes;
        string[] ReturnValues;
        string ErrorString;

        InputObject.Add("x_version", AuthNetVersion);
        InputObject.Add("x_delim_data", "True");
        InputObject.Add("x_login", AuthNetLoginID);
        InputObject.Add("x_tran_key", AuthNetTransKey);
        InputObject.Add("x_relay_response", "False");

        //----------------------Set to False to go Live--------------------
        InputObject.Add("x_test_request", "True");
        //---------------------------------------------------------------------
        InputObject.Add("x_delim_char", ",");
        InputObject.Add("x_encap_char", "|");

        //Billing Address
        InputObject.Add("x_first_name", FirstNameTextBox.Text);
        InputObject.Add("x_last_name", LastNameTextBox.Text);
        InputObject.Add("x_phone", PhoneTextBox.Text);
        InputObject.Add("x_address", AddressTextBox.Text);
        InputObject.Add("x_city", CityTextBox.Text);
        InputObject.Add("x_state", StateTextBox.Text);
        InputObject.Add("x_zip", ZipTextBox.Text);
        InputObject.Add("x_email", EmailTextBox.Text);
        InputObject.Add("x_email_customer", "TRUE");                     //Emails Customer
        InputObject.Add("x_merchant_email", ConfigurationSettings.AppSettings["MerchantEmailAddress"]);  //Emails Merchant
        InputObject.Add("x_country", CountryTextBox.Text);
        InputObject.Add("x_customer_ip", Request.UserHostAddress);  //Store Customer IP Address

        //Amount
        InputObject.Add("x_description", "Payment to LevelOurLeague.com " + string.Format("{0:c2}", AmountTextBox.Text));  //Description of Purchase

        //Card Details
        InputObject.Add("x_card_num", CreditCardTextBox.Text);
        InputObject.Add("x_exp_date", MonthDropDownList.Text + "/" + YearDropDownList.Text);
        InputObject.Add("x_card_code", CCVTextBox.Text);

        InputObject.Add("x_method", "CC");
        InputObject.Add("x_type", "AUTH_CAPTURE");
        InputObject.Add("x_amount", string.Format("{0:c2}", Convert.ToDouble(AmountTextBox.Text)));

        // Currency setting. Check the guide for other supported currencies
        InputObject.Add("x_currency_code", "USD");

        try
        {
            //Actual Server
            //Set above Testmode=off to go live
            webClientRequest.BaseAddress = "https://test.authorize.net/gateway/transact.dll";

            
            ReturnBytes = webClientRequest.UploadValues(webClientRequest.BaseAddress, "POST", InputObject);
            ReturnValues = System.Text.Encoding.ASCII.GetString(ReturnBytes).Split(",".ToCharArray());

            if (ReturnValues[0].Trim(char.Parse("|")) == "1")
            {
                //AuthNetCodeLabel.Text = ReturnValues[4].Trim(char.Parse("|")); // Returned Authorisation Code
                //AuthNetTransIDLabel.Text = ReturnValues[6].Trim(char.Parse("|")); // Returned Transaction ID
                return true;
            }
            else
            {
                // Error!
                ErrorString = ReturnValues[3].Trim(char.Parse("|")) + " (" + ReturnValues[2].Trim(char.Parse("|")) + ")";

                if (ReturnValues[2].Trim(char.Parse("|")) == "44")
                {
                    // CCV transaction decline
                    ErrorString += "Credit Card Code Verification (CCV) returned the following error: ";

                    switch (ReturnValues[38].Trim(char.Parse("|")))
                    {
                        case "N":
                            ErrorString += "Card Code does not match.";
                            break;
                        case "P":
                            ErrorString += "Card Code was not processed.";
                            break;
                        case "S":
                            ErrorString += "Card Code should be on card but was not indicated.";
                            break;
                        case "U":
                            ErrorString += "Issuer was not certified for Card Code.";
                            break;
                    }
                }

                if (ReturnValues[2].Trim(char.Parse("|")) == "45")
                {
                    if (ErrorString.Length > 1)
                        ErrorString += "<br />n";

                    // AVS transaction decline
                    ErrorString += "Address Verification System (AVS) " +
                      "returned the following error: ";

                    switch (ReturnValues[5].Trim(char.Parse("|")))
                    {
                        case "A":
                            ErrorString += " the zip code entered does not match the billing address.";
                            break;
                        case "B":
                            ErrorString += " no information was provided for the AVS check.";
                            break;
                        case "E":
                            ErrorString += " a general error occurred in the AVS system.";
                            break;
                        case "G":
                            ErrorString += " the credit card was issued by a non-US bank.";
                            break;
                        case "N":
                            ErrorString += " neither the entered street address nor zip code matches the billing address.";
                            break;
                        case "P":
                            ErrorString += " AVS is not applicable for this transaction.";
                            break;
                        case "R":
                            ErrorString += " please retry the transaction; the AVS system was unavailable or timed out.";
                            break;
                        case "S":
                            ErrorString += " the AVS service is not supported by your credit card issuer.";
                            break;
                        case "U":
                            ErrorString += " address information is unavailable for the credit card.";
                            break;
                        case "W":
                            ErrorString += " the 9 digit zip code matches, but the street address does not.";
                            break;
                        case "Z":
                            ErrorString += " the zip code matches, but the address does not.";
                            break;
                    }
                }

                // ErrorString contains the actual error
                
                //CustomValidator1.ErrorMessage = ErrorString;
                //CustomValidator1.Visible = true;

                
                ViewState["Error"] = ErrorString;


                
                return false;
            }
        }
        catch (Exception ex)
        {
            //CustomValidator1.ErrorMessage = ex.Message;

            //Errorlbl.Text = ex.Message;
            //Errorlbl.ForeColor = System.Drawing.Color.Red;
            //Errorlbl.Visible = true;
            ViewState["Error"] = ex.Message;;


            return false;
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        

        //bool creditCardSuccess = AuthorizePayment();
        //if (creditCardSuccess == true)
        //{
        //    lblError.Text = "The Amount USD " + AmountTextBox.Text + " has been transferred. You will recieve the payment information shortly.Thank you.";
        //    lblError.ForeColor = System.Drawing.Color.Green;
        //    lblError.Visible = true;
        //    Session["creditCard"] = "1";
        //}
        //else
        //{
        //    Session["creditCard"] = "0";
        //}
    }    

    protected void CreateUserWizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {   
        double orgFee = 34.99;
        double leagueFee = 24.99;
        double discontedLeagueFee = 19.99;
        


        WizardStepBase a = CreateUserWizard1.ActiveStep;
        if (a.ID == "CreateUserWizardStep0")
        {
            TextBox totalLeagues = (TextBox)CreateUserWizardStep0.FindControl("txt_league");
            int totalLeaguesToFillInDropDown = Convert.ToInt32(totalLeagues.Text);

            DropDownList ddlTotalLeagues = (DropDownList)CreateUserWizardStep1.FindControl("ddlTotalLeagues");
            for (int i = 1; i <= totalLeaguesToFillInDropDown; i++)
            {
                ddlTotalLeagues.Items.Add(i.ToString());
            }
//            Button aa = (Button)CreateUserWizardStep0.FindControl("StepNavigationTemplate").FindControl("StepNextButton");
            

            // Money Logic here
            double amount = 0;
            int noOfLeaguesForAmountCalculation = Convert.ToInt32(txt_league.Text);
            if (noOfLeaguesForAmountCalculation <= 5)
            {
                amount = orgFee + (noOfLeaguesForAmountCalculation * leagueFee);
            }
            else
            {
                amount = orgFee + (noOfLeaguesForAmountCalculation * discontedLeagueFee);
            }

            AmountTextBox.Text = amount.ToString();

        }
        else if (a.ID == "CreateUserWizardStep1")
        {
            //if (Session["arr"]==null)
            if (ViewState["arr"] == null)
            {
                e.Cancel = true;
            }
            else 
            {
                ArrayList arrCount = (ArrayList)ViewState["arr"];
                if (arrCount.Count < (ddlTotalLeagues.Items.Count * 3))
                {
                    lblErrorMessage.Text = "Select Start and End Date for All Leagues";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                    lblErrorMessage.Visible = true;
                    e.Cancel = true;
                }
                else
                {
                    lblErrorMessage.Visible = false;
                }
                
                    
            }

        }
        else if (a.ID == "CreateUserWizardStep2")
        {
            if (e.Cancel == true)
            {
                //string testingg = CustomValidator1.ErrorMessage;
                e.Cancel = false;
                CreateUserWizard1.ActiveStepIndex = 2;

                //CustomValidator1.Visible = true;
                //ServerValidateEventArgs srve = new ServerValidateEventArgs(testingg, true);
                //CustomValidator1_ServerValidate(null, srve);
                //CustomValidator1.ErrorMessage = testingg;
                //lblError.Text = testingg;
            }
            
            //string abc = (string)Session["creditCard"];
            //if (Session["creditCard"] != "1")
            ////if (Session["creditCard"] )
            //{
            //    lblError.Text = "Kindly, Submit the credit card information first.";
            //    lblError.ForeColor = System.Drawing.Color.Red;
            //    lblError.Visible = true;
            //    e.Cancel = true;
            //}
            //else
            //{
            //    lblError.Visible = false;
            //}
   
        }
        else if (a.ID == "CreateUserWizardStep3")
        {

        }

    }
    protected void CreateUserWizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        //WizardStepBase a = CreateUserWizard1.ActiveStep;
        //if (a.ID == "CreateUserWizardStep0")
        //{
            
        //    ddlTotalLeagues.Items.Clear();
        //}
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
        ArrayList arrForStoringDates;
        
        DropDownList ddlTotalLeauges = (DropDownList) CreateUserWizardStep1.FindControl("ddlTotalLeagues");
        string val = ddlTotalLeagues.SelectedValue;

        if (ViewState["arr"] == null)
        {
            arrForStoringDates = new ArrayList();
        }
        else
            arrForStoringDates= (ArrayList)ViewState["arr"];

        bool check=false;
        for (int i = 0; i < arrForStoringDates.Count; i=i+3)
        {
            if ((string)arrForStoringDates[i] == val)
            {
                check = true;
                lblErrorMessage.Text = "You have already selected this League";
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Visible = true;
                break;
            }
            else
            {
                lblErrorMessage.Visible = false;
            }
        }
        
        
        Calendar startDate = (Calendar)CreateUserWizardStep1.FindControl("calStartDate");
        DateTime startSelectedDate= startDate.SelectedDate;

        Calendar endDate = (Calendar)CreateUserWizardStep1.FindControl("calEndDate");
        DateTime endSelectedDate = endDate.SelectedDate;

        if (check == false)
        {

            arrForStoringDates.Add(val);
            arrForStoringDates.Add(startSelectedDate);
            arrForStoringDates.Add(endSelectedDate);

            lblErrorMessage.Visible = true;
            lblErrorMessage.Text = "Start and End Date Added!";
            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
            //Session["arr"] = arrForStoringDates;
            ViewState["arr"] = arrForStoringDates;
        }

    }
    protected void AmountTextBox_TextChanged(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        //bool creditCardSuccess = AuthorizePayment();
        //string testingg = CustomValidator1.ErrorMessage;
        //if (creditCardSuccess == true)
        //{
        //    e.Cancel = false;
        //    lblError.Text = "The Amount USD " + AmountTextBox.Text + " has been transferred. You will recieve the payment information shortly.Thank you.";
        //    lblError.ForeColor = System.Drawing.Color.Green;
        //    lblError.Visible = true;
        //    Session["creditCard"] = "1";
        //    createUser = true;

        //}
        //else
        //{
        //    Session["creditCard"] = "0";
        //    e.Cancel = true;
        //    CreateUserWizard1.ActiveStepIndex = 2;
        //    testingg = CustomValidator1.ErrorMessage;
        //    CustomValidator1.Visible = true;
        //    createUser = false;
        //}
    }

    protected void CreateUserWizard1_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
    {
        WizardStepBase a = CreateUserWizard1.ActiveStep;
        if (a.ID == "CreateUserWizardStep1")
        {
            
                ddlTotalLeagues.Items.Clear();
            
        }
    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ViewState["Check"]) == 1)
        {
            CreateUserWizard1.ContinueDestinationPageUrl = "Registration.aspx";
        }
    }
}
