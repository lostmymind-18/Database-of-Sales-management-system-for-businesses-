
USE customer_management;
/*Member 1*/
/*Question 1*/
/*Query 1: Select information of every managers of Shopee company in alphabetical order*/
SELECT employee.CMND, employee.NAME, employee.PHONE, employee.HIREDATE, employee.EMAIL, employee.SEX, employee.BIRTHDATE, employee.BRANCH_ID
FROM company, branch, employee
WHERE branch.COMPANY_ID = company.COMPANY_ID AND 
	  company.COMPANY_NAME='Shopee' AND
	  branch.MANAGER_ID=employee.CMND
ORDER BY employee.NAME;
/*Query 2: Select all kinds of Shopee's product*/
SELECT product_service.PRODUCT_SERVICE_ID, product_service.NAME
FROM product_service, company
WHERE product_service.COMPANY_ID = company.COMPANY_ID
ORDER BY product_service.NAME;
/*Query 3: Select companies having at least 3 branches*/
SELECT company.COMPANY_ID, company.COMPANY_NAME
FROM company, branch
WHERE branch.COMPANY_ID = company.COMPANY_ID
GROUP BY branch.COMPANY_ID
HAVING	COUNT(branch.BRANCH_ID) > 1
ORDER BY company.COMPANY_ID;
/*Query 4: Select branches having 50 employees or more*/
SELECT branch.BRANCH_ID, company.COMPANY_NAME 
FROM company,branch,employee
WHERE employee.BRANCH_ID = branch.BRANCH_ID AND branch.COMPANY_ID = company.COMPANY_ID
GROUP BY employee.BRANCH_ID
HAVING COUNT(employee.CMND) > 1 
ORDER BY branch.BRANCH_ID;
/*Question 2*/
/*Procedure 1: Get all the companies*/
DELIMITER $$
CREATE PROCEDURE GetAllCompany()
BEGIN
	SELECT* FROM company;
END $$
/*Procedure 2: Get all branches of detemined company*/
DELIMITER $$
CREATE PROCEDURE GetBranch(IN companyName VARCHAR(100))
BEGIN
	SELECT branch.BRANCH_ID, branch.MANAGER_ID 
    FROM company,branch
    WHERE company.COMPANY_ID = branch.COMPANY_ID AND company.COMPANY_NAME = companyName;
END $$
/*Trigger 1: Keep track on INSERT action on 'loyalty_card_use' table leading to changes in 'loyalty_card' table*/
DELIMITER $$

CREATE TRIGGER increasePoint 
AFTER INSERT ON loyalty_card_use FOR EACH ROW 
BEGIN
	IF(EXISTS(SELECT * FROM loyalty_card WHERE loyalty_card.CUSTOMER_ID = NEW.CUSTOMER_ID)) THEN
		UPDATE loyalty_card
		SET POINT = POINT+1
        WHERE CUSTOMER_ID = NEW.CUSTOMER_ID;
	ELSE
		INSERT INTO loyalty_card(EXPIRE_DAY, POINT, CUSTOMER_ID)
		VALUES(now() + INTERVAL 1 YEAR, 1, NEW.CUSTOMER_ID);
	END IF;
END $$;
/*Trigger 2: Keep track on DELETE action on 'employee' table leading to changes in employee_account table*/ 
DELIMITER $$
CREATE TRIGGER deleteEmployee 
BEFORE DELETE ON employee FOR EACH ROW
BEGIN
	DELETE FROM employee_account
    WHERE employee_account.CMND = OLD.CMND;
END $$
/*The solution replaced for 'FOR' or 'INSTEAD OF' triggers isn't found yet*/
/*Function: Calculate the cost of a bill*/
DELIMITER $$
CREATE FUNCTION billCost(billID INT)
RETURNS INT 
READS SQL DATA
BEGIN
	DECLARE cost INT DEFAULT 0;
	IF(EXISTS(SELECT*FROM bill WHERE bill.billID = billID)) THEN
    SET cost = (SELECT SUM(product_service.PRICE)
				FROM product_service, transaction, bill
                WHERE transaction.ID = bill.ID AND transaction.PRODUCT_SERVICE_ID = product_service.PRODUCT_SERVICE_ID);
	END IF;
	RETURN cost;
END $$
/*MEMBER 2*/
/*Query 1: Select information of all Lazada's employees accounts*/
SELECT employee_account.ACCOUNT_ID, employee_account.USERNAME, employee_account.PASSWORD
FROM employee_account, company, branch
WHERE employee_account.COMPANY_ID = company.COMPANY_ID
ORDER BY employee_account.ACCOUNT_ID;
/*Query 2: Select information of all EMPLOYEES of Lazada*/
SELECT employee.CMND, employee.NAME, employee.PHONE, employee.HIREDATE, employee.EMAIL, employee.SEX, employee.BIRTHDATE, employee.BRANCH_ID
FROM company, branch, employee
WHERE branch.COMPANY_ID = company.COMPANY_ID AND 
	  employee.BRANCH_ID = branch.BRANCH_ID
