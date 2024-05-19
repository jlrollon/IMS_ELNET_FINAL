<%@ Page Title="Stocks" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="stocks.aspx.cs" Inherits="IMS_ELNET_FP.stocks" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
 <form runat="server">
     <div class="d-flex flex-row">
        <div class="sidebar text-center">
            <div class="top-header d-flex align-items-center gap-2">
                <i class="fa-brands fa-slack"></i>
                <span class="text-light fs-3">SmokeStock</span>
            </div>
            <nav>
                <div class="text-start">
                    <div>
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/dashboard">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
                          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5z"/>
                        </svg>
                        &nbsp;&nbsp;Dashboard
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center bg-light p-1 ps-3 text-dark" href="/stocks"><i class="fa-solid fa-box-open"></i>&nbsp;&nbsp;Stocks</a></div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/orders"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;Orders</a></div>
                    <div>
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/warehouse">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                          <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                          <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                        </svg>
                        &nbsp;&nbsp;Warehouse
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/suppliers"><i class="fa-solid fa-truck-field"></i>&nbsp;&nbsp;Suppliers</a></div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/inventory" title="Inventory"><i class="fa-regular fa-clipboard text-light"></i>&nbsp;&nbsp;Inventory</a></div>
<div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/personnels" title="Personnels"><i class="fa-solid fa-user text-light"></i>&nbsp;&nbsp;Personnels</a></div>
                </div>
            </nav>
            <hr class="text-light text-center" style="width: 90%; margin-left: 5%;" />
            <div class="text-start">
                <div class="d-flex align-items-center p-1 ps-3 text-light">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <asp:Button ID="btnRemoveSession" runat="server" CssClass="logout-btn btn text-light" Text="Sign out" OnClick="logout" />
                </div>
            </div>
        </div>
        <div class="side">
            <header>
                <div class="header d-flex align-items-center pe-2 ps-2">
                    <button type="button" class="side-btn"><i class="fa-solid fa-bars"></i></button>
                    <div class="d-flex align-items-center gap-1 p-2">
                        <h3>Stocks</h3>
                    </div>
                </div>
            </header>
            <section>
                <div class="content stocks-content m-4 pt-3 p-4">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex">
                            <strong class="fs-3 fw-bold">Manage Your Stocks</strong>
                        </div>
                        <div>
                            <button type="button" class="add-btn btn btn-sm d-flex align-items-center gap-2 text-light p-1 ps-2" onclick="window.location.href='insertproduct.aspx'">
                                <span>Add Product</span>
                                <span class="inner-btn text-light"><i class="fa-solid fa-plus"></i></span>
                            </button>
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="table-content" style="height: 80dvh;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover align-middle" AllowPaging="true" PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="PRODUCT_NUMBER" HeaderText="Product Number" SortExpression="PRODUCT_NUMBER">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="PROD_NAME" HeaderText="Description" SortExpression="PROD_NAME">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRICE" HeaderText="Price" SortExpression="PRICE" DataFormatString="{0:F2}">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="QUANTITY" HeaderText="Stocks" SortExpression="QUANTITY">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_PRICE" HeaderText="Total Price" SortExpression="TOTAL_PRICE" DataFormatString="{0:F2}">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DATE_MODIFIED" HeaderText="Date Modified" SortExpression="DATE_MODIFIED">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="COMPANY_NAME" HeaderText="Supplier" SortExpression="COMPANY_NAME">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <HeaderStyle BackColor="#374259" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                                        <ItemTemplate>
                                            <div class="dropdown">
                                                <button type="button" class="btn btn-sm" data-bs-toggle="dropdown"><b>⋮</b></button>
                                                <ul class="dropdown-menu">
                                                    <span class="ms-3" style="font-size: 12px;">Orders</span>
                                                    <li><button type="button" class="dropdown-item" onclick="window.location.href='createorder.aspx?PRODUCT_NUMBER=<%# Eval("PRODUCT_NUMBER") %>'">Create Order</button></li>
                                                    <hr class="m-0" />
                                                    <span class="ms-3" style="font-size: 12px;">Status</span>
                                                    <li><button type="button" class="dropdown-item" onclick="window.location.href='updatestocks.aspx?PRODUCT_NUMBER=<%# Eval("PRODUCT_NUMBER") %>'">Edit</button></li>
                                                    <li><asp:Button ID="btnDeleteColumn" runat="server" Text="Delete" CssClass="dropdown-item" OnClick="deleteProduct" CommandArgument='<%# Eval("PRODUCT_NUMBER") %>' /></li>
                                                </ul>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <script>

        let toggleButton = document.querySelector(".side-btn");
        let sidebar = document.querySelector(".sidebar");

        toggleButton.onclick = function () {
            sidebar.classList.toggle("toggled");
        };

    </script>
</form>
</asp:Content>
