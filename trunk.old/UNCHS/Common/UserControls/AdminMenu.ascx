<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.ascx.cs" Inherits="Common_UserControls_AdminMenu" %>
    <asp:TreeView ID="UserMenuTree" runat="server" ExpandDepth="FullyExpand">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/AdminHome.aspx" Text="Home" Value="Home">
            </asp:TreeNode>
            <asp:TreeNode Text="Company" Value="Company" >
                <asp:TreeNode NavigateUrl="~/Admin/AddCompany.aspx" Text="Create Company" Value="Create Company"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/CompanyList.aspx" Text="Company List" Value="Company List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Transfer" Value="Transfer" >
                <asp:TreeNode NavigateUrl="~/Admin/TransferHazards.aspx" Text="Transfer Hazards" Value="Transfer Hazards"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferPPE.aspx" Text="Transfer PPE" Value="Transfer PPE"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferTool.aspx" Text="Transfer Plants & Tools" Value="Transfer Plants & Tools"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferPeople.aspx" Text="Transfer People" Value="Transfer People"></asp:TreeNode>
                <%--<asp:TreeNode NavigateUrl="~/Admin/TransferAspects.aspx" Text="Transfer Aspects" Value="Transfer Aspects"></asp:TreeNode>--%>
            </asp:TreeNode>
            
            <asp:TreeNode Text="Departments" Value="Departments" >
                <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department" Value="Create Department"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentList.aspx" Text="Departments List" Value="Departments List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Users" >
                <asp:TreeNode NavigateUrl="~/Admin/AddUser.aspx" Text="Create User" Value="Create User"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/UsersList.aspx" Text="Users List" Value="Users List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Documents" >
                <asp:TreeNode NavigateUrl="~/Admin/DocumentTypeList.aspx" Text="Document Types List" Value="Document Types List"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DocumentList.aspx" Text="Document List" Value="Document List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Maintenance/ScreenList.aspx" Text="Screens List" Value="Screens List"></asp:TreeNode>
        </Nodes>
    </asp:TreeView>