ORDER BY employee.HIREDATE;
/*Query 3: Show companies having 10 employees or more*/
CREATE OR REPLACE VIEW countEmployeeBranch AS
SELECT branch.BRANCH_ID,branch.COMPANY_ID ,count(employee.CMND) numEmployees
FROM company, branch, employee
WHERE employee.BRANCH_ID = branch.BRANCH_ID
GROUP BY branch.BRANCH_ID;
SELECT* FROM countEmployeeBranch;

CREATE OR REPLACE VIEW countEmployeeCompany AS
SELECT company.COMPANY_ID,company.COMPANY_NAME , SUM(countEmployeeBranch.numEmployees) numEmployees
FROM company, countEmployeeBranch
WHERE company.COMPANY_ID = countEmployeeBranch.COMPANY_ID
GROUP BY company.COMPANY_ID
HAVING SUM(countEmployeeBranch.numEmployees) > 10
ORDER BY numEmployees DESC;
SELECT *  FROM countEmployeeCompany;

/*Query 4: Show companies that have everage price of products or services above 10 in DESC order*/
CREATE OR REPLACE VIEW avgPriceCompany AS
SELECT company.COMPANY_NAME, AVG(product_service.PRICE) avgPrice
FROM company, product_service
WHERE company.COMPANY_ID = product_service.COMPANY_ID
GROUP BY company.COMPANY_ID
HAVING AVG(product_service.PRICE) > 10
ORDER BY avgPrice DESC;
SELECT *  FROM avgPriceCompany;

/*Procedure 1: Get all employees of detemined branch*/
DELIMITER $$
CREATE PROCEDURE GetEmployee(IN branchID INT)
BEGIN
	SELECT CMND, NAME, PHONE
    FROM branch, employee
    WHERE branch.BRANCH_ID = employee.COMPANY_ID;
END $$

/*Procedure 2: Get all report a product/service of a company*/
DELIMITER $$
CREATE PROCEDURE GetReport(IN companyID INT, productID INT)
BEGIN
	SELECT report.PERIODIC, report.REPORT_TYPE, report.CONTENT 
    FROM report, product_service
    WHERE product_service.COMPANY_ID = companyID AND report.product_service_id = productID;
END $$

/*Trigger 1: Keep track on DELETE action on 'company' table that lead to changes in 'company_email' table
			'company_phone' table*/
DELIMITER $$

CREATE TRIGGER deleteCompany 
AFTER DELETE ON company FOR EACH ROW 
BEGIN
	DELETE FROM company_email WHERE company_email.COMPANY_ID = OLD.COMPANY_ID;
    DELETE FROM company_phone WHERE company_phone.COMPANY_ID = OLD.COMPANY_ID;
END $$;
/*Trigger 2: Keep track on UPDATE action on 'product_service' that leads to changes in 'changePrice'*/ 
CREATE OR REPLACE TABLE change_price (
    CHANGE_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_SERVICE_ID INT NOT NULL,
    OLD_PRICE INT,
    NEW_PRICE INT,
    CHANGE_TIME TIME NOT NULL,
    ACTION_ VARCHAR(20) NOT NULL
);
DELIMITER $$
CREATE TRIGGER updateProductService 
AFTER UPDATE ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = OLD.PRICE,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = OLD.PRODUCT_SERVICE_ID,
        ACTION_ = 'Update';
END $$
/*Trigger 3: Keep track on INSERT action on 'product_service' that leads changes in 'changePrice'*/
DELIMITER $$
CREATE TRIGGER insertProductService 
AFTER INSERT ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = NULL,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = NEW.PRODUCT_SERVICE_ID,
        ACTION_ = 'Insert';
END $$
/*Function: Calculate the cost of a bill*/
DELIMITER $$
CREATE FUNCTION numberComment(companyID INT)
RETURNS INT 
READS SQL DATA
BEGIN
	DECLARE total INT DEFAULT 0;
	IF(EXISTS(SELECT*FROM company WHERE company.COMPANY_ID = companyID)) THEN
    SET total = (SELECT COUNT(product_service.COMPANY_ID)
				FROM product_service, report
                WHERE report.PRODUCT_SERVICE_ID = product_service.PRODUCT_SERVICE_ID
                AND product_service.COMPANY_ID = companyID
                );
	END IF;
	RETURN total;
END $$
/*member 3/*
/*1a select khách hàng >104 */

select * from take_care 
where CUSTOMER_ID>104
order by EMPLOYEE_ID; 

