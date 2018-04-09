DROP DATABASE IF EXISTS bamazonmanager;
    CREATE DATABASE bamazonmanager;
    USE bamazonmanager;    
    
    CREATE TABLE products(
      itemID INT(5) NOT NULL AUTO_INCREMENT 
      product_name VARCHAR '25' NOT NULL,
      department_name VARCHAR '25' NOT NULL,
      item_cost INT default 0,
      stock_quantity INT default 0,
      PRIMARY KEY 'itemID'
    );
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("TCL", "Televisions", 500, 10);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("RCA", "Televisions",400, 5);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Samsung", "Televisions", 1500, 10);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Panasonic", "Televisions", 2500, 7);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Insignia", "Televisions", 500, 3);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Sony", "Televisions", 750, 20);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Magnovox", "Televisions", 100, 2);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Asus", "Televisions", 550, 6);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Mitsubishi", "Televisions", 1200, 8);
    
    INSERT INTO products (product_name, department_name, item_cost, stock_quantity)
	VALUES ("Toshiba", "Televisions", 800, 12);
    
    SELECT product_name, stock_quantity
    FROM products
    WHERE stock_quantity<=5;
    


