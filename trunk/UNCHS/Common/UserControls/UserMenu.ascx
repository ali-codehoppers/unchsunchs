<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Common_UserControls_UserMenu" %>
<div class="left_nav_pnl" style="text-align: center">
    MAIN NAVIGATION
</div>
<div style="background-color: White; width: 252px;">
    <ul id="red" class="treeview-red">
        <li id="red-home" >
            <span class="txt_black" >
                <asp:HyperLink runat="server" CssClass="txt_black" ID="HomeNode" NavigateUrl="~/UserHome.aspx">Home</asp:HyperLink>
            </span>
        </li>
        <li id="red-folder" <%String urlString = Request.Url.ToString();
                               if (urlString.Contains("UserHome.aspx")
                               ||urlString.Contains("AddOrder.aspx")
                               ||urlString.Contains("SearchOrder.aspx")
                               ||urlString.Contains("UploadOrder.aspx")
                               ||urlString.Contains("GenerateSignage.aspx")
                               ||urlString.Contains("help.pdf")){ %>class="closed"<%}
                             else{%>class="open"<%} %>><span class="txt_black">H&S Folder</span>
            <ul>
                <li id="red-createfolder" >
                    <span class="txt_black">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink1" NavigateUrl="~/Orders/AddOrder.aspx">Create Folder</asp:HyperLink>
                    </span>
                </li>
                <li id="red-searchfolder">
                    <span class="txt_black">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink2" NavigateUrl="~/Orders/SearchOrder.aspx">Search Folder</asp:HyperLink>
                    </span>
                </li>
                <li id="red-uploadfolder">
                    <span class="txt_black">
                        <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink3" NavigateUrl="~/Orders/UploadOrder.aspx">Upload Addresses</asp:HyperLink>
                    </span>
                </li>
            </ul>
        </li>
        <li id="red-signage">
            <span class="txt_black">
                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink4" NavigateUrl="~/GenerateSignage.aspx">Signage</asp:HyperLink>
            </span>
        </li>
        <li id="red-settings" <%urlString = Request.Url.ToString();
                               if (urlString.Contains("AddDepartment.aspx")
                               ||urlString.Contains("DepartmentList.aspx")
                               ||urlString.Contains("DepartmentPersonList.aspx")
                               ||urlString.Contains("DepartmentPPECategoryList.aspx")
                               ||urlString.Contains("DepartmentPPEList.aspx")
                               ||urlString.Contains("DepartmentHazardCategoryList.aspx")
                               ||urlString.Contains("DepartmentHazardList.aspx")
                               ||urlString.Contains("DepartmentToolCategoryList.aspx")
                               ||urlString.Contains("DepartmentToolList.aspx")
                               ||urlString.Contains("DepartmentWorkCategoryList.aspx")
                               ||urlString.Contains("DepartmentWorkList.aspx")
                               ||urlString.Contains("DepartmentEmergencyCategoryList.aspx")
                               ||urlString.Contains("DepartmentEmergencyList.aspx")
                               ||urlString.Contains("DepartmentRequirementCategoryList.aspx")
                               ||urlString.Contains("DepartmentRequirementList.aspx")
                               ||urlString.Contains("DepartmentAspectCategoryList.aspx")
                               ||urlString.Contains("DepartmentAspectList.aspx")
                               ||urlString.Contains("DocumentCategoryList.aspx")
                               ||urlString.Contains("SectionList.aspx")
                               ||urlString.Contains("DocumentList.aspx")){ %>class="closed"<%}
                             else{%>class="open"<%} %>><span class="txt_black">Settings</span>
            <ul>
                <li id="red-departments" <%urlString = Request.Url.ToString();
                               if (urlString.Contains("AddDepartment.aspx")
                               ||urlString.Contains("DepartmentList.aspx")){ %>class="closed"<%}
                             else{%>class="open"<%} %>><span class="txt_black">Departments</span>
                    <ul>
                        <li id="red-adddepartments">
                            <span class="txt_black">
                                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink5" NavigateUrl="~/Maintenance/AddDepartment.aspx">Create Department</asp:HyperLink>
                            </span>
                        </li>
                        <li id="red-listdepartments">
                            <span class="txt_black">
                                <asp:HyperLink runat="server" CssClass="txt_black" ID="HyperLink6" NavigateUrl="~/Maintenance/DepartmentList.aspx">Departments List</asp:HyperLink>
                            </span>
                        </li>
                    </ul>
                </li>
                <li id="red-safety"><span class="txt_black">Safety Method Statement Default</span>
                    <ul>
                        <li id="red-default"><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink7" NavigateUrl="~/Maintenance/DepartmentPersonList.aspx">Default Person List</asp:HyperLink></span></li>
                        <li id="red-ppe"><span class="txt_black">PPE</span>
                            <ul>
                                <li id="red-categoryppe"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink8" NavigateUrl="~/Maintenance/DepartmentPPECategoryList.aspx">PPE Category List</asp:HyperLink>
                                </span></li>
                                <li id="red-listppe"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink9" NavigateUrl="~/Maintenance/DepartmentPPEList.aspx">Default PPE List</asp:HyperLink>
                                </span></li>
                            </ul>
                        </li>
                        <li id="red-hazards"><span class="txt_black">Key Hazards</span>
                            <ul>
                                <li id="red-categoryhazards"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink10" NavigateUrl="~/Maintenance/DepartmentHazardCategoryList.aspx">Key Hazard Category List</asp:HyperLink></span></li>
                                <li id="red-listhazards"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink11" NavigateUrl="~/Maintenance/DepartmentHazardList.aspx">Default Key Hazards List </asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-tools"><span class="txt_black">Plants & Tools</span>
                            <ul>
                                <li id="red-categorytools"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink12" NavigateUrl="~/Maintenance/DepartmentToolCategoryList.aspx">Plants & Tools Category List</asp:HyperLink></span></li>
                                <li id="red-listtools"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink13" NavigateUrl="~/Maintenance/DepartmentToolList.aspx">Default Plants & Tools List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-work"><span class="txt_black">Works</span>
                            <ul>
                                <li id="red-categorywork"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink14" NavigateUrl="~/Maintenance/DepartmentWorkCategoryList.aspx">Work Category List</asp:HyperLink></span></li>
                                <li id="red-listwork"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink15" NavigateUrl="~/Maintenance/DepartmentWorkList.aspx">Default Works List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-emergency"><span class="txt_black">Emergency</span>
                            <ul>
                                <li id="red-categoryemergency"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink16" NavigateUrl="~/Maintenance/DepartmentEmergencyCategoryList.aspx">Emergency Category List</asp:HyperLink></span></li>
                                <li id="red-listemergency"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink17" NavigateUrl="~/Maintenance/DepartmentEmergencyList.aspx">Default Emergency List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-requirements"><span class="txt_black">Requirements</span>
                            <ul>
                                <li id="red-categoryrequirements"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink18" NavigateUrl="~/Maintenance/DepartmentRequirementCategoryList.aspx">Requirement Category List</asp:HyperLink></span></li>
                                <li id="red-lsitrequirements"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink19" NavigateUrl="~/Maintenance/DepartmentRequirementList.aspx">Default Requirements List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-aspects"><span class="txt_black">Aspects</span>
                            <ul>
                                <li id="red-categoryaspects"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink20" NavigateUrl="~/Maintenance/DepartmentAspectCategoryList.aspx">Aspect Category List</asp:HyperLink></span></li>
                                <li id="red-listaspects"><span class="txt_black">
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink21" NavigateUrl="~/Maintenance/DepartmentAspectList.aspx">Default Aspects List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li id="red-template"><span class="txt_black">Document Templates</span>
                    <ul>
                        <li id="red-categorytemplate"><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink22" NavigateUrl="~/Maintenance/DocumentCategoryList.aspx">Documents Category List</asp:HyperLink>
                        </span></li>
                        <li id="red-sectiontemplate"><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink23" NavigateUrl="~/Maintenance/SectionList.aspx">Sections List</asp:HyperLink>
                        </span></li>
                        <li id="red-listtemplate"><span class="txt_black">
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="HyperLink24" NavigateUrl="~/Maintenance/DocumentList.aspx">Documents List</asp:HyperLink>
                        </span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li  id="red-guide"><span class="txt_black">
            <asp:HyperLink runat="server" ID="HyperLink25" NavigateUrl="~/Common/help/help.pdf"
                Target="_blank" CssClass="txt_black">User Guide</asp:HyperLink>
        </span></li>
    </ul>
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
