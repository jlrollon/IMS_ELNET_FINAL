<%@ Page Title="Update Product" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="updatestocks.aspx.cs" Inherits="IMS_ELNET_FP.updatestocks" %>


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

                <!-- FOR UPDATING PRODUCTS -->
                <div class="update-content update-stocks-content m-3 pt-3 p-4">
                    <div class="col-6">
                        <div class="create-card p-3 ps-4 pe-4">
                            <div class="text-center">
                                <h3>Update Product</h3>
                            </div>
                            <div class="d-flex flex-column gap-4 mt-3">
                                <div class="mt-2 mb-3">
                                    <span class="fs-4">Product Details</span>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="prod_num">Product No.</label>
                                    </span>
                                    <asp:TextBox ID="prod_num" runat="server" CssClass="form-control" name="prod_num" placeholder="Product Number"></asp:TextBox>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="prod_name">Product Name</label>
                                    </span>
                                    <asp:TextBox ID="prod_name" runat="server" CssClass="form-control" name="prod_name" placeholder="Product Name"></asp:TextBox>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="prod_type">Product Type</label>
                                    </span>
                                    <asp:TextBox ID="prod_type" runat="server" CssClass="form-control" name="prod_type" placeholder="Product Type"></asp:TextBox>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="price">Product Price</label>
                                    </span>
                                    <asp:TextBox ID="prod_price" runat="server" CssClass="form-control" name="price" placeholder="Product Price"></asp:TextBox>
                                </div>
                                <div class="mt-3 mb-3">
                                    <span class="fs-4">Quantity in boxes</span>
                                </div>
                                <div class="d-flex gap-1">
                                    <span style="width: 20%;">
                                        <label for="qty">Quantity</label>
                                    </span>
                                    <div class="d-flex gap-2">
                                        <button type="button" class="btn btn-sm btn-light quantity-minus" id="deduct" onclick="deductProduct()">
                                        <i class="fa-solid fa-minus"></i>
                                        </button>
                                            <asp:TextBox ID="prod_qty" runat="server" class="form-control quantity" name="qty" placeholder="0" style="max-width: 4rem; text-align: center;" ClientIDMode="Static"></asp:TextBox>
                                        <button type="button" class="btn btn-sm btn-light quantity-plus" onclick="increaseProduct()">
                                        <i class="fa-solid fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="mt-3 mb-3">
                                    <span class="fs-4">Warehouse Racks</span>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="rack_num">Rack Number</label>
                                    </span>
                                    <asp:TextBox ID="prod_rack" runat="server" CssClass="form-control" name="rack_num" placeholder="Rack Number"></asp:TextBox>
                                </div>
                                <div class="mt-3 mb-3">
                                    <span class="fs-4">Products Supplier</span>
                                </div>
                                <div class="d-flex gap-5">
                                    <span style="width: 20%;">
                                        <label for="supp_id">Supplier ID</label>
                                    </span>
                                    <asp:TextBox ID="prod_supp" runat="server" CssClass="form-control" name="supp_id" placeholder="Supplier ID"></asp:TextBox>
                                </div>
                                <div class="create-submition mb-3">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Submit" OnClick="updateStocks" CssClass="text-light form-control" />
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