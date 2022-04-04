#1) Creating DB and tables

Create Database if not exists `order-directory`;

use `order-directory`;

create table if not exists `supplier`(
`SUPP_ID` int primary key,
`SUPP_NAME` varchar(50),
`SUPP_CITY` varchar(50),
`SUPP_PHONE` varchar(10)
);

CREATE TABLE IF NOT EXISTS `customer` (
`CUS_ID` INT NOT NULL,
`CUS_NAME` VARCHAR(20) NULL DEFAULT NULL,
`CUS_PHONE` VARCHAR(10),
`CUS_CITY` varchar(30),
`CUS_GENDER` CHAR,
PRIMARY KEY (`CUS_ID`)
);

CREATE TABLE IF NOT EXISTS `category` (
`CAT_ID` INT NOT NULL,
`CAT_NAME` VARCHAR(20) NULL DEFAULT NULL,
PRIMARY KEY (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `product` (
`PRO_ID` INT NOT NULL,
`PRO_NAME` VARCHAR(20) NULL DEFAULT NULL,
`PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
`CAT_ID` INT NOT NULL,
PRIMARY KEY (`PRO_ID`),
FOREIGN KEY (`CAT_ID`) REFERENCES CATEGORY (`CAT_ID`)
);

CREATE TABLE IF NOT EXISTS `product_details` (
`PROD_ID` INT NOT NULL,
`PRO_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`PROD_PRICE` INT NOT NULL,
PRIMARY KEY (`PROD_ID`),
FOREIGN KEY (`PRO_ID`) REFERENCES PRODUCT (`PRO_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES SUPPLIER(`SUPP_ID`)
);

CREATE TABLE IF NOT EXISTS `order` (
`ORD_ID` INT NOT NULL,
`ORD_AMOUNT` INT NOT NULL,
`ORD_DATE` DATE,
`CUS_ID` INT NOT NULL,
`PROD_ID` INT NOT NULL,
PRIMARY KEY (`ORD_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES CUSTOMER(`CUS_ID`),
FOREIGN KEY (`PROD_ID`) REFERENCES PRODUCT_DETAILS(`PROD_ID`)
);

CREATE TABLE IF NOT EXISTS `rating` (
`RAT_ID` INT NOT NULL,
`CUS_ID` INT NOT NULL,
`SUPP_ID` INT NOT NULL,
`RAT_RATSTARS` INT NOT NULL,
PRIMARY KEY (`RAT_ID`),
FOREIGN KEY (`SUPP_ID`) REFERENCES SUPPLIER (`SUPP_ID`),
FOREIGN KEY (`CUS_ID`) REFERENCES CUSTOMER(`CUS_ID`)
);


#2)Inserting values into the tables

insert into `supplier` values(1, "Rajesh Retails", "Delhi", '1234567890');
insert into `supplier` values(2, "Appario Ltd.", "Mumbai", '2589631470');
insert into `supplier` values(3, "Knome products", "Banglore", '9785462315');
insert into `supplier` values(4, "Bansal Retails", "Kochi", '8975463285');
insert into `supplier` values(5, "Mittal Ltd.", "Lucknow", '7898456532');

INSERT INTO `CUSTOMER` VALUES(1, "AAKASH", '9999999999', "DELHI", 'M');
INSERT INTO `CUSTOMER` VALUES(2, "AMAN", '9785463215', "NOIDA", 'M');
INSERT INTO `CUSTOMER` VALUES(3, "NEHA", '9999999999', "MUMBAI", 'F');
INSERT INTO `CUSTOMER` VALUES(4, "MEGHA", '9994562399', "KOLKATA", 'F');
INSERT INTO `CUSTOMER` VALUES(5, "PULKIT", '7895999999', "LUCKNOW", 'M');

INSERT INTO `CATEGORY` VALUES( 1, "BOOKS"); 
INSERT INTO `CATEGORY` VALUES(2,"GAMES"); 
INSERT INTO `CATEGORY` VALUES(3,"GROCERIES"); 
INSERT INTO `CATEGORY` VALUES (4,"ELECTRONICS"); 
INSERT INTO `CATEGORY` VALUES(5,"CLOTHES"); 

INSERT INTO `PRODUCT` VALUES(1, "GTA V", 'DFJDJFDJFDJFDJFJF', 2);
INSERT INTO `PRODUCT` VALUES(2, "TSHIRT", 'DFDFJDFJDKFD', 5);
INSERT INTO `PRODUCT` VALUES(3, "ROG LAPTOP", 'DFNTTNTNTERND', 4);
INSERT INTO `PRODUCT` VALUES(4, "OATS", 'REURENTBTOTH', 3);
INSERT INTO `PRODUCT` VALUES(5, "HARRY POTTER", 'NBEMCTHTJTH', 1);

INSERT INTO PRODUCT_DETAILS VALUES(1, 1, 2, 1500);
INSERT INTO PRODUCT_DETAILS VALUES(2, 3, 5, 30000);
INSERT INTO PRODUCT_DETAILS VALUES(3, 5, 1, 3000);
INSERT INTO PRODUCT_DETAILS VALUES(4, 2, 3, 2500);
INSERT INTO PRODUCT_DETAILS VALUES(5, 4, 1, 1000);

INSERT INTO `ORDER` VALUES (50, 2000, "2021-10-06", 2, 1);
INSERT INTO `ORDER` VALUES(20, 1500, "2021-10-12", 3, 5);
INSERT INTO `ORDER` VALUES(25, 30500, "2021-09-16", 5, 2);
INSERT INTO `ORDER` VALUES(26, 2000, "2021-10-05", 1, 1);
INSERT INTO `ORDER` VALUES(30, 3500, "2021-08-16", 4, 3);

INSERT INTO `RATING` VALUES(1, 2, 2, 4);
INSERT INTO `RATING` VALUES(2, 3, 4, 3);
INSERT INTO `RATING` VALUES(3, 5, 1, 5);
INSERT INTO `RATING` VALUES(4, 1, 3, 2);
INSERT INTO `RATING` VALUES(5, 4, 5, 4);

#3) 
select customer.CUS_GENDER, count(customer.CUS_ID) AS count from 
	customer INNER JOIN `ORDER` ON customer.CUS_ID = `order`.CUS_ID where `order`.ord_amount >= 3000 GROUP BY customer.CUS_GENDER;
    
#4)
select `order`.*, product.PRO_NAME from `order`, product_details, product where `order`.CUS_ID = 2 and
	`order`.prod_ID = product_details.prod_ID and product_details.PRO_ID = product.PRO_ID;
    
#5) 
select supplier.* from supplier, product_details where supplier.SUPP_ID IN 
(select product_details.SUPP_ID from product_details group by product_details.SUPP_ID having COUNT(product_details.SUPP_ID)>1)
group by supplier.SUPP_ID;

#6)
select category.* from `order` INNER JOIN product_details on 
`order`.prod_id = product_details.prod_id inner join product on 
product.pro_id = product_details.pro_id inner join category on
category.cat_id = product.cat_id having min(`order`.ord_amount);

#7)
select product.pro_id, product.pro_name from `order` inner join product_details on
`order`.prod_id = product_details.prod_id inner join product on 
product.pro_id = product_details.pro_id where `order`.ord_date > "2021-10-05";

#8)
select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A'; 

#9)
DELIMITER $$
use `order-directory`; $$
CREATE PROCEDURE proc_1()
BEGIN

select supplier.SUPP_ID, supplier.SUPP_NAME, rating.RAT_RATSTARS,
CASE
WHEN rating.RAT_RATSTARS > 4 THEN "Genuine Supplier"
WHEN rating.RAT_RATSTARS > 2 THEN "Average Supplier"
ELSE "Supplier not to be considered"
END 
AS Verdict FROM rating inner join supplier on supplier.SUPP_ID = rating.SUPP_ID;

END $$

call proc_1;