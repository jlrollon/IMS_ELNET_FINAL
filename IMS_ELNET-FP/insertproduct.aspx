<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="insertproduct.aspx.cs" Inherits="IMS_ELNET_FP.insertproduct" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<form runat="server" method="post">
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
                    <!--<div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/inventory" title="Inventory"><i class="fa-regular fa-clipboard text-light"></i>&nbsp;&nbsp;Inventory</a></div>-->
                </div>
            </nav>
            <hr class="text-light text-center" style="width: 90%; margin-left: 5%;" />
            <div class="text-start">
                <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/index"><i class="fa-solid fa-arrow-right-from-bracket"></i>&nbsp;&nbsp;
                    Sign out
                    </a>
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
                <!-- FOR CREATING PRODUCTS -->
                <div class="create-content m-3 pt-3 p-4">
                    <div class="col-6">
                        <div class="create-card p-3 ps-4 pe-4">
                            <div class="text-center">
                                <h3>Create Product</h3>
                            </div>
                            <div>
                                <div class="d-flex flex-column gap-4 mt-3">
                                    <div class="mt-2 mb-3">
                                        <span class="fs-4">Product Details</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="prod_num">Product No.&nbsp;<span class="text-danger fw-bold" style="font-size: 1.2rem; cursor: pointer;" title="Product Number is required to insert a products">&#9432;</span></label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Product Number" name="prod_num" required />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="prod_name">Product Name</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Product Name" name="prod_name" required />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="prod_type">Product Type</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Product Type" name="prod_type" required />
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="prod_type">Product Price</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Product Price" name="prod_price" required />
                                    </div>
                                    <div class="mt-3 mb-3">
                                        <span class="fs-4">Quantity in boxes</span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <span style="width: 20%;">
                                            <label for="qty">Quantity</label>
                                        </span>
                                        <div class="d-flex gap-2">
                                            <button type="button" class="btn btn-sm btn-light quantity-minus" onclick="deductProduct()">
                                            <i class="fa-solid fa-minus"></i>
                                            </button>
                                            <input type="text" class="form-control" placeholder="Quantity" name="qty" id="prod_qty" required value="0" style="max-width: 4rem; text-align: center;"/>
                                            <button type="button" class="btn btn-sm btn-light quantity-plus" onclick="increaseProduct()">
                                            <i class="fa-solid fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="mt-3 mb-3">
                                        <span class="fs-4">Warehouse Racks</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="rack_num">Rack No.&nbsp;<span class="text-danger fw-bold" style="font-size: 1.2rem; cursor: pointer;" title="Rack Number is required to insert a products">&#9432;</span></label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Rack Number" name="rack_num" required />
                                    </div>
                                    <div class="mt-3 mb-3">
                                        <span class="fs-4">Products Supplier</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-5">
                                        <span style="width: 20%;">
                                            <label for="supp_id">Supplier ID</label>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Supplier ID" name="supp_id" required />
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
    <script>

        let toggleButton = document.querySelector(".side-btn");
        let sidebar = document.querySelector(".sidebar");

        toggleButton.onclick = function () {
            sidebar.classList.toggle("toggled");
        };

        function deductProduct() {
            let qty = document.getElementById('prod_qty');

            if (parseInt(qty.value) <= 0) {
                document.getElementById('deduct').disabled = true;
            } else {
                qty.value = parseInt(qty.value) - 1;
                document.getElementById('deduct').disabled = false;
            }
        }

        function increaseProduct() {
            let qty = document.getElementById('prod_qty');
            qty.value = parseInt(qty.value) + 1;
            document.getElementById('deduct').disabled = false;
        }

    </script>
</form>
</asp:Content>

