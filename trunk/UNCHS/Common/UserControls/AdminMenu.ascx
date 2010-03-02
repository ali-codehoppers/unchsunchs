<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.ascx.cs" Inherits="Common_UserControls_AdminMenu" %>
    <asp:TreeView ID="UserMenuTree" runat="server">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/AdminHome.aspx" Text="Home" Value="Home">
            </asp:TreeNode>
            <asp:TreeNode Text="Company" Value="Company" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Admin/AddCompany.aspx" Text="Create Company" Value="Create Company"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/CompanyList.aspx" Text="Company List" Value="Company List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Departments" Value="Departments" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department" Value="Create Department"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentList.aspx" Text="Departments List" Value="Departments List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Users" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Admin/AddUser.aspx" Text="Create User" Value="Create User"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/UsersList.aspx" Text="Users List" Value="Users List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Users" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Admin/DocumentTypeList.aspx" Text="Document Types List" Value="Document Types List"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DocumentList.aspx" Text="Document List" Value="Document List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Maintenance/ScreenList.aspx" Text="Screens List" Value="Screens List"></asp:TreeNode>
        </Nodes>
    </asp:TreeView>