/* select bill>25*/
select * from bill
where price> 25.0
order by TRANSACTION_ID;

/*cau 1b select table having number of gift >1*/
select *,count(gift.value) 
from gift,promotion
where gift.PROMOTION_ID= promotion.PROMOTION_ID
group by gift.PROMOTION_ID
having count(gift.value)>1
order by promotion.START_TIME; 

/*select promotion having coupon<1.6*/
select *,avg(coupon.discount)
from coupon,promotion
where coupon.PROMOTION_ID= promotion.PROMOTION_ID
group by coupon.PROMOTION_ID
having avg(coupon.DISCOUNT)<1.6
order by promotion.END_TIME; 
/*------------------------------------------------------------*/
/*member 4*/
select * from loyalty_card_use
where product_service_id>20
order by START_TIME;

select * from report 
where PRODUCT_SERVICE_ID>21
order by periodic;

/*cong ty co so tai khoan nhan vien >2 */
select * ,count(employee_account.account_id)
from
company_account,employee_account
where company_account.ACCOUNT_ID= employee_account.company_id
group by employee_account.company_id
having count(employee_account.account_id)>2
order by employee_account.USERNAME;

/*transaction co bill <80*/
select *,sum(bill.price)
from transaction,bill
where bill.TRANSACTION_ID=TRANSACTION.TRANSACTION_ID
group by transaction.TRANSACTION_ID
having sum(bill.price)<80.0
order by transaction.CUSTOMER_ID;

/*---------------------------------------------------------------*/
/*cau 2*/
DELIMITER $$
CREATE PROCEDURE show_branch(IN company_id INT)
BEGIN
    select branch.BRANCH_ID
    from branch
    WHERE branch.COMPANY_ID=company_id;
END$$

/*cau 3*/
/*Trigger 1: Keep track on DELETE action on 'company' table that lead to changes in 'company_email' table
			'company_phone' table*/
DELIMITER $$

CREATE TRIGGER deleteCompany 
AFTER DELETE ON company FOR EACH ROW 
BEGIN
	DELETE FROM company_email WHERE company_email.COMPANY_ID = OLD.COMPANY_ID;
    DELETE FROM company_phone WHERE company_phone.COMPANY_ID = OLD.COMPANY_ID;
END $$;
/*Trigger 2: Keep track on UPDATE action on 'product_service' that leads to changes in 'changePrice'*/ 
CREATE OR REPLACE TABLE change_price (
    CHANGE_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_SERVICE_ID INT NOT NULL,
    OLD_PRICE INT,
    NEW_PRICE INT,
    CHANGE_TIME TIME NOT NULL,
    ACTION_ VARCHAR(20) NOT NULL
);
DELIMITER $$
CREATE TRIGGER updateProductService 
AFTER UPDATE ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = OLD.PRICE,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = OLD.PRODUCT_SERVICE_ID,
        ACTION_ = 'Update';
END $$
/*Trigger 3: Keep track on INSERT action on 'product_service' that leads changes in 'changePrice'*/
DELIMITER $$
CREATE TRIGGER insertProductService 
AFTER INSERT ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = NULL,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = NEW.PRODUCT_SERVICE_ID,
        ACTION_ = 'Insert';
END $$

DELIMITER $$
CREATE PROCEDURE show_report()
begin 
	select *
    from report;
end$$

/*4 tong tai khoan trong 1 cty*/
delimiter $$
create function SumEmployee(num int)
returns int
reads sql data
begin
 declare coun integer default 0 ;
 IF (num<50 and num>59) THEN
 return coun;
 else
 select count(employee_account.COMPANY_ID) into coun
from employee_account
where employee_account.COMPANY_ID=num;
 return coun;
 end if;
 
end$$
/*---------------------------------------------------------------*/
/*cau 2*/
DELIMITER $$
CREATE PROCEDURE show_employee()
begin 
	select *
    from employee;
end$$

DELIMITER $$
CREATE PROCEDURE showgift(IN promotion INT)
BEGIN
    select gift.value
    from gift
    WHERE gift.promotion_id=promotion;
END$$

/*cau 3*/
/*Trigger 1: Keep track on DELETE action on 'company' table that lead to changes in 'company_email' table
			'company_phone' table*/
DELIMITER $$

CREATE TRIGGER deleteCompany 
AFTER DELETE ON company FOR EACH ROW 
BEGIN
	DELETE FROM company_email WHERE company_email.COMPANY_ID = OLD.COMPANY_ID;
    DELETE FROM company_phone WHERE company_phone.COMPANY_ID = OLD.COMPANY_ID;
