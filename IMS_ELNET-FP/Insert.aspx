<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="IMS_ELNET_FP.Insert" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="addedAlert p-3 text-light">
        <h3><%= addedAlert %></h3>
    </div>
    <nav>
        <div class="nav">
            <div class="nav-list d-flex flex-column text-center">
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="dashboard.aspx" Target="_self">Dashboard</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="stocks.aspx" Target="_self">Stocks</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="reports.aspx" Target="_self">Reports</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="inventory.aspx" Target="_self">Inventory</asp:HyperLink>
                </div>
            </div>
            <div class="logout-link text-center" style="width: 100%; position: relative; top: 32%;">
                <asp:HyperLink runat="server" NavigateUrl="landingPage.aspx" Target="_self" style="text-decoration: none; font-size: 20px;">Logout</asp:HyperLink>
            </div>
        </div>
    </nav>
    
    <div class="main-content">
        <div class="text-center" style="max-width: 50%; padding: 1rem 3rem; margin-bottom: 3rem ;border-radius: 10px; border: .2px solid rgba(0,0,0,0.2);">
            <h1>Add New Product</h1>
            <br />
            <form runat="server" method="POST"  >
                <div class="text-center">
                    <div class="mb-3 mt-5 text-start">
                        <label for="sku" class="form-label"><strong>SKU</strong></label>
                        <input type="number" class="form-control p-3" id="add-sku" placeholder="Enter sku" name="sku" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="product" class="form-label"><strong>Product</strong></label>
                        <input type="text" class="form-control p-3" id="add-product" placeholder="Enter product" name="product" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="unitprice" class="form-label"><strong>Unit Price:</strong></label>
                        <input type="number" class="form-control p-3" id="add-unitprice" placeholder="Enter unit price" name="unitprice" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="quantity" class="form-label"><strong>Quantity:</strong></label>
                        <input type="text" class="form-control p-3" id="add-quantity" placeholder="Enter quantity" name="quantity" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="rack" class="form-label"><strong>Warehouse Rack:</strong></label>
                        <input type="text" class="form-control p-3" id="add-rack" placeholder="Enter rack" name="rack" required>
                    </div>
                </div>
                <asp:Button ID="AddBtn" runat="server" Text="Submit" CssClass="btn btn-lg mt-3 text-light" OnClick="InsertData" style="background:#B31312; padding: .7rem 3rem;" />
                <br /><br />
            </form>
        </div>
    </div>
</asp:Content>