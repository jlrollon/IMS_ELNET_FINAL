<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="IMS_ELNET_FP.reports" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
 <form runat="server">
    <nav>
        <div class="nav">
            <div class="nav-list d-flex flex-column text-center">
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="dashboard.aspx" Target="_self">Dashboard</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="stocks.aspx" Target="_self">Stocks</asp:HyperLink>
                </div>
                <div class="list-group" style="background:#B31312;">
                    <asp:HyperLink class="link text-light" runat="server" NavigateUrl="reports.aspx" Target="_self">Reports</asp:HyperLink>
                </div>
                <div class="list-group">
                    <asp:HyperLink class="link" runat="server" NavigateUrl="inventory.aspx" Target="_self">Inventory</asp:HyperLink>
                </div>
            </div>
            <div class="logout-link text-center" style="width: 100%; position: relative; top: 28%;">
                <asp:HyperLink runat="server" NavigateUrl="landingPage.aspx" Target="_self" style="text-decoration: none; font-size: 20px;">Logout</asp:HyperLink>
            </div>
        </div>
    </nav>

    <div class="stocks-content">
        <div class="addHover d-flex justify-content-between aling-middle">
            <h1>Reports</h1>
            <div class="dates mt-3">
                <label for="from">From:</label>
                <input class="p-2 btn btn-light border" type="date" name="from" style="margin-right: 2rem;"/>
                <label for="from">To:</label>
                <input class="p-2 btn btn-light border" type="date" name="to"/>
                 <asp:Button runat="server" CssClass="btn text-light d-inline" style="background: #B31312; margin-left: 1rem;" Text="Show"/>
            </div>
        </div>
        <div style="max-height: 50vh; overflow-y: auto;">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped mt-3 align-middle">
                <Columns>
                    <asp:BoundField DataField="REPORT_ID" HeaderText="Report ID" SortExpression="REPORT_ID">
                        <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU">
                        <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                    </asp:BoundField>
                     <asp:BoundField DataField="REPORT_TYPE" HeaderText="Report Type" SortExpression="REPORT_TYPE">
                        <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UNITS_IN_STOCK" HeaderText="Quantity" SortExpression="UNITS_IN_STOCK">
                        <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="REPORT_DATE" HeaderText="Report Date" SortExpression="REPORT_DATE">
                        <HeaderStyle BackColor="#B31312" ForeColor="White" Font-Bold="true" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</form>
</asp:Content>