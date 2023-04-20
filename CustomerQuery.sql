	CREATE TABLE tb_madhavan_customers(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL  , 
	code VARCHAR(100) NOT NULL  ,
	email VARCHAR(100) NOT NULL ,
	phone VARCHAR(100) NOT NULL ,
	contact_person_name VARCHAR(100) NOT NULL ,
	contact_person_phone VARCHAR(100) NOT NULL  ,
	status VARCHAR (50) NOT NULL ,
	created_date TIMESTAMP  NOT  NULL  DEFAULT CURRENT_TIMESTAMP,
	created_by VARCHAR(100) NOT NULL ,
	modified_date TIMESTAMP  NOT  NULL  DEFAULT CURRENT_TIMESTAMP,
	modified_by VARCHAR(100) NOT NULL ,
	PRIMARY KEY (id));
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   CREATE TABLE tb_madhavan_customer_address(
   id INT NOT NULL AUTO_INCREMENT ,
   customer_id INT NOT NULL,
   address_type ENUM('Home','work'),
   address_line1 VARCHAR(200) NOT NULL,
   address_line2 VARCHAR(200) NOT NULL ,
   city VARCHAR(200) NOT NULL  ,
   state VARCHAR(200) NOT NULL ,
   country VARCHAR(200) NOT NULL ,
   postal_code VARCHAR(20) NOT NULL ,
   PRIMARY KEY(id),
   UNIQUE (customer_id,address_type),
   CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES tb_madhavan_customers (id) 
   );

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   CREATE TABLE  tb_madhavan_customer_order( 
   id INT NOT NULL AUTO_INCREMENT ,
   customer_id INT NOT NULL , 
   order_no VARCHAR (50) NOT NULL , 
   order_date DATE NOT NULL ,
   no_of_items VARCHAR (50) NOT NULL , 
   order_sub_total DECIMAL (10,2) NOT NULL , 
   order_discount DECIMAL (10,2) NOT NULL, 
   order_total_amount DECIMAL  (10,2) NOT NULL ,
   payment_type VARCHAR (200)NOT NULL , 
   delivery_date DATE NOT NULL  , 
   status VARCHAR(200) NOT NULL    , 
   created_date DATE NOT NULL ,
   created_by VARCHAR(50) NOT NULL , 
   modified_date DATE NOT NULL  ,
   modifie_by VARCHAR (200) NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (customer_id) REFERENCES tb_madhavan_customers(id)
   );
   
   ALTER TABLE tb_madhavan_customer_order
   MODIFY COLUMN order_date DATETIME;

   ALTER TABLE tb_madhavan_customer_order
   MODIFY COLUMN delivery_date DATETIME;

   ALTER TABLE tb_madhavan_customer_order
   MODIFY COLUMN created_date DATETIME;

   ALTER TABLE tb_madhavan_customer_order
   MODIFY COLUMN modified_date DATETIME;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   CREATE TABLE tb_madhavan_customer_order_item(
   id INT NOT NULL AUTO_INCREMENT ,
   order_id INT NOT NULL,
   item_name VARCHAR (200) NOT NULL,
   item_sku VARCHAR (50) NOT NULL ,
   item_rate DECIMAL (10,2) NOT NULL,
   ordered_qty INT NOT NULL,
   order_total DECIMAL(10,2) NOT NULL ,
   PRIMARY KEY(id));
 
   ALTER TABLE tb_madhavan_customer_order_item
   ADD  CONSTRAINT fk_customer_order_id  FOREIGN KEY(order_id) REFERENCES  tb_madhavan_customer_order (id);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   INSERT into tb_madhavan_customers(id, name, code, email,phone, contact_person_name, contact_person_phone, status, created_by, modified_by)
   VALUES 
   (1, 'madhavan','ma001','madhavan@gmail.com', '7894561230', 'madhavan', '7894561230', 'Active', 'Admin', 'madhavan'),
   (2, 'Smith', 'sm002', 'smith@gmail.com', '9874561230', 'Smith', '9874561230', 'Active', 'Admin', 'Smith'),
   (3, 'saran', 'sa001', 'saran@gmail.com', '8794561230', 'saran', '8794561230' , 'Active','Admin', 'saran'),
   (4, 'maddy', 'md001', 'maddy@gmail.com', ' 7894562310', 'maddy', '7894562310', 'Active',  'Admin','maddy'),
   (5, 'kavi', 'DK001' , 'kavi@gmail.com', '8794561230', 'kavi', '555-1234', 'Active','Admin','kavi'),
   (6, 'sandhosh', 'sn001', 'sandhoshs@gmail.com','9874561230', 'sandhosh', '9874561230', 'Active', 'Admin', 'sandhosh'),
   (7, 'ragu', 'ru001', 'ragu@gmail.com', '8456971230', 'ragu', '8456971230', 'Active', 'Admin', 'ragu'),
   (8, 'das', 'da001', 'das@gamil.com', '8456971230', 'das', ' 8456971230', 'Active', 'Admin',  'das'),
   (9, 'hari', 'ha001', 'hari@gmail.com' , '8456971230', 'hari', '8456971230', 'Active', 'Admin','hari'),
   (10, 'Jackie', ' JB001','jackie@gmail.com', '8456971230', 'Jackie', '8456971230', 'Active',  'Admin',  'Jackie');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    INSERT INTO tb_madhavan_customer_address (customer_id, address_type, address_line1, address_line2, city, state, country, postal_code)
    VALUES
    (1, 'Home', '123 Main St', 'mainroad', 'chennai', 'tamilnadu', 'india', '12345'),
    (1, 'Work', '456 Elm St', 'Suite 100', 'chennai','tamilnadu','india', '12345'),
    (2, 'Home', '234 Broadway', 'northstreet', 'chennai','tamilnadu','india', '12345'),
    (2, 'Work', '567 Market St', 'Suite 200', 'thanjavur', 'tamilnadu','india', '12345'),
    (3, 'Home', '890 Maple Ave', 'northstreet', 'thanjavur', 'tamilnadu','india', '12345'),
    (3, 'work', '789 Oak St', 'northstreet', 'trichy', 'tamilnadu','india', '12345'),
    (4,'home', '1234 Main St', 'mainroad', 'chennai', 'tamilnadu', 'india', '12345'),
    (5,'home', '456 Elm St', 'Suite 100', 'chennai','tamilnadu','india', '12345'),
    (6, 'Home', 'guru St', 'mainroad', 'chennai', 'tamilnadu', 'india', '12345'),
    (7, 'home', 'kandhi St', 'Suite 100', 'chennai','tamilnadu','india', '12345');
    
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
     INSERT INTO  tb_madhavan_customer_order        (customer_id,order_no,order_date,no_of_items,order_sub_total,order_discount,order_total_amount,payment_type,delivery_date,status,created_date,created_by    ,modified_date,modifie_by)
     VALUES
    (1, 'ORD-001', '2023-04-18', 3, 150.00, 10.00, 140.00, 'Credit Card', '2023-04-25', 'Pending', '2023-04-18', 'maddy', '2023-04-18', 'maddy'),
    (2, 'ORD-003', '2023-04-20', 1, 50.00, 5.00, 45.00, 'Cash', '2023-04-27', 'Pending', '2023-04-20', 'vijay', '2023-04-20', 'vijay'),
    (3, 'ORD-004', '2023-04-21', 5, 200.00, 20.00, 180.00, 'Credit Card', '2023-04-28', 'Pending', '2023-04-21', 'arul', '2023-04-21', 'arul'),
    (4, 'ORD-005', '2023-04-22', 4, 175.00, 15.00, 160.00, 'Debit Card', '2023-04-29', 'Pending', '2023-04-22', 'sam', '2023-04-22', 'sam'),
    (5, 'ORD-006', '2023-04-23', 2, 100.00, 5.00, 95.00, 'Cash', '2023-04-30', 'Pending', '2023-04-23', 'Mike', '2023-04-23', 'Mike'),
    (6, 'ORD-007', '2023-04-24', 1, 25.00, 2.50, 22.50, 'Credit Card', '2023-05-01', 'Pending', '2023-04-24', 'ajith', '2023-04-24', 'ajith'),
    (7, 'ORD-008', '2023-04-25', 3, 120.00, 10.00, 110.00, 'Debit Card', '2023-05-02', 'Pending', '2023-04-25', 'arun', '2023-04-25', 'arun'),
    (8, 'ORD-009', '2023-04-26', 2, 80.00, 0.00, 80.00, 'Cash', '2023-05-03', 'Pending', '2023-04-26', 'suriya', '2023-04-26', 'suriya');
    

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    
    INSERT INTO tb_madhavan_customer_order_item (order_id, item_name, item_sku, item_rate, ordered_qty, order_total)
    VALUES 
    (1, 'mobile', 'SKU001', 10000.0, 2, 20000.0),
    (1, 'laptop', 'SKU002', 50000.0, 1,50000.0),
    (2, 'headphones', 'SKU003', 500.0,3,1500),
    (2, 'mobile', 'SKU001', 10000.0,4,40000.0),
    (3, 'laptop', 'SKU002', 50000.0,2,100000.0),
    (4, 'bike', 'SKU004', 100000.0,1,100000.0),
    (5, 'headphones', 'SKU003', 500.0,2,1000.0),
    (6, 'laptop', 'SKU002', 50000.0,3,150000.0),
    (7, 'mobile', 'SKU001', 10000.0,1,1000.0),  
    (8, 'car', 'SKU005', 600000.0,2,1200000.0);
    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 
     SELECT * FROM tb_madhavan_customers;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
	  UPDATE tb_madhavan_customers
     SET STATUS='Deleted',
     modified_date=CURRENT_TIMESTAMP,
     modified_by = 'madhavan'
     WHERE STATUS ='Active' LIMIT 5;
     
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
     SELECT c.id ,c.name,c.code,c.phone,c.contact_person_name,c.contact_person_phone,c.`status`,a.address_type,a.address_line1,a.city,a.state,a.country,a.postal_code
     FROM tb_madhavan_customers c 
     JOIN tb_madhavan_customer_address a  ON a.customer_id= c.id WHERE c.status = 'Active' AND a.address_type= 'Home';	


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

     SELECT b.id,d.item_name,d.item_sku,d.item_rate,d.ordered_qty,d.order_total,b.order_no,b.payment_type,b.order_date,b.delivery_date
     FROM tb_madhavan_customer_order b
     JOIN tb_madhavan_customer_order_item d  ON d.order_id= b.id WHERE b.id LIMIT 7;	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  