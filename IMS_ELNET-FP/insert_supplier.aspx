<%@ Page Title="Suppliers" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="insert_supplier.aspx.cs" Inherits="IMS_ELNET_FP.insert_supplier" %>

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
                    <div><a class="d-flex align-items-center bg-light p-1 ps-3 text-dark" href="/suppliers"><i class="fa-solid fa-truck-field"></i>&nbsp;&nbsp;Suppliers</a></div>
                    <!--<div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/inventory" title="Inventory"><i class="fa-regular fa-clipboard text-light"></i>&nbsp;&nbsp;Inventory</a></div>-->
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
                        <h3>Suppliers</h3>
                    </div>
                </div>
            </header>
            <section>

                <!-- FOR CREATING SUPPLIERS -->
                <div class="create-content m-3 pt-3 p-4">
                    <div class="col-6">
                        <div class="create-card p-3 ps-4 pe-4">
                            <div class="text-center">
                                <h3>Create Supplier</h3>
                            </div>
                            <div>
                                <div class="d-flex flex-column gap-4 mt-3">
                                    <div class="mt-2 mb-3">
                                        <span class="fs-4">Supplier Details</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="comp_name">Company&nbsp;&nbsp;<span class="text-danger fw-bold m-0" style="font-size: 1.2rem; cursor: pointer;" title="Company Name is required to insert a supplier">&#9432;</span></label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Company Name" name="comp_name" />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="address">Address</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Address" name="address" />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="phone">Phone</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Phone" name="phone" />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="email">E-Mail</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="E-Mail" name="email" />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="others">Other Details</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Other Details" name="others" />
                                    </div>
                                    <div class="create-submition mb-3">
                                        <asp:Button ID="AddBtn" runat="server" Text="Submit" CssClass="text-light form-control" OnClick="InsertData"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
     <script src="/styles/js/styles.js"></script>
</form>
</asp:Content>
