Problem Statement 

An E-commerce website manages its data in the form of various tables.

1)	You are required to create tables for supplier,customer,category,product,productDetails,order,rating to store the data for the E-commerce with the schema definition given below.

  Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
  Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
  Category(CAT_ID,CAT_NAME)
  Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
  ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
	Order(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
	Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)


2)	Insert the following data in the table created above
  	 
  Supplier Table-

  SUPP_ID	SUPP_NAME		SUPP_CITY	SUPP_PHONE
  1		Rajesh Retails		Delhi		1234567890
  2		Appario Ltd.		Mumbai	2589631470
  3		Knome products	Banglore	9785462315
  4		Bansal Retails		Kochi		8975463285
  5		Mittal Ltd.		Lucknow	7898456532


  Customer Table-

  CUS_ID	CUS_NAME	CUS_PHONE	CUS_CITY	CUS_GENDER
  1		AAKASH	9999999999	DELHI		M
  2		AMAN		9785463215	NOIDA		M
  3		NEHA		9999999999	MUMBAI	F
  4		MEGHA	9994562399	KOLKATA	F
  5		PULKIT	7895999999	LUCKNOW	M


  Category Table-
	
  CAT_ID		CAT_NAME
  1		BOOKS
  2		GAMES
  3		GROCERIES
  4		ELECTRONICS
  5		CLOTHES


  Product Table-

  PRO_ID	PRO_NAME		PRO_DESC			CAT_ID
  1		GTA V			DFJDJFDJFDJFDJFJF		2
  2		TSHIRT		DFDFJDFJDKFD		5
  3		ROG LAPTOP		DFNTTNTNTERND		4
  4		OATS			REURENTBTOTH		3
  5		HARRY POTTER	NBEMCTHTJTH		1



  Prodcut_Details Table-

  PROD_ID	PRO_ID	SUPP_ID	PROD_PRICE
  1		1			2	1500
  2		3			5	30000
  3		5			1	3000
  4		2			3	2500
  5		4			1	1000


  Order Table-

  ORD_ID		ORD_AMOUNT	ORD_DATE	CUS_ID	PROD_ID
  20		1500		2021-10-12	3	5
  25		30500		2021-09-16	5	2
  26		2000		2021-10-05	1	1
  30		3500		2021-08-16	4	3
  50		2000		2021-10-06	2	1


  Rating table-

  RAT_ID		CUS_ID	SUPP_ID	RAT_RATSTARS
  1				2		2		4
  2				3		4		3
  3				5		1		5
  4				1		3		2
  5				4		5		4


QUERIES:

Write queries for the following:

3)	Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.
4)	Display all the orders along with the product name ordered by a customer having Customer_Id=2.
5)	Display the Supplier details who can supply more than one product.
6)	Find the category of the product whose order amount is minimum.
7)	Display the Id and Name of the Product ordered after “2021-10-05”.
8)	Display customer name and gender whose names start or end with character 'A'.
9)	Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
