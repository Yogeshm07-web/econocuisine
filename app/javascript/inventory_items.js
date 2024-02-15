// app/assets/javascripts/inventory_items.js

document.addEventListener('DOMContentLoaded', function() {
  const newItemForm = document.getElementById('new-inventory-item-form');
  const inventoryTableBody = document.getElementById('inventory-table-body');

  newItemForm.addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the default form submission

    // Capture the form data
    const formData = new FormData(this);
    const newItemData = {
      name: formData.get('inventory[name]'),
      description: formData.get('inventory[description]'),
      category: formData.get('inventory[category]'),
      price: formData.get('inventory[price]'),
      stock: formData.get('inventory[stock]'),
      quantity: formData.get('inventory[quantity]')
    };

    // Call function to add new inventory item to the table
    addNewInventoryItem(newItemData);

    // Clear the form inputs
    this.reset();
  });

  // Function to add new inventory item to the table
  function addNewInventoryItem(item) {
    const newRow = document.createElement('tr');
    newRow.innerHTML = `
      <td>${item.name}</td>
      <td>${item.description}</td>
      <td>${item.category}</td>
      <td>${item.price}</td>
      <td>${item.stock}</td>
      <td>${item.quantity}</td>
      <td>
        <!-- Add actions here if needed -->
      </td>
    `;
    inventoryTableBody.appendChild(newRow);
  }
});
