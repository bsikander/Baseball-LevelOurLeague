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

public partial class CreditCard : System.Web.UI.Page
{
    public String error;
    protected void Page_Load(object sender, EventArgs e)
    {
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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        //SharpAuthorize.Standard.MinimumCreditCard authNet = new SharpAuthorize.Standard.MinimumCreditCard();
        //authNet.Login();
        //authNet.TranKey();
        //authNet.Type(TranType.AUTH_CAPTURE);
        //authNet.CardNum();
        //authNet.ExpDate();
        //authNet.CardCode();
        //authNet.Amount();

        //if (authNet.Authorize())
        //{
        //    // Money in your pocket!
        //    SaveResults(authNet.Response);
        //}
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = true;

        AuthorizePayment();
        if (CustomValidator1.ErrorMessage.Length > 0)
        {
            args.IsValid = false;
        }
        else
        {
            //Processed so send the user to a Thank You Page
            Response.Redirect("UserHomePage.aspx");
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        //dummy postback event authorize validation is done during this postback
    }

    private bool AuthorizePayment()
    {
        CustomValidator1.ErrorMessage = "";
        string AuthNetVersion = "3.1"; // Contains CCV support
        string AuthNetLoginID = "3y32rPqAvT"; //Set your AuthNetLoginID here
        string AuthNetTransKey = "9286u9rNyHn4A8Sn";  // Get this from your authorize.net merchant interface

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
        InputObject.Add("x_merchant_email", "payment@yourwebsite.com");  //Emails Merchant
        InputObject.Add("x_country", CountryTextBox.Text);
        InputObject.Add("x_customer_ip", Request.UserHostAddress);  //Store Customer IP Address

        //Amount
        InputObject.Add("x_description", "Payment to YourSite.com " + string.Format("{0:c2}", AmountTextBox.Text));  //Description of Purchase

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
                CustomValidator1.ErrorMessage = ErrorString;
                return false;
            }
        }
        catch (Exception ex)
        {
            CustomValidator1.ErrorMessage = ex.Message;
            return false;
        }
    }
}