END $$;
/*Trigger 2: Keep track on UPDATE action on 'product_service' that leads to changes in 'changePrice'*/ 
CREATE OR REPLACE TABLE change_price (
    CHANGE_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_SERVICE_ID INT NOT NULL,
    OLD_PRICE INT,
    NEW_PRICE INT,
    CHANGE_TIME TIME NOT NULL,
    ACTION_ VARCHAR(20) NOT NULL
);
DELIMITER $$
CREATE TRIGGER updateProductService 
AFTER UPDATE ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = OLD.PRICE,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = OLD.PRODUCT_SERVICE_ID,
        ACTION_ = 'Update';
END $$
/*Trigger 3: Keep track on INSERT action on 'product_service' that leads changes in 'changePrice'*/
DELIMITER $$
CREATE TRIGGER insertProductService 
AFTER INSERT ON product_service FOR EACH ROW
BEGIN
	INSERT INTO change_price
    SET OLD_PRICE = NULL,
		NEW_PRICE = NEW.PRICE,
        CHANGE_TIME = NOW(),
        PRODUCT_SERVICE_ID = NEW.PRODUCT_SERVICE_ID,
        ACTION_ = 'Insert';
END $$
/*--------------------------*/


CREATE OR REPLACE TABLE change_Employee (
    CHANGE_ID INT AUTO_INCREMENT PRIMARY KEY,
    CMND INT NOT NULL,
    EMPLOYEE_NAME VARCHAR(50),
    CHANGE_TIME TIME NOT NULL,
    ACTION_ VARCHAR(20) NOT NULL
);
DELIMITER $$
/*Trigger 1: Keep track on DELETE action on 'Employee' that leads changes in 'change_Employee'*/
CREATE TRIGGER deleteEmployee 
AFTER DELETE ON EMPLOYEE FOR EACH ROW
BEGIN
	INSERT INTO change_Employee
    SET CMND = OLD.CMND,
		EMPLOYEE_NAME = OLD.NAME,
        CHANGE_TIME = NOW(),
        ACTION_ = 'Delete';
END $$
/*Trigger 2: Keep track on INSERT action on 'EMPLOYEE' that leads changes in 'change_Employee'*/
DELIMITER $$
CREATE TRIGGER insertEmployee
BEFORE INSERT ON EMPLOYEE FOR EACH ROW
BEGIN
	INSERT INTO change_Employee
    SET CMND = NEW.CMND,
		EMPLOYEE_NAME = NEW.NAME,
        CHANGE_TIME = NOW(),
        ACTION_ = 'Insert';
END $$

/*Trigger 3: Keep track on UPDATE action on 'EMPLOYEE_ACCOUNT' that leads changes in 'TAKE_CARE' */
CREATE TRIGGER updateEmployeeAcount
BEFORE INSERT ON EMPLOYEE_ACCOUNT FOR EACH ROW
BEGIN
	IF(NEW.ACCOUNT_ID != OLD.ACCOUNT_ID) THEN
	UPDATE TAKE_CARE
    SET EMPLOYEE_ID = NEW.ACCOUNT_ID
    WHERE EMPLOYEE_ID = OLD.ACCOUNT_ID;
	END IF;
END $$
/*----------------------------------------*/
/*Trigger 1: Keep track on DELETE action on 'CUSTOMER' that leads changes in 'LOYALTY_CARD'*/
CREATE TRIGGER deleteCUSTOMER
AFTER DELETE ON CUSTOMER FOR EACH ROW
BEGIN
	DELETE FROM LOYALTY_CARD
    WHERE CUSTOMER_ID = OLD.CUSTOMER_ID;
END $$

/*Trigger 2: Keep tracks on INSERT action on 'BILL' */
CREATE TABLE change_BILL (
    ID integer not null,
    PRICE float,
    CATEGORY varchar(50),
    TRANSACTION_ID integer not null,
    TIME datetime,
    change_time time,
    action varchar(50)
    );
    
delimiter $$
create trigger insertBill
after insert on BILL for each row
begin
	insert into change_bill
    set ID =new.ID,
    price=new.price,
    category=new.category,
	transaction_id=new.transaction_id,
    change_time=now(),
    action='insert';
end$$

/*chang category and price on bill*/
delimiter $$
create trigger UpdateBill
after update on BILL for each row
begin
	insert into change_bill
    set ID =OLD.ID,
    price=new.price,
    category=new.category,
	transaction_id=old.transaction_id,
    change_time=now(),
    action='update';
end$$

/*cau 4*/
delimiter $$
create function SumCustomerPerEmployee(numEmployee int)
returns int
reads sql data
begin
 declare coun integer default 0 ;
 IF (numEmployee<60 and numEmployee>69) THEN
 return coun;
 else
 select count(take_care.CUSTOMER_ID) into coun
from take_care
where take_care.employee_id=numEmployee;
 return coun;
 end if;
 
end$$
 drop function SumCustomerPerEmployee;

select SumCustomerPerEmployee(58);













    
    



