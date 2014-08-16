<%@ Page Language="C#" MasterPageFile="~/Simple/admin/access/Admin.master" %>

<script runat="server">
	MembershipUser user;
	
	private void Page_Load()
	{
		if (IsPostBack)
		{
			try
			{
				AddUser();

				//Response.Redirect("users.aspx");
			}
			catch (Exception ex)
			{
				ConfirmationMessage.InnerText = "Insert Failure: " + ex.Message;
			}
		}
	}

	protected void AddUser()
	{
		// Add User.
        MembershipCreateStatus statuss;
		MembershipUser newUser = Membership.CreateUser(username.Text, password.Text, email.Text,Question.SelectedValue,Answer.Text,true,out statuss);
		
        switch (statuss)
        {
            case MembershipCreateStatus.DuplicateUserName:
                ConfirmationMessage.InnerText = "User already exists in system. please select diffrent name and try again";
                break;
            case MembershipCreateStatus.DuplicateEmail:
                ConfirmationMessage.InnerText = "Duplicate Email";
                break;
            case MembershipCreateStatus.InvalidPassword:
                ConfirmationMessage.InnerText = "Password is Invalid";
                break;
            case MembershipCreateStatus.Success:
                {
                    newUser.Comment = comment.Text;
                    ConfirmationMessage.InnerText = "User has been created successfuly";                   
                    Membership.UpdateUser(newUser);

                    // Add Roles.
                    foreach (ListItem rolebox in UserRoles.Items)
                    {
                        if (rolebox.Selected)
                        {
                            Roles.AddUserToRole(username.Text, rolebox.Text);
                        }
                    }
                    break;
                }
            default:
                ConfirmationMessage.InnerText = "Error is : " + statuss.ToString();
                break;
        }     
        
        
		
	}

	private void Page_PreRender()
	{
		UserRoles.DataSource = Roles.GetAllRoles();
		UserRoles.DataBind();
	}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- #include file="_nav.aspx -->

<table class="webparts">
<tr>
	<th>Add User</th>
</tr>
<tr>
<td class="details" valign="top">

<h3>Roles:</h3>
<asp:CheckBoxList ID="UserRoles" runat="server" />

<h3>Main Info:</h3>

<table>
<tr>
	<td class="detailheader">Active User</td>
	<td>
		<asp:CheckBox ID="isapproved" runat="server" Checked="true" />
	</td>
</tr>
<tr>
	<td class="detailheader">User Name</td>
	<td>
		<asp:TextBox ID="username" runat="server"></asp:TextBox>
	</td>
</tr>
<tr>
	<td class="detailheader">Password</td>
	<td>
		<asp:TextBox ID="password" runat="server"></asp:TextBox>
	</td>
</tr>
<tr>
	<td class="detailheader">Email</td>
	<td>
		<asp:TextBox ID="email" runat="server"></asp:TextBox>
	</td>
</tr>
    <tr>
        <td align="left" width="175">
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
                ControlToValidate="Question" ErrorMessage="Select a Security Question">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            Your Answer &nbsp;
        </td>
        <td>
            <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
	<td class="detailheader">Comment</td>
	<td>
		<asp:TextBox ID="comment" runat="server"></asp:TextBox>
	</td>
</tr>
<tr>
	<td colspan="2"><br />
		<input type="submit" value="Add User" />&nbsp;
		<input type="reset" />
	</td>
</tr>
<tr>
	<td colspan="2">
	<div id="ConfirmationMessage" runat="server" class="alert"></div>
	</td>
</tr>
</table>

<asp:ObjectDataSource ID="MemberData" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" UpdateMethod="UpdateUser" TypeName="System.Web.Security.Membership">
	<SelectParameters>
		<asp:QueryStringParameter Name="username" QueryStringField="username" />
	</SelectParameters>
</asp:ObjectDataSource> 
</td>

</tr></table>

</asp:Content>