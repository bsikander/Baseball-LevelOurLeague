<%@ Page Language="C#" MasterPageFile="~/Simple/admin/access/Admin.master" %>
<%@ Register TagPrefix="dc" TagName="alphalinks" Src="~/_controls/alphalinks.ascx" %>

<script runat="server">
	private void Page_PreRender()
	{
		if (Alphalinks.Letter == "All")
		{
			Users.DataSource = Membership.GetAllUsers();
		}
		else
		{
			Users.DataSource = Membership.FindUsersByName(Alphalinks.Letter + "%");
		}
		Users.DataBind();
	}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- #include file="_nav.aspx -->

<table class="webparts">
<tr>
	<th>Users by Name</th>
</tr>
<tr>
<td class="details" valign="top">

<!-- #include file="_nav3.aspx -->


    User Name filter:&nbsp;&nbsp;&nbsp;
<dc:alphalinks runat="server" ID="Alphalinks" />

<br /><br />

<asp:GridView runat="server" ID="Users" AutoGenerateColumns="False"
	CssClass="list" AlternatingRowStyle-CssClass="odd" GridLines="None"
	>
<Columns>
	<asp:TemplateField>
		<HeaderTemplate>User Name</HeaderTemplate>
		<ItemTemplate>
		<a href="edit_user.aspx?username=<%# Eval("UserName") %>"><%# Eval("UserName") %></a>
		</ItemTemplate>
	</asp:TemplateField>
	<asp:BoundField DataField="email" HeaderText="Email" />
	<asp:BoundField DataField="isapproved" HeaderText="Is Active" />
	<asp:BoundField DataField="isonline" HeaderText="Is Online" />
	<asp:BoundField DataField="islockedout" HeaderText="Is Locked Out" />
</Columns>

<AlternatingRowStyle CssClass="odd"></AlternatingRowStyle>
</asp:GridView>

</td>

</tr></table>


</asp:Content>


