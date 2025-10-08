const prompt = require("prompt-sync")();

let items = [];

function showMenu() {
  console.log("\n==== MENU ====");
  console.log("1. Add item");
  console.log("2. View items");
  console.log("3. Remove item");
  console.log("4. Search item");
  console.log("5. Exit");
}

let running = true;

while (running) {
  showMenu();
  const choice = prompt("Choose an option (1-5): ");

  switch (choice) {
    case "1":
      const newItem = prompt("Enter item to add: ");
      items.push(newItem);
      console.log(`‚úÖ '${newItem}' added.`);
      break;

    case "2":
      console.log("\nÌ≥ã Items in the list:");
      if (items.length === 0) {
        console.log("No items yet.");
      } else {
        items.forEach((item, index) => {
          console.log(`${index + 1}. ${item}`);
        });
      }
      break;

    case "3":
      const removeItem = prompt("Enter item to remove: ");
      const index = items.indexOf(removeItem);
      if (index !== -1) {
        items.splice(index, 1);
        console.log(`‚ùå '${removeItem}' removed.`);
      } else {
        console.log("Item not found.");
      }
      break;

    case "4":
      const searchItem = prompt("Enter item to search: ");
      if (items.includes(searchItem)) {
        console.log(`Ì¥é Found '${searchItem}' in the list.`);
      } else {
        console.log(`‚ùå '${searchItem}' not found.`);
      }
      break;

    case "5":
      running = false;
      console.log("Ì±ã Exiting program...");
      break;

    default:
      console.log("‚ö†Ô∏è Invalid choice. Please try again.");
  }
}
