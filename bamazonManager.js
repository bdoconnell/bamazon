// Require NPM packages
var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('cli-table');

// Setup connection to SQL server
var connection = mysql.createConnection({
	host: "localhost",
	port: 8889,
	// Your username
	user: "root",
	// Your password
	password: "root",
	database: "bamazonmanager"
});
// Connect to DB
connection.connect(function (err) {
	if (err) throw err;
	console.log('Connected as id' + connection.threadId);
	startBuying();
});
//Setting up managers prompts
var startBuying = function () {
	connection.query('SELECT * FROM products', function (err, res) {

		inquirer
			.prompt([{

				type: "list",
				name: "managerChoice",
				message: "What information would you like to review?",
				choices: ["Products for sale", "stoch_quantity<=5", "Add inventory to existing product", "Add a new product"]

				//Set up the cli-table
			}]).then(function (printStuff) {
				var table = new Table({
					head: ['Item ID', 'Product Name', 'Department', 'Cost', 'Stock']
					, colWidths: [10, 45, 40, 8, 8]
				});
				for (var i = 0; i < res.length; i++) {
					table.push([res[i].itemID, res[i].product_name, res[i].department_name, res[i].item_cost, res[i].stock_quantity]);
				}
				console.log(table.toString());

				//Table for low inventory
				connection.query('SELECT * FROM products, WHERE stock_quantity<=5;', function (err, res) {
					inquirer.prompt([{
						name: 'view',
						type: 'confirm',
						message: '\nWould you like to view products with inventory under 5 items?'

					}]).then(function (printStuff) {
						var table = new Table({
							head: ['Product Name', 'Stock']
							, colWidths: [25, 25]
						});
						for (var i = 0; i < res; i++) {
							table.push([res[i].product_name, res[i].stock_quantity]);
							choiceArray.push(res[i].product_name);
						}
						console.log(table.toString());
					})
				})

			})
	})
}
