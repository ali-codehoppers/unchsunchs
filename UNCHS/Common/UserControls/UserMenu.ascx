<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Common_UserControls_UserMenu" %>
<div class="left_nav_pnl" style="text-align: center">
    MAIN NAVIGATION
</div>
<div style="background-color: White; width: 252px;">
    <ul id="red" class="treeview-red">
        <li>
            <span class="txt_black">
                <asp:HyperLink runat="server" CssClass="txt_black" ID="HomeNode" NavigateUrl="~/UserHome.aspx">Home</asp:HyperLink>
            </span>
        </li>
        <li><span class="txt_black">H&S Folder</span>
            <ul>
                <li>
                    <div class="left_nav">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink1" NavigateUrl="~/Orders/AddOrder.aspx">Create Folder</asp:HyperLink>
                    </div>
                </li>
                <li>
                    <div class="left_nav">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink2" NavigateUrl="~/Orders/SearchOrder.aspx">Search Folder</asp:HyperLink>
                    </div>
                </li>
                <li>
                    <div class="left_nav">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink3" NavigateUrl="~/Orders/UploadOrder.aspx">Upload Addresses</asp:HyperLink>
                    </div>
                </li>
            </ul>
        </li>
        <li>
            <div class="left_nav">
                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink4" NavigateUrl="~/GenerateSignage.aspx">Signage</asp:HyperLink>
            </div>
        </li>
        <li><span class="txt_black">Settings</span>
            <ul>
                <li><span class="txt_black">Departments</span>
                    <ul>
                        <li>
                            <div class="left_nav">
                                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink5" NavigateUrl="~/Maintenance/AddDepartment.aspx">Create Department</asp:HyperLink>
                            </div>
                        </li>
                        <li>
                            <div class="left_nav">
                                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink6" NavigateUrl="~/Maintenance/DepartmentList.aspx">Departments List</asp:HyperLink>
                            </div>
                        </li>
                    </ul>
                </li>
                <li><span class="txt_black">Safety Method Statement Default</span>
                    <ul>
                        <li><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink7" NavigateUrl="~/Maintenance/DepartmentPersonList.aspx">Default Person List</asp:HyperLink></span></li>
                        <li><span class="txt_black">PPE</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink8" NavigateUrl="~/Maintenance/DepartmentPPECategoryList.aspx">PPE Category List</asp:HyperLink>
                                </span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink9" NavigateUrl="~/Maintenance/DepartmentPPEList.aspx">Default PPE List</asp:HyperLink>
                                </span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Key Hazards</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink10" NavigateUrl="~/Maintenance/DepartmentHazardCategoryList.aspx">Key Hazard Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink11" NavigateUrl="~/Maintenance/DepartmentHazardList.aspx">Default Key Hazards List </asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Plants & Tools</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink12" NavigateUrl="~/Maintenance/DepartmentToolCategoryList.aspx">Plants & Tools Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink13" NavigateUrl="~/Maintenance/DepartmentToolList.aspx">Default Plants & Tools List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Works</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink14" NavigateUrl="~/Maintenance/DepartmentWorkCategoryList.aspx">Work Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink15" NavigateUrl="~/Maintenance/DepartmentWorkList.aspx">Default Works List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Emergency</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink16" NavigateUrl="~/Maintenance/DepartmentEmergencyCategoryList.aspx">Emergency Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink17" NavigateUrl="~/Maintenance/DepartmentEmergencyList.aspx">Default Emergency List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Requirements</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink18" NavigateUrl="~/Maintenance/DepartmentRequirementCategoryList.aspx">Requirement Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink19" NavigateUrl="~/Maintenance/DepartmentRequirementList.aspx">Default Requirements List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li><span class="txt_black">Aspects</span>
                            <ul>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink20" NavigateUrl="~/Maintenance/DepartmentAspectCategoryList.aspx">Aspect Category List</asp:HyperLink></span></li>
                                <li><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink21" NavigateUrl="~/Maintenance/DepartmentAspectList.aspx">Default Aspects List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><span class="txt_black">Document Templates</span>
                    <ul>
                        <li><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink22" NavigateUrl="~/Maintenance/DocumentCategoryList.aspx">Documents Category List</asp:HyperLink>
                        </span></li>
                        <li><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink23" NavigateUrl="~/Maintenance/SectionList.aspx">Sections List</asp:HyperLink>
                        </span></li>
                        <li><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink24" NavigateUrl="~/Maintenance/DocumentList.aspx">Documents List</asp:HyperLink>
                        </span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="open"><span class="txt_black">
            <asp:HyperLink runat="server" ID="HyperLink25" NavigateUrl="~/Common/help/help.pdf"
                Target="_blank" CssClass="txt_black">User Guide</asp:HyperLink>
        </span></li>
    </ul>
    <asp:TreeView ID="UserMenuTree" runat="server" Style="padding-left: 10px;" CollapseImageUrl="~/Images/arrow_bottom.jpg"
        ExpandImageUrl="~/Images/arrow_left.jpg" NoExpandImageUrl="~/Images/arrow_left.jpg"
        ExpandDepth="1" NodeStyle-CssClass="left_nav_link" NodeStyle-HorizontalPadding="10px"
        SelectedNodeStyle-ImageUrl="~/Images/arrow_select.jpg">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/UserHome.aspx" Text="Home" Value="Home"></asp:TreeNode>
            <asp:TreeNode Text="H&S Folder" Value="H&S Folder" Expanded="true">
                <asp:TreeNode NavigateUrl="~/Orders/AddOrder.aspx" Text="Create Folder" Value="Create Folder">
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Orders/SearchOrder.aspx" Text="Search Folder" Value="Search Folder">
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Orders/UploadOrder.aspx" Text="Upload Addresses" Value="Upload Folder">
                </asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/GenerateSignage.aspx" Text="Signage" Value="Signage">
            </asp:TreeNode>
            <asp:TreeNode Text="Settings" Value="Settings">
                <asp:TreeNode Text="Departments" Value="Departments" SelectAction="SelectExpand">
                    <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department"
                        Value="Create Department"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentList.aspx" Text="Departments List"
                        Value="Departments List"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="Safety Method Statement Default" Value="Safety Method Statement Default">
                    <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPersonList.aspx" Text="Default Person List"
                        Value="Default Person List"></asp:TreeNode>
                    <asp:TreeNode Text="PPE" Value="PPE">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPPECategoryList.aspx" Text="PPE Category List"
                            Value="PPE Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentPPEList.aspx" Text="Default PPE List"
                            Value="Default PPE  List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Key Hazards" Value="Key Hazards">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentHazardCategoryList.aspx" Text="Key Hazard Category List"
                            Value="Key Hazard Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentHazardList.aspx" Text="Default Key Hazard List"
                            Value="Default Key Hazard List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Plants & Tools" Value="Plants & Tools">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentToolCategoryList.aspx" Text="Plants & Tools Category List"
                            Value="Plants & Tools Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentToolList.aspx" Text="Default Plants & Tools List"
                            Value="Default Plants & Tools List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Works" Value="Works">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentWorkCategoryList.aspx" Text="Work Category List"
                            Value="Work Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentWorkList.aspx" Text="Default Work List"
                            Value="Default Work  List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Emergency" Value="Emergency">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentEmergencyCategoryList.aspx" Text="Emergency Category List"
                            Value="Emergency Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentEmergencyList.aspx" Text="Default Emergency List"
                            Value="Default Emergency  List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Requirements" Value="Requirements">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentRequirementCategoryList.aspx"
                            Text="Requirement Category List" Value="Requirement Category List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentRequirementList.aspx" Text="Default Requirements List"
                            Value="Default Requirements  List"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="Aspects" Value="Aspects">
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentAspectCategoryList.aspx" Text="Requirement Aspect List"
                            Value="Requirement Aspect List"></asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentAspectList.aspx" Text="Default Aspects List"
                            Value="Default Aspects List"></asp:TreeNode>
                    </asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="Document Templates" Value="Document Templates">
                    <asp:TreeNode NavigateUrl="~/Maintenance/DocumentCategoryList.aspx" Text="Documents Category List"
                        Value="Documents Category List"></asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/SectionList.aspx" Text="Sections List" Value="Sections List">
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/Maintenance/DocumentList.aspx" Text="Documents List"
                        Value="Documents List"></asp:TreeNode>
                </asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Common/help/help.pdf" Text="User Guide" Value="Help"
                Target="blank"></asp:TreeNode>
        </Nodes>
    </asp:TreeView>
    <div style="float: left;">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div style="background-color: White; float: left; height: 14px; width: 222px;">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</div>
