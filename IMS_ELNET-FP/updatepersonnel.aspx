<%@ Page Title="Update" Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="updatepersonnel.aspx.cs" Inherits="IMS_ELNET_FP.updatepersonnel" %>

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
                        <a class="d-flex align-items-center p-1 ps-3 text-light" href="/dashboard">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
                          <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5z"/>
                        </svg>
                        &nbsp;&nbsp;Dashboard
                         </a>
                    </div>
                    <div><a class="d-flex align-items-center p-1 ps-3 text-light" href="/stocks"><i class="fa-solid fa-box-open"></i>&nbsp;&nbsp;Stocks</a></div>
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
                        <h3>Personnel</h3>
                    </div>
                </div>
            </header>
            <section>

                <!-- FOR UPDATING PRODUCTS -->
                <div class="update-content update-stocks-content m-3 pt-3 p-4">
                    <div class="col-6">
                        <div class="create-card p-3 ps-4 pe-4">
                            <div class="text-center">
                                <h3>Update Personnel</h3>
                            </div>
                            <div class="d-flex flex-column gap-4 mt-3">
                                <div class="mt-2 mb-3">
                                    <span class="fs-4">Personnel Details</span>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="personnel_id">Personnel ID</label>
                                    </span>
                                    <asp:TextBox ID="personnel_id" runat="server" CssClass="form-control" name="supp_id" placeholder="Personnel ID"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="firstname">Firstname</label>
                                    </span>
                                    <asp:TextBox ID="firstname" runat="server" CssClass="form-control" name="supp_id" placeholder="Personnel ID"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="lastname">Lastname</label>
                                    </span>
                                    <asp:TextBox ID="lastname" runat="server" CssClass="form-control" name="supp_id" placeholder="Personnel ID"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="address">Address</label>
                                    </span>
                                    <asp:TextBox ID="address" runat="server" CssClass="form-control" name="address" placeholder="Address"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="phone">Phone</label>
                                    </span>
                                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" name="phone" placeholder="Phone"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="email">E-Mail</label>
                                    </span>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control" name="email" placeholder="E-Mail"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="username">Username</label>
                                    </span>
                                    <asp:TextBox ID="user" runat="server" CssClass="form-control" name="email" placeholder="Username"></asp:TextBox>
                                </div>
                                <div class="d-flex align-items-center gap-5">
                                    <span style="width: 20%;">
                                        <label for="newpass">New Password</label>
                                    </span>
                                    <asp:TextBox ID="newPassword" runat="server" CssClass="form-control" name="newpassword" placeholder="New Password"></asp:TextBox>
                                </div>
                                <div class="create-submition mb-3">
                                    <asp:Button ID="AddBtn" runat="server" Text="Submit" CssClass="text-light form-control" OnClick="updatePersonnel"/>
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
            qty.value = parseInt(qty.value) - 1;
        }

        function increaseProduct() {
            let qty = document.getElementById('prod_qty');
            qty.value = parseInt(qty.value) + 1;
        }
    </script>
</form>
</asp:Content>
