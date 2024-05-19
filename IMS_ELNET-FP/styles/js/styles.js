// Function to show/hide password


/*
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


// CREATE ORDER
function createOrder() {
    document.querySelector('.orders-content').style.display = 'none';
    document.querySelector('.create-content').style.display = 'block';
}

// CREATE SUPPLIER
function createSupplier() {
    document.querySelector('.suppliers-content').style.display = 'none';
    document.querySelector('.create-content').style.display = 'block';
}



// FOR UPDATING

// STOCKS UPDATING
function updateStocks() {
    document.querySelector('.stocks-content').style.display = 'none';
    document.querySelector('.update-stocks-content').style.display = 'block';
}

// Deduct product update
function deductProduct() {
    let qty = document.getElementById('product_quantity');
    qty.value = parseInt(qty.value) - 1;
}

// increase product update
function increaseProduct() {
    let qty = document.getElementsByClassName('product_quantity');
    qty.value = parseInt(qty.value) + 1;
}

function updateSuppliers() {
    document.querySelector('.suppliers-content').style.display = 'none';
    document.querySelector('.update-suppliers-content').style.display = 'block';
}

// FOR ORDERS UPDATE
document.addEventListener('DOMContentLoaded', function () {
    let orderStatusSelect = document.querySelector('#order-status-select');
    let orderStatusColor = document.querySelector('.order-status-color');

    // Function to update order status color
    function updateOrderStatusColor(selectedValue) {
        orderStatusColor.classList.remove('bg-warning', 'bg-danger', 'bg-success');

        if (selectedValue === 'Pending') {
            orderStatusColor.classList.add('bg-warning');
        } else if (selectedValue === 'Cancelled') {
            orderStatusColor.classList.add('bg-danger');
        } else if (selectedValue === 'Completed') {
            orderStatusColor.classList.add('bg-success');
        }
    }

    // Initial update based on the current selected value
    updateOrderStatusColor(orderStatusSelect.value);

    // Event listener for change in select option
    orderStatusSelect.addEventListener('change', function () {
        let selectedValue = this.value;
        updateOrderStatusColor(selectedValue);
    });
});

*/

