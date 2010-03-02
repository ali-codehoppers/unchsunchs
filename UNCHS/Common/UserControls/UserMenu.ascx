<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Common_UserControls_UserMenu" %>

    <p>
        &nbsp;</p>

    <asp:TreeView ID="UserMenuTree" runat="server" 
        CollapseImageUrl="~/Images/Folder.gif" ExpandImageUrl="~/Images/Folder.gif" 
        LineImagesFolder="~/TreeLineImages" ShowLines="True">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/UserHome.aspx" Text="Home" Value="Home">
            </asp:TreeNode>
            <asp:TreeNode Text="H&S Folder" Value="H&S Folder" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Orders/AddOrder.aspx" Text="Create Folder" Value="Create Folder"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Orders/SearchOrder.aspx" Text="Search Folder" Value="Search Folder"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Orders/UploadOrder.aspx" Text="Upload Folder" Value="Upload Folder"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Orders/GenerateCOSHH.aspx" Text="COSHH" Value="COSHH"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/GenerateSignage.aspx" Text="Signage" Value="Signage"></asp:TreeNode>
            <asp:TreeNode Text="Settings" Value="Settings" Expanded="False">
                <asp:TreeNode Text="Departments" Value="Departments" Expanded="False">
                    <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department" Value="Create Department"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentList.aspx" Text="Departments List" Value="Departments List"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="Safety Method Statement Default" 
                    Value="Safety Method Statement Default" Expanded="False">
                    <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPersonList.aspx" Text="Default Person List" Value="Default Person List"></asp:TreeNode>
                    <asp:TreeNode Text="PPE" Value="PPE" Expanded="False">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPPECategoryList.aspx" Text="PPE Category List" Value="PPE Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPPEList.aspx" Text="Default PPE List" Value="Default PPE  List"></asp:TreeNode>    
                    </asp:TreeNode>
                    <asp:TreeNode Text="Key Hazards" Value="Key Hazards" Expanded="False">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentHazardCategoryList.aspx" Text="Key Hazard Category List" Value="Key Hazard Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentHazardList.aspx" Text="Default Key Hazard List" Value="Default Key Hazard List"></asp:TreeNode>    
                    </asp:TreeNode>
                    <asp:TreeNode Text="Plants & Tools" Value="Plants & Tools" Expanded="False">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentToolCategoryList.aspx" Text="Plants & Tools Category List" Value="Plants & Tools Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentToolList.aspx" Text="Default Plants & Tools List" Value="Default Plants & Tools List"></asp:TreeNode>    
                    </asp:TreeNode>                    
                </asp:TreeNode>
                <asp:TreeNode Text="Document Templates" Value="Document Templates" 
                    Expanded="False">
                    <asp:TreeNode NavigateUrl="~/Maintenance/DocumentCategoryList.aspx" Text="Documents Category List" Value="Documents Category List"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/SectionList.aspx" Text="Sections List" Value="Sections List"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/DocumentList.aspx" Text="Documents List" Value="Documents List"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department" Value="Create Department"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode NavigateUrl="~/Common/help/help.pdf" Text="Help" Value="Help">
            </asp:TreeNode>
        </Nodes>
    </asp:TreeView>

