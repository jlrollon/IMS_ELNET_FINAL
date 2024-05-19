<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="order_details.aspx.cs" Inherits="IMS_ELNET_FP.order_details" %>


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
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/dashboard" title="Dashboard">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
                          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5z"/>
                        </svg>
                        &nbsp;&nbsp;Dashboard
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light " href="/stocks"><i class="fa-solid fa-box-open" title="Stocks"></i>&nbsp;&nbsp;Stocks</a></div>
                    <div><a class="d-flex align-items-center bg-light p-1 ps-3 text-dark" href="/orders" title="Orders"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;Orders</a></div>
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
                        <h3>Orders</h3>
                    </div>
                </div>
            </header>
            <section>
                <div class="m-4">
                    <div class="d-flex gap-3">
                        <a class="text-secondary" href="/orders">Orders</a>
                        >
                        <a class="text-secondary" style="opacity: 50%; text-decoration: none;">Orders Details</a>
                    </div>
                </div>
                <div class="col-5 order-details m-4 pt-3 p-4">
                    <div class="order-header-details">
                        <h4>Orders</h4>
                        <div class="d-flex gap-4">
                            <span>Order ID - <asp:Literal ID="Orderid" runat="server"></asp:Literal></span>
                            <span id="status" class="ps-2 pe-2 p-1 rounded-pill fw-semibold" style="font-size: 12px;"><asp:Literal ID="Orderstatus" runat="server"></asp:Literal></span>
                        </div>
                    </div>
                    <hr />
                    <div class="mt-3">
                        <div class="order-body-details">
                            <div class="d-flex justify-content-between gap-5">
                                <div>
                                    <h6>Product Details</h6>
                                    <div class="d-flex flex-column gap-2">
                                        <ul class="m-0 p-0 d-flex flex-column gap-1">
                                            <li style="font-size: 12px;">Product Name</li>
                                            <li><asp:Literal ID="Productname" runat="server"></asp:Literal></li>
                                        </ul>
                                        <ul class="m-0 p-0 d-flex flex-column gap-1">
                                            <li style="font-size: 12px;">Price</li>
                                            <li><asp:Literal ID="Price" runat="server"></asp:Literal></li>
                                        </ul>
                                        <ul class="m-0 p-0 d-flex flex-column gap-1">
                                            <li style="font-size: 12px;">Ordered Quantity</li>
                                            <li><asp:Literal ID="Quantity" runat="server"></asp:Literal></li>
                                        </ul>  
                                        <span style="color: #6c757d;">Total Price:&nbsp;&nbsp;<asp:Literal ID="TotalPrice" runat="server"></asp:Literal></span>
                                    </div>
                                </div>
                                <div class="me-5">
                                    <h6>Personnel Ordered</h6>
                                    <div class="">
                                        <ul class="m-0 p-0 d-flex flex-column gap-2">
                                            <li><asp:Literal ID="Personname" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Personadd" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Personphone" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Personemail" runat="server"></asp:Literal></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-5">
                                <div class="">
                                    <h6>Supplier Details</h6>
                                    <div class="">
                                        <ul class="m-0 p-0 d-flex flex-column gap-2">
                                            <li><asp:Literal ID="Companyname" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Suppadd" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Suppphone" runat="server"></asp:Literal></li>
                                            <li><asp:Literal ID="Suppemail" runat="server"></asp:Literal></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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

        let ord_status = document.getElementById('status');

        if (ord_status.innerText === 'Completed') {
            ord_status.style.background = '#D9EDBF';
            ord_status.style.color = '#28a745';
        }
        else if (ord_status.innerText === 'Cancelled') {
            ord_status.style.background = '#FFCAD4';
            ord_status.style.color = '#dc3545';
        }
        else {
            ord_status.style.background = '#FFE0B5';
            ord_status.style.color = '#E48F45';
        }
    </script>
</form>
</asp:Content>