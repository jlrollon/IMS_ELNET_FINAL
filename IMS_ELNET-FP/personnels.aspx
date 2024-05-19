﻿<%@ Page Title="Personnels" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="personnels.aspx.cs" Inherits="IMS_ELNET_FP.personnels" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
 <form runat="server" method="POST">
     <div class="d-flex flex-row">
        <div class="sidebar text-center">
            <div class="top-header d-flex align-items-center gap-2">
                <i class="fa-brands fa-slack"></i>
                <span class="text-light fs-3">SmokeStock</span>
            </div>
            <nav>
                <div class="text-start">
                    <div>
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/dashboard" title="Dashboard">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
                          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5z"/>
                        </svg>
                        &nbsp;&nbsp;Dashboard
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light " href="/stocks"><i class="fa-solid fa-box-open" title="Stocks"></i>&nbsp;&nbsp;Stocks</a></div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/orders" title="Orders"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;Orders</a></div>
                    <div>
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/warehouse">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                          <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                          <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                        </svg>
                        &nbsp;&nbsp;Warehouse
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/suppliers"><i class="fa-solid fa-truck-field text-light"></i>&nbsp;&nbsp;Suppliers</a></div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/inventory" title="Inventory"><i class="fa-regular fa-clipboard text-light"></i>&nbsp;&nbsp;Inventory</a></div>
                    <div><a class="d-flex align-items-center bg-light p-1 ps-3 text-dark" href="/inventory" title="Personnels"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;Personnels</a></div>
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
                        <h3>Personnels</h3>
                    </div>
                </div>
            </header>
            <section>
                <div class="content stocks-content m-4 pt-3 p-4">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex">
                            <strong class="fs-3 fw-bold">List of Personnels</strong>
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="table-content" style="height: 80dvh;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover align-middle">
                                <Columns>
                                    <asp:BoundField DataField="PERSONNEL_NAME" HeaderText="Name" SortExpression="PERSONNEL_NAME">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PHONE" HeaderText="Phone" SortExpression="PHONE">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="EMAIL" HeaderText="E-Mail" SortExpression="EMAIL">
                                        <HeaderStyle BackColor="#374259" ForeColor="White" Font-Bold="true" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

     <script src="/styles/js/styles.js"></script>
</form>
</asp:Content>
