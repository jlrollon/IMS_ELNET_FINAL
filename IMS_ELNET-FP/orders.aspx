<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="IMS_ELNET_FP.orders" %>


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
                <div id="orders-content" class="content orders-content m-4 pt-3 p-4">
                    <div class="d-flex align-items-center justify-content-between mt-2">
                        <div class="d-flex gap-5 align-items-center">
                            <div class="orders-nav d-flex gap-3 align-items-center">
                                <span>
                                    <button type="button" id="highlight-btn" onclick="highlightButton(this)">All Orders
                                    </button>
                                </span>
                                <span>
                                    <button type="button" id="highlight-btn" onclick="highlightButton(this)">
                                        Pending
                                    </button>
                                </span>
                                <span>
                                    <button type="button" id="highlight-btn" onclick="highlightButton(this)">Cancelled</button>
                                </span>
                                <span>
                                    <button type="button" id="highlight-btn" onclick="highlightButton(this)">Completed</button>
                                </span>
                            </div>
                            <span style="height: fit-content;">
                                <!--<asp:TextBox ID="monthInput" runat="server" TextMode="Month" AutoPostBack="true" onchange="showOrders()" CssClass="month-input" ></asp:TextBox>--> <!--OnTextChanged="MonthInput_TextChanged"-->
                            </span>
                        </div>
                        <div>
                            <button type="button" class="btn btn-sm d-flex add-btn align-items-center gap-2 text-light p-1 ps-2" onclick="window.location.href='createorder.aspx'">
                                <span>New Order</span>
                                <span class="inner-btn btn-sm text-light"><i class="fa-solid fa-plus"></i></span>
                            </button>
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="table-content" style="max-height: 80dvh;">
                            <table class="table table-striped align-middle table-hover" style="border: 1px solid rgb(200,200,200);">
                                <thead class="text-light" style="background: #374259;">
                                    <tr>
                                        <th>Personnel Ordered</th>
                                        <th>Product</th>
                                        <th>Total Ordered</th>
                                        <th>Order Status</th>
                                        <th>Order Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="OrdersRepeater" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("PERSONNEL_ORDERED") %></td>
                                                <td><%# Eval("PRODUCT_NAME") %></td>
                                                <td><%# Eval("QUANTITY") %></td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <span class="order-status-color" style='<%# GetOrderStatusColorStyle(Eval("ORDER_STATUS")) %>'></span>
                                                        <select class="form-select form-select-sm order-status-select rounded-pill" 
                                                                onchange="updateOrderStatus('<%# Eval("ORDER_ID") %>')" 
                                                                id="orderStatus<%# Eval("ORDER_ID") %>" 
                                                                style="max-width: fit-content; border: none !important;">
                                                            <option value="Pending" <%# Eval("ORDER_STATUS").ToString() == "Pending" ? "selected" : "" %>>Pending</option>
                                                            <option value="Cancelled" <%# Eval("ORDER_STATUS").ToString() == "Cancelled" ? "selected" : "" %>>Cancelled</option>
                                                            <option value="Completed" <%# Eval("ORDER_STATUS").ToString() == "Completed" ? "selected" : "" %>>Completed</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td><%# Eval("ORDER_DATE") %></td>
                                                <td>
                                                    <button type="button" class="btn btn-sm btn-secondary rounded-pill" onclick="window.location.href='order_details.aspx?ORDER_ID=<%# Eval("ORDER_ID") %>'" style="font-size: 13px;">
                                                        Show details
                                                    </button>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <div class="page">
                                <div class="d-flex align-items-center gap-3">
                                    <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click" CssClass="btn" BackColor="#cecccc" >Prev</asp:LinkButton>
                                    <asp:Label ID="lblPage" runat="server"></asp:Label>
                                    <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click" CssClass="btn" BackColor="#374259" ForeColor="#ffffff">Next</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="order-details" class="col-5 order-details m-4 pt-3 p-4">
                    <div class="order-header-details">
                        <h4>Orders</h4>
                        <div class="d-flex gap-4">
                            <span>Order ID - 7</span>
                            <span class="ps-2 pe-2 p-1 rounded-pill text-success fw-semibold" style="background: #D9EDBF; font-size: 12px;">Completed</span>
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
                                            <li style="font-size: 10px;">Product Name</li>
                                            <li>Marlboro Red</li>
                                        </ul>
                                        <ul class="m-0 p-0 d-flex flex-column gap-1">
                                            <li style="font-size: 10px;">Price</li>
                                            <li>176,000.00</li>
                                        </ul>
                                        <ul class="m-0 p-0 d-flex flex-column gap-1">
                                            <li style="font-size: 10px;">Ordered Quantity</li>
                                            <li>80</li>
                                        </ul>  
                                        <span style="color: #6c757d;">Total Price: 1,000,000.00</span>
                                    </div>
                                </div>
                                <div class="me-5">
                                    <h6>Personnel Ordered</h6>
                                    <div class="">
                                        <ul class="m-0 p-0 d-flex flex-column gap-2">
                                            <li>John Lawrence Rollon</li>
                                            <li>A. Lopez, Labangon, Cebu City</li>
                                            <li>+639123456789</li>
                                            <li>jlr.rollon@gmail.com</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-5">
                                <div class="">
                                    <h6>Supplier Details</h6>
                                    <div class="">
                                        <ul class="m-0 p-0 d-flex flex-column gap-2">
                                            <li>PMFTC Inc.</li>
                                            <li>A.S. Fortuna Street Banilad Mandaue City</li>
                                            <li>+639123456789</li>
                                            <li>supplier@gmail.com</li>
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

        document.addEventListener('DOMContentLoaded', function () {
            let allOrdersButton = document.querySelector('.orders-nav button');
            highlightButton(allOrdersButton);
        });
        function highlightButton(button) {
            let buttons = document.querySelectorAll('.orders-nav button');
            for (let i = 0; i < buttons.length; i++) {
                if (buttons[i] === button) {
                    buttons[i].style.borderBottom = '2px solid #374259';
                    buttons[i].style.color = '#343a40';
                    buttons[i].style.opacity = '100%';
                } else {
                    buttons[i].style.borderBottom = 'none';
                    buttons[i].style.color = '#6c757d';
                    buttons[i].style.opacity = '70%';
                }
            }
        }

        function updateColor(selectElement) {
            var color = '';
            switch (selectElement.value) {
                case 'Pending':
                    color = 'orange'; // Adjust color as needed
                    break;
                case 'Cancelled':
                    color = 'red'; // Adjust color as needed
                    break;
                case 'Completed':
                    color = 'green'; // Adjust color as needed
                    break;
                default:
                    break;
            }
            selectElement.previousElementSibling.style.backgroundColor = color;
        }

        function updateOrderStatus(orderId) {
            let selectElement = document.getElementById('orderStatus' + orderId);
            let selectedValue = selectElement.value;
            window.location.href = 'orders.aspx?ORDER_ID=' + orderId + '&STATUS=' + selectedValue;
        }

        function showDetails(order_id) {
            document.getElementById('order-details').style.display = 'block';
            document.getElementById('orders-content').style.display = 'none';
            window.location.href = 'orders.aspx?ORDER_ID=' + order_id;
        }
    </script>
</form>
</asp:Content>