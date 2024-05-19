<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="IMS_ELNET_FP.inventory" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <nav>
        <div class="nav">
            <div class="nav-list d-flex flex-column text-center">
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="dashboard.aspx" Target="_self">Dashboard</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="stock.aspx" Target="_self">Stocks</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="orders.aspx" Target="_self">Orders</asp:HyperLink>
                </div>
                <div class="list-group" style="background:#B31312;">
                    <asp:HyperLink class="link text-light" runat="server" NavigateUrl="inventory.aspx" Target="_self">Inventory</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="suppliers.aspx" Target="_self">Suppliers</asp:HyperLink>
                </div>
            </div>
            <div class="logout-link text-center" style="width: 100%; position: relative; top: 23%;">
                <asp:HyperLink runat="server" NavigateUrl="landingPage.aspx" Target="_self" style="text-decoration: none; font-size: 20px;">Logout</asp:HyperLink>
            </div>
        </div>
    </nav>
    <form runat="server">
        <div class="stocks-content">
            <div class="addHover d-flex justify-content-between aling-middle">
                <h1>Inventory</h1>
            </div>
            <div class="d-flex gap-5 row">
                <div class="inventory-header d-flex justify-content-between align-items-center" style="padding: 1rem 3rem !important;">
                     <div class="d-flex gap-3">
                         <div class="box-icons d-flex align-items-center justify-content-center text-light" style="font-size: 30px; height: 50px;width: 50px; border-radius: 5px; background: rgb(128, 128, 128);">
                             &#x26B6;
                         </div>
                         <div class="row">
                             <strong>Low in Stock</strong>
                             <b><asp:Label ID="lowstock" runat="server"></asp:Label></b>
                         </div>
                    </div>
                     <div class="d-flex gap-3">
                         <div class="box-icons d-flex align-items-center justify-content-center text-light" style="font-size: 30px; height: 50px;width: 50px; border-radius: 5px; background: rgb(128, 128, 128);">
                             &#x26B6;
                         </div>
                         <div class="row">
                             <strong>Out of Stock</strong>
                             <b><asp:Label ID="outstock" runat="server"></asp:Label></b>
                         </div>
                    </div>
                     <div class="d-flex gap-3">
                         <div class="box-icons d-flex align-items-center justify-content-center text-light" style="font-size: 30px; height: 50px;width: 50px; border-radius: 5px; background: rgb(128, 128, 128);">
                             &#x26B6;
                         </div>
                         <div class="row">
                             <strong>Highest Selling Product</strong>
                             <asp:Label ID="bsprod" runat="server"></asp:Label>
                         </div>
                    </div>
                </div>
                <div class="inventory-header" style="padding: 1rem 1rem !important;">
                    <h1 class="pt-1" style="font-size: 20px;">Inventory Overview</h1>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped mt-3 align-middle">
                        <Columns>
                            <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU">
                                <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PRODUCT_NAME" HeaderText="Product Name" SortExpression="PRODUCT_NAME">
                                <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UNIT_PRICE" HeaderText="Price" SortExpression="UNIT_PRICE" DataFormatString="{0:F2}">
                                <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PRODUCTS_ACTIVITY" HeaderText="Products Activity" SortExpression="PRODUCTS_ACTIVITY">
                                <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
    </form>
</asp:Content>