<%@ Page Language="C#" MasterPageFile="~/Simple/Admin.master" AutoEventWireup="true" CodeFile="Organizations.aspx.cs" Inherits="Simple_Organizations" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
<tr>
    <td>
        <asp:Label ID="lblHeading" Text="Organizations" runat="server" Font-Bold="true" ForeColor="White" Font-Size="Medium" Font-Underline="true"/>
    </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
<tr>
    <td>
    
    <asp:GridView ID="gvOrg" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" EnableSortingAndPagingCallbacks="True" 
            DataKeyNames="orgId" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black"
                    GridLines="Vertical" >
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="orgName" 
                HeaderText="Orgaization Name" SortExpression="orgName" />
            <asp:BoundField DataField="organizationPlayerNumber" 
                HeaderText="Total Players" 
                SortExpression="organizationPlayerNumber" />
            <asp:BoundField DataField="totalLeagues" HeaderText="Total Leagues" 
                SortExpression="totalLeagues" />
            <asp:HyperLinkField DataNavigateUrlFields="orgId" 
                DataNavigateUrlFormatString="AddModiOrg.aspx?orgId={0}" Text="Details" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        
        <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#66FF99" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#99FF99" />
    
    </asp:GridView>
    <%--<asp:SqlDataSource ID="SqlDSforGridview" runat="server"
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT EmployeeID, FirstName, LastName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Notes FROM Employees"
        UpdateCommand="UPDATE Employees SET LastName = @LastName, FirstName = @FirstName, Title = @Title, Address = @Address, City = @City, Region = @Region, PostalCode = @PostalCode, Country = @Country, HomePhone = @HomePhone, Extension = @Extension, Notes = @Notes where EmployeeID=@EmployeeID"
        DeleteCommand="DELETE FROM Employees WHERE  EmployeeID = @EmployeeID">           
        </asp:SqlDataSource>--%>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sports1ConnectionString %>" 
            SelectCommand="SELECT [orgId], [orgName], [organizationPlayerNumber], [totalLeagues] FROM [Organization]"
            UpdateCommand="UPDATE Organization SET orgName = @orgName, organizationPlayerNumber = @organizationPlayerNumber, totalLeagues= @totalLeagues where orgId=@orgId"
            DeleteCommand="DELETE FROM Organization WHERE  orgid = @orgId"
            >
            <DeleteParameters>
                <asp:Parameter Name="orgId" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="orgName" />
                <asp:Parameter Name="organizationPlayerNumber" />
                <asp:Parameter Name="totalLeagues" />
                <asp:Parameter Name="orgId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </td>
</tr>
    
</table>
</asp:Content>

