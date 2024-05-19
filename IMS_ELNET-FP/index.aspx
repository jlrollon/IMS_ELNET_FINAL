<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="IMS_ELNET_FP.index" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <main class="p-3">
        <div class="container-fluid login-container">
            <div id="wrapper">
                <div class="pt-3">
                    <header>
                        <div class="d-flex pe-5">
                            <h3><a href='/index'>SmokeStock</a></h3>
                        </div>
                    </header>
                </div>
                <section>
                    <div class="d-flex align-items-center" style="height: 80dvh;">
                        <div class="col-6">
                            <h1 style="font-size: 70px; color: #374259;"><b>Inventory<br />Control</b></h1>
                            <p class="mt-4" style="max-width: 85%;">
                                Welcome to SmokeStock! Your go-to solution for seamless cigarette
                                inventory management. Track stock levels, and optimize supply chain
                                efficiency with ease. Stay on top of your inventory game with
                                SmokeStock – where control meets convenience!
                            </p>
                        </div>
                        <div class="login-page d-flex justify-content-center">
                            <div class="col-6">
                                <div class="row text-center">
                                    <h3 class="mb-4">Sign in</h3>
                                    <form runat="server" method="POST">
                                        <div class="row gap-3">
                                        <input type="text" name="username" class="p-2 ps-3 pe-3 form-control" placeholder="Enter username" required />
                                        <div class="text-start" style="width: 100%; padding: 0 !important;">
                                            <input type="password"  name="password" id="password" class="p-2 ps-3 pe-3 form-control" placeholder="Enter password" required />
                                            <div class="mt-2">
                                                <input type="checkbox" id="checkbox" class="form-check-input" /> Show Password?
                                            </div>
                                        </div>
                                        <span class="text-danger"><%= errorMsg %></span>
                                        <asp:Button runat="server" Text="Submit" class="text-light p-2" OnClick="renderDashboard" style="width: 100%; border: none !important; background: #374259;"/>
                                        </div>
                                    </form>
                                    <div class="mt-3">
                                        <hr />
                                        <span>Forgot password? </span><a href="#" style="text-decoration: none;">Contact IT</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <script>
        let pass = document.querySelector("#password");
        let checkbox = document.querySelector("#checkbox");

        checkbox.addEventListener("change", () => {
            if (checkbox.checked) {
                pass.type = "text";
            } else {
                pass.type = "password";
            }
        });
    </script>
</asp:Content>
