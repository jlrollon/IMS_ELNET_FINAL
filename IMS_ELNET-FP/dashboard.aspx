<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="IMS_ELNET_FP.dashboard" %>


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
                        <a class="d-flex align-items-center bg-light p-1 ps-3 text-dark" href="/dashboard" title="Dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
                                <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5z" />
                            </svg>
                            &nbsp;&nbsp;Dashboard
                        </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/stocks"><i class="fa-solid fa-box-open text-light" title="Stocks"></i>&nbsp;&nbsp;Stocks</a></div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/orders" title="Orders"><i class="fa-solid fa-inbox text-light"></i>&nbsp;&nbsp;Orders</a></div>
                    <div>
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/warehouse" title="Warehouse">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="white" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z" />
                                <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z" />
                            </svg>
                            &nbsp;&nbsp;Warehouse
                        </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/suppliers" title="Suppliers"><i class="fa-solid fa-truck-field text-light"></i>&nbsp;&nbsp;Suppliers</a></div>
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
                <div class="header d-flex justify-content-between align-items-center pe-2 ps-2">
                    <div class="d-flex align-items-center ">
                        <button type="button" id="side-btn" class="side-btn"><i class="fa-solid fa-bars"></i></button>
                        <div class="gap-1 p-2">
                            <h3>Dashboard</h3>
                        </div>
                    </div>
                    <div style="margin-right: 2rem;">
                            <strong>
                                <span>
                                    Hi, <asp:Label ID="PersonnelName" runat="server" Text=""></asp:Label>
                                </span>
                            </strong>
                        <button type="button" class="btn" onclick="window.location.href='updatepersonnel.aspx?USERNAME=<%= Session["username"] %>'">
                            <i class="fa-solid fa-gear"></i>
                        </button>
                    </div>
                </div>
            </header>
            <section>
                <div class="m-4">
                    <div class="d-grid upper-content">
                        <div class="grid-1">
                            <span class="fs-4">Inventory Summary</span>
                            <div class="d-flex flex-column mt-3">
                                <div class="box rounded d-flex justify-content-between pe-3 ps-3 pt-2 pb-2 mt-1">
                                    <span><i class="fa-solid fa-box-archive"></i>&nbsp;&nbsp;<strong>Total Products</strong></span>
                                    <span><asp:Label runat="server" ID="TotalProducts"></asp:Label></span>
                                </div>
                                <div class="box rounded  d-flex justify-content-between pe-3 ps-3 pt-2 pb-2 mt-3">
                                    <span><i class="fa-solid fa-tag"></i>&nbsp;&nbsp;<strong>Total Price</strong></span>
                                    <span>₱ <asp:Label runat="server" ID="TotalPrice" DataFormatString="{0:F2}"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="grid-2">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="fs-4">Activities</span>
                                <p class="fs-4 m-0 fw-semibold" id="time"></p>
                            </div>
                            <div class="d-grid grid-container mt-1">
                                <div class="grid-item ps-3 pe-3 p-2 bg-gradient position-relative" style="background: #ffffff;">
                                    <h6><i class="fa-solid fa-sort"></i>&nbsp;&nbsp;Monthly Orders</h6>
                                    <div class="d-flex flex-column">
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="selection-color bg-success"></div>
                                            <span class="fw-bold">
                                                <asp:Label runat="server" ID="TotalCompleted"></asp:Label>
                                            </span>
                                        </div>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="selection-color bg-danger"></div>
                                            <span class="fw-bold">
                                                <asp:Label runat="server" ID="TotalCancelled"></asp:Label>
                                            </span>
                                        </div>
                                    </div>
                                    <p class="mt-2 m-0" style="font-size: 12px;">Legend</p>
                                    <div class="d-flex gap-3 mt-2" style="font-size: .8rem;">
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="selection-color bg-success"></div><span>Completed</span>
                                        </div>
                                        <div class="d-flex align-items-center gap-2">
                                            <div class="selection-color bg-danger"></div><span>Cancelled</span>
                                        </div>
                                    </div>
                                    <div class="grid-item-page-btn position-absolute" style="width: 100%; right: 0; top: 0; border-top: .1px solid rgba(150,150,150,0.1); border-radius: 3px !important;">
                                        <button type="button" class="btn btn-sm text-dark btn-light m-2" style="float: right;">
                                            <span class="fw-bolder fs-5">⋮</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="grid-item p-3 position-relative" style="background: #71a0d6 !important;">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2">
                                            <span class="fw-bold">
                                                <asp:Label runat="server" ID="TotalAvailableStocks" CssClass="fs-1"></asp:Label>
                                            </span>
                                        </div>
                                        <div class="d-inline text-end" style="width: 100%;">
                                            <span class="fs-3 p-2 rounded bg-gradient" style="background: #3471b8; color: #95bbe8;"><i class="fa-solid fa-box-open"></i></span>
                                        </div>
                                    </div>
                                    <span class="d-block mt-3" style="font-size: .8rem;"><strong>Available Stocks</strong></span>
                                    <div class="grid-item-page-btn position-absolute d-flex" style="width: 100%; left: 0; bottom: 0; background: #3471b8;">
                                        <a href="/suppliers" class="text-end me-3" style="width: 100%; text-decoration: none; font-size: 12px;">
                                            <span class="text-light" style="font-weight: 500;">See more</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="grid-item p-3 position-relative" style="background: #ace2b5 !important;">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2">
                                            <span class="fw-bold">
                                                <asp:Label runat="server" ID="TotalSuppliers" CssClass="fs-1"></asp:Label>
                                            </span>
                                        </div>
                                        <div class="d-inline text-end" style="width: 100%;">
                                            <span class="fs-3 p-2 rounded bg-success bg-gradient" style="color: #bef1c6;"><i class="fa-solid fa-truck-field"></i></span>
                                        </div>
                                    </div>
                                    <span class="d-block mt-3" style="font-size: .8rem;"><strong>Total Suppliers</strong></span>
                                    <div class="grid-item-page-btn position-absolute d-flex bg-success" style="width: 100%; left: 0; bottom: 0;">
                                        <a href="/suppliers" class="text-end me-3" style="width: 100%; text-decoration: none; font-size: 12px;">
                                            <span class="text-light" style="font-weight: 500;">See more</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="grid-item p-3 position-relative" style="background: #f0f1ad !important;">
                                    <div class="d-flex align-items-center" style="gap: 10px;">
                                        <div class="ms-2 d-inline">
                                            <span class="fw-bold">
                                                <asp:Label runat="server" ID="TotalPersonnel" CssClass="fs-1"></asp:Label>
                                            </span>
                                        </div>
                                        <div class="d-inline text-end" style="width: 100%;">
                                            <span class="fs-3 p-2 rounded bg-gradient" style="background: #beb645; color: #f9fac4;"><i class="fa-solid fa-id-card"></i></span>
                                        </div>
                                    </div>
                                    <span class="d-block mt-3 mb-3" style="font-size: .8rem;"><strong>Total Personnel</strong></span>
                                    <div class="grid-item-page-btn position-absolute d-flex " style="width: 100%; left: 0; bottom: 0; background: #beb645;">
                                        <a href="/personnels" class="text-end me-3" style="width: 100%; text-decoration: none; font-size: 12px;">
                                            <span class="text-light" style="font-weight: 500;">See more</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid grid-3 p-3 ps-4 pe-4">
                            <div class="grid-3-one rounded p-4">
                                <strong>Products Summary</strong>
                                <div class="mt-4 mb-4 d-flex justify-content-between align-items-center" style="width: 100%;">
                                    <div>
                                        <strong><asp:Label runat="server" ID="Currentday"></asp:Label></strong>
                                        <div class="d-flex flex-column gap-3 mt-4">
                                            <div class="d-flex align-items-center gap-3">
                                                <i class="fa-solid fa-box-archive fs-3"></i>
                                                <strong>
                                                    <asp:Literal ID="Received" runat="server"></asp:Literal>
                                                </strong>
                                            </div>
                                            <div class="d-flex gap-3">
                                                <i class="fa-solid fa-cart-shopping fs-3"></i>
                                                <strong>
                                                    <asp:Literal ID="Delivered" runat="server"></asp:Literal>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex" style="font-size: 5rem; width: 50%;">
                                        <i class="fa-solid fa-chart-pie" style="font-size: 7rem !important;"></i>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="d-flex gap-4">
                                        <div>
                                            <span class="fw-semibold">Sales</span>
                                            <div class="d-block mt-2">
                                                <div class="d-flex align-items-center">
                                                    <span style="font-weight: 500; font-size: 14px;">
                                                        <i class="fa-solid fa-arrow-up text-success"></i>
                                                        <span>
                                                            <asp:Literal ID="Monthlysales" runat="server"></asp:Literal>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="fw-semibold">Average Growth</span>
                                            <div class="d-block mt-2">
                                                <div class="d-flex align-items-center">
                                                    <span style="font-weight: 500;">
                                                        <i class="fa-solid fa-chart-line text-primary"></i>&nbsp;&nbsp;
                                                        <span>
                                                            <asp:Literal ID="Averagegrowth" runat="server"></asp:Literal><b>%</b>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex gap-2">
                                            <i class="fa-solid fa-box-archive fs-3"></i>
                                            <span class="fs-5 fw-bold">Received</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <i class="fa-solid fa-cart-shopping fs-3"></i>
                                            <span class="fs-5 fw-bold">Delivered</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="grid-3-two rounded p-4">
                                
                            </div>
                            <div class="grid-3-three pt-3">
                                <h6>Other Users:</h6>
                                <div class="d-flex flex-column gap-2 mt-3">
                                    <asp:Repeater ID="PersonnelsRepeater" runat="server">
                                        <ItemTemplate>
                                            <span class="d-flex gap-3 p-2 align-items-center ps-2 pe-2 bg-light" style="border: .2px solid rgba(200,200,200,0.3);">
                                                <span class="text-dark rounded" style="background: #d7dce4; padding: .7rem 1rem;"><i class="fa-solid fa-user"></i></span>
                                                <span style="font-weight: 500;"><%# Eval("PERSONNEL_NAME") %></span>
                                            </span>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <div class="grid-4 position-relative p-4">
                            <span class="position-absolute bg-success"></span>
                            <p class="fw-semibold">Today's Report</p>
                            <hr />
                            <div>
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr class="bg-light">
                                            <th class="col-5">Description</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th class="fw-normal">Delivered</th>
                                            <td>
                                                <asp:Literal ID="todaysDelivered" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="fw-normal">Sales</th>
                                            <td>
                                                <asp:Literal ID="todaysSales" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p class="fw-semibold">Inventory</p>
                                <hr />
                                <div>
                                    <table class="table table-bordered align-middle">
                                        <tbody>
                                            <tr class="bg-light">
                                                <th class="col-5">Description</th>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span class="text-danger fw-semibold">Out of stock</span>
                                                </th>
                                                <td>
                                                    <asp:Literal ID="Outofstocks" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span class="fw-semibold" style="color: orange;">Low in stock</span>
                                                </th>
                                                <td>
                                                    <asp:Literal ID="Lowinstocks" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                        <div class="grid-5 ps-3 pe-3 p-2">
                            <div class="d-flex justify-content-between pe-2 ps-2">
                                <span><strong>Top Ordered Products</strong></span>
                                <strong><asp:Label runat="server" ID="CurrentDate"></asp:Label></strong>
                            </div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table mt-2 align-middle">
                                <Columns>
                                    <asp:BoundField DataField="PROD_NAME" HeaderText="Product Description" SortExpression="PROD_NAME">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_ORDERED" HeaderText="Total Ordered" SortExpression="TOTAL">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_PRICE" HeaderText="Total Price" SortExpression="TOTAL_PRICE">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232"  />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="COMPANY_NAME" HeaderText="Suppliers" SortExpression="COMPANY_NAME">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="grid-6 ps-3 pe-3 p-2">
                            <div class="d-flex mt-2">
                                <span><strong>Top Selling Products</strong></span>
                            </div>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table mt-2 align-middle">
                                <Columns>
                                    <asp:BoundField DataField="PROD_NAME" HeaderText="Description" SortExpression="PROD_NAME">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TOTAL_ITEMS_DELIVERED" HeaderText="Total Delivered" SortExpression="TOTAL_ITEMS_DELIVERED">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232"  />
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="TOTAL_SALES" HeaderText="Sales" SortExpression="TOTAL_SALES">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ACTIVITIES" HeaderText="Status" SortExpression="ACTIVITIES">
                                        <HeaderStyle CssClass="bg-light fw-bold" ForeColor="#323232" />
                                    </asp:BoundField>
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

        let time = document.getElementById('time');

        function updateTime() {
            let currentDate = new Date();
            let monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];

            let month = monthNames[currentDate.getMonth()];
            let day = currentDate.getDate();
            let year = currentDate.getFullYear();
            let hours = currentDate.getHours();
            let minutes = currentDate.getMinutes();
            let seconds = currentDate.getSeconds();
            let ampm = hours >= 12 ? 'pm' : 'am';

            hours = hours % 12;
            hours = hours ? hours : 12;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;

            time.innerHTML = month + ' ' + day + ', ' + year + ' ' + hours + ':' + minutes + ':' + seconds + ' ' + ampm;
        }

        // Update the time initially
        updateTime();

        // Update the time every second
        setInterval(updateTime, 1000);


    </script>
</form>
</asp:content>
