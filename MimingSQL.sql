create table WorkCrew
(
    crewName varchar(20) not null,
    dateWorked varchar(10) not null, -- yyyy-mm-dd
    constraint WorkCrewPK primary key (dateWorked)
);

INSERT INTO WorkCrew(crewName, dateWorked) VALUES
('Cool Crew', '2018-12-01'),
('Sad People', '2018-11-02'),
('Fun Squad', '2018-10-03'),
('Trash Makers', '2018-09-04'),
('Frotnite Squad', '2018-08-05'),
('Cartooners', '2018-07-06'),
('Disney Squad', '2018-06-07');

create table Staff
(
    staffID varchar(10) not null,
    staffType varchar(10) not null,
    staffFname varchar(20) not null,
    staffLname varchar(20) not null,
    dateHired varchar(10) not null,
    dateWorked varchar(10) not null,
    constraint StaffPK primary key (staffID),
    constraint StaffWorkCrewFK foreign key (dateWorked) references WorkCrew (dateWorked)
);


INSERT INTO Staff(staffID, staffType, staffFname, staffLname, dateHired, dateWorked) VALUES
('12345', 'HeadChef', 'Joey', 'Pan', '2017-01-04', '2018-12-01'),
('02010', 'HeadChef', 'Nick', 'Pot', '2003-01-02', '2018-12-01'),
('03424', 'SousChef', 'Brock', 'Dune', '2003-03-12', '2018-11-02'),
('44211', 'SousChef', 'Patrick', 'Ong', '2006-02-25', '2018-11-02'),
('42345', 'LineCook', 'Melony', 'Luck', '2003-04-05', '2018-10-03'),
('23514', 'LineCook', 'Jacob', 'Johnson', '2000-02-11', '2018-10-03'),
('23178', 'MaitreD', 'Mickey', 'Mouse', '2001-02-01', '2018-09-04'),
('47630', 'MaitreD', 'Minnie', 'Mouse', '2001-02-01', '2018-09-04'),
('14441', 'WaitStaff', 'Barrack', 'Obama', '2017-06-08', '2018-08-05'),
('67458', 'WaitStaff', 'Michael', 'Jordan', '2017-02-04', '2018-08-05'),
('15741', 'Dishwasher', 'Will', 'Smith', '2001-12-07', '2018-07-06'),
('18311', 'Dishwasher', 'Kylie', 'Jenner', '2017-12-05', '2018-07-06'),
('47287', 'Manager', 'Tim', 'Cook', '2017-12-02', '2018-06-07'),
('59831', 'Manager', 'Mark', 'Zuckerburg', '2017-12-11', '2018-06-07');

create table WorkShift
(
    shiftType varchar(20) not null,
    shiftHours varchar(10) not null,
    staffID varchar(10) not null,
    dateWorked varchar(10) not null,
    constraint WorkShiftPK primary key (staffID),
    constraint WorkShiftStaffFK foreign key (staffID) references Staff (staffID),
    constraint WorkShiftWorkCrewFK foreign key (dateWorked) references WorkCrew (dateWorked)
);

INSERT INTO WorkShift(shiftType, shiftHours, staffID, dateWorked) VALUES
('MORNING', '6am - 2pm', '12345', '2018-12-01'),
('EVENING', '2pm - 10pm', '02010', '2018-12-01'),
('MORNING', '6am - 2pm', '03424', '2018-11-02'),
('EVENING', '2pm - 10pm', '44211', '2018-11-02'),
('MORNING', '6am - 2pm', '42345', '2018-10-03'),
('EVENING', '2pm - 10pm', '23514', '2018-10-03'),
('MORNING', '6am - 2pm', '23178', '2018-09-04'),
('EVENING', '2pm - 10pm', '47630', '2018-09-04'),
('MORNING', '6am - 2pm', '14441', '2018-08-05'),
('EVENING', '2pm - 10pm', '67458', '2018-08-05'),
('MORNING', '6am - 2pm', '15741', '2018-07-06'),
('EVENING', '2pm - 10pm', '18311', '2018-07-06'),
('MORNING', '6am - 2pm', '47287', '2018-06-07'),
('EVENING', '2pm - 10pm', '59831', '2018-06-07');


create table SalariedStaff
(
    staffID varchar(10) not null,
    salary varchar(10) not null,
    healthBenefits varchar(50) not null,
    constraint SalariedStaffPK primary key (staffID),
    constraint SalariedStaffStaffFK foreign key (staffID) references Staff (staffID)
);

INSERT INTO SalariedStaff(staffID, salary, healthBenefits) VALUES
('42345', '60000', 'Health Insurance'),
('23514', '55000', 'Life Insurance'),
('03424', '58731', 'Vision Care'),
('44211', '56458', 'Retirement Plan'),
('12345', '64012', 'Health Insurance'),
('02010', '65123', 'Vision Care'),
('47287', '80000', 'Child Care'),
('59831', '70000', 'Life Insurance');


create table LineCook
(
    staffID varchar(10) not null,
    activeLineCook varchar(10) not null,
    constraint LineCookPK primary key (staffID),
    constraint LineCookSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

INSERT INTO LineCook(staffID, activeLineCook) VALUES
('42345', 'true'),
('23514', 'false');


create table WorkStations
(
    staffID varchar(10) not null,
    workStation varchar(10) not null,
    constraint WorkStationsPK primary key (staffID),
    constraint WorkStationsLineCookFK foreign key (staffID) references LineCook (staffID)
);

INSERT INTO WorkStations(staffID, workStation) VALUES
('42345', 'Butcher'),
('23514', 'Grill Chef');


create table HourlyStaff
(
    staffID varchar(10) not null,
    hoursWorked varchar(10) not null,
    payRate varchar(10) not null,
    constraint HourlyStaffPK primary key (staffID),
    constraint HourlyStaffStaffFK foreign key (staffID) references Staff (staffID)
);

INSERT INTO HourlyStaff(staffID, hoursWorked, payRate) VALUES
('15741', '465', '12.50'),
('18311', '249', '31.75'),
('23178', '800', '32.06'),
('47630', '642', '11.70'),
('14441', '521', '44.50'),
('67458', '210', '27.80');


create table Dishwasher
(
    staffID varchar(10) not null,
    numOfDishesWashed varchar(10) not null,
    constraint DishwasherPK primary key (staffID),
    constraint DishwasherHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

INSERT INTO Dishwasher(staffID, numOfDishesWashed) VALUES
('15741', 'true'),
('18311', 'false');


create table Manager
(
    staffID varchar(10) not null,
    activeManager varchar(10) not null,
    constraint ManagerPK primary key (staffID),
    constraint ManagerSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

INSERT INTO Manager(staffID, activeManager) VALUES
('47287', 'false'),
('59831', 'true');


create table MaitreD
(
    staffID varchar(10) not null,
    numOfPartiesSeated varchar(10) not null,
    constraint MaitreDPK primary key (staffID),
    constraint MaitreDHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

INSERT INTO MaitreD(staffID, numOfPartiesSeated) VALUES
('23178', 'false'),
('47630', 'true');


create table HeadChef
(
    staffID varchar(10) not null,
    activeManager varchar(10) not null,
    constraint HeadChefPK primary key (staffID),
    constraint HeadChefSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

INSERT INTO HeadChef(staffID, activeManager) VALUES
('12345', 'false'),
('02010', 'true');


create table WaitStaff
(
    staffID varchar(10) not null,
    tipEarned varchar(10) not null,
    constraint WaitStaffPK primary key (staffID),
    constraint WaitStaffHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

INSERT INTO WaitStaff(staffID, tipEarned) VALUES
('14441', 'true'),
('67458', 'false');


create table SousChef
(
    staffID varchar(10) not null,
    activeSousChef varchar(10) not null,
    constraint SousChefPK primary key (staffID),
    constraint SousChefHourlyStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

INSERT INTO SousChef(staffID, activeSousChef) VALUES
('03424','true'),
('44211','false');


create table Customer
(
    customerID varchar(10) not null,
    email varchar(30) not null,
    phonenumber varchar(15) not null,
    address varchar(50) not null,
    constraint CustomerPK primary key (customerID)
);

INSERT INTO Customer(customerID, email, phonenumber, address) VALUES
('38921', 'Target@target.com',      '(901)416-2197',    '02 Target St.'),
('19011', 'Google@gmail.com',       '(302)296-3480',    '03 Google St.'),
('59027', 'Facebook@facebook.com',  '(828)766-7320',    '01 Face St.'),
('37853', 'Union@union.com',        '(994)752-6660',    '05 Union St.'),
('03874', 'hello@gmail.com',        '(123)436-4523',    '14 Burger St.'),
('48421', 'cheese@yahoo.com',       '(242)694-4341',    '23 Moutain Ln.'),
('70971', 'Bob@hotmail.com',        '(583)793-4767',    '21 Aloha Avenue'),
('68951', 'Apples@gmail.com',       '(563)784-6521',    '67 Park Avenue'),
('58291', 'JingleBells@yahoo.com',  '(415)683-5324',    '21 Masonic'),
('67301', 'aaronbuck@gmail.com',    '(232)387-0780',    '12345, 25 Pike Street, Miami FL'),
('57831', 'flowjoe@gmail.com',      '(334)613-8819',    '56284, 16 Lakewood Street, Long Beach, CA'),
('69271', 'alexsmith@gmail.com',    '(661)613-4443',    '94133, 45 Ocean Ave., San Francisco, CA'),
('97047', 'kevinhart@gmail.com',    '(236)665-3960',    '62014, Pineapple Lane, Maui, HI');

create table Party
(
    customerID varchar(10) not null,
    partyID varchar(10) not null,
    staffID varchar(10) not null,
    partySize varchar(10) not null,
    constraint PartyPK primary key (partyID),
    constraint PartyCustomerFK foreign key (customerID) references Customer (customerID),
    constraint PartyMaitreDFK foreign key (staffID) references MaitreD (staffID)
);

INSERT INTO Party(customerID, partyID, staffID, partySize) VALUES
('03874', '00001', '23178', '4'),
('70971', '00002', '47630', '8');


create table Recipe
(
    staffID varchar(10) not null,
    recipeID varchar(10) not null,
    recipeName varchar(20) not null,
    dateCreated varchar(10) not null,
    constraint RecipePK primary key (recipeID),
    constraint RecipeHeadChefFK foreign key (staffID) references HeadChef (staffID)
);

INSERT INTO Recipe(staffID, recipeID, recipeName, dateCreated) VALUES
('12345', '17313', 'Chow Ming', '2017-05-10'),
('02010', '46281', 'Mimings Fried Rice', '2015-02-17');


create table Tables
(
    staffID varchar(10) not null,
    tableNumber varchar(10) not null,
    partyID varchar(10) not null,
    constraint TablesPK primary key (staffID, tableNumber),
    constraint TablesWaitStaffFK foreign key (staffID) references WaitStaff (staffID),
    constraint TablesPartyFK foreign key (partyID) references Party (partyID)
);

INSERT INTO Tables(staffID, tableNumber, partyID) VALUES
('14441', '1', '00001'),
('67458', '2', '00002');


create table Ingredients
(
    recipeID varchar(10) not null,
    ingredientName varchar(20) not null,
    constraint IngredientsPK primary key (recipeID),
    constraint IngredientsRecipeFK foreign key (recipeID) references Recipe (recipeID)
);

INSERT INTO Ingredients(recipeID, ingredientName) VALUES
('17313', 'noodles'),
('46281', 'rice');

create table PrivateCustomer
(
    customerID varchar(10) not null,
    lastName varchar(20) not null,
    firstName varchar(20) not null,
    snailMail varchar(50) not null,
    constraint PrivateCustomerPK primary key (customerID),
    constraint PrivateCustomerCustomerFK foreign key (customerID) references Customer (customerID)
);

INSERT INTO PrivateCustomer(customerID, lastName, firstName, snailMail) VALUES
('67301', 'Buck', 'Aaron', '12345, 25 Pike Street, Miami FL'),
('57831', 'Joe', 'Flow', '56284, 16 Lakewood Street, Long Beach, CA'),
('69271', 'Smith', 'Alex', '94133, 45 Ocean Ave., San Francisco, CA'),
('97047', 'Hart', 'Kevin', '62014, Pineapple Lane, Maui, HI');


create table Mentorship
(
    staffID varchar(10) not null,
    mentorID varchar(10) not null,
    mentorStartDate varchar(10) not null,
    mentorEndDate varchar(10) not null,
    constraint MentorshipPK primary key (staffID, mentorID, mentorStartDate),
    constraint MentorshipSousChefMenteeFK foreign key (staffID) references SousChef (staffID),
    constraint MentorshipSousChefMentorFK foreign key (mentorID) references SousChef (staffID)
);

INSERT INTO Mentorship(staffID, mentorID, mentorStartDate, mentorEndDate) VALUES
('03424', '44211', '2001-03-13', '2001-06-20');

create table CorporateCustomer
(
    customerID varchar(10) not null,
    corpName varchar(50) not null,
    orgName varchar(50) not null,
    constraint CorpCustPK primary key (customerID),
    constraint CorpCustCustomerFK foreign key (customerID) references Customer (customerID)
);

INSERT INTO CorporateCustomer(customerID, corpName, orgName) VALUES
('38921', 'Target', 'Targetors'),
('19011', 'Google', 'Google Eats'),
('59027', 'Facebook', 'Facebook Foodies'),
('37853', 'Union', 'Feeling Hungry');


create table MenuItem
(
    itemName varchar(50) not null,
    spiciness varchar(10) not null,
    constraint MenuItemPK primary key (itemName)
);

INSERT INTO MenuItem(itemName, spiciness) VALUES
('Kung Pao Chicken', 'Mild'),
('Mushroom Chicken', 'Piquant'),
('Xo Noodles', 'Hot'),
('Brocolli Beef', 'Tangy'),
('Fried Fish', 'Hot'),
('Fried Rice','Oh My God');


create table Specialty
(
    staffID varchar(10) not null,
    itemName varchar(50) not null,
    dateSpecialized varchar(10) not null,
    constraint SpecialtyPK primary key (staffID, itemName, dateSpecialized),
    constraint SpecialtySousChefFK foreign key (staffID) references SousChef (staffID),
    constraint SpecialtyMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

INSERT INTO Specialty(staffID, itemName, dateSpecialized) VALUES
('03424', 'Kung Pao Chicken', '2015-08-07'),
('44211', 'Brocolli Beef', '2017-10-04');


create table MimingsMoneyAccount
(
    customerID varchar(10) not null,
    MMAccID varchar(10) not null,
    MMSpent varchar(20) not null,
    MMEarnedTotal varchar(20) not null,
    realMoneySpentTotal varchar(20) not null,
    MMleft varchar(20) not null,
    constraint MMAPK primary key (customerID, MMAccID),
    constraint MMACustomerFK foreign key (customerID) references Customer (customerID)
);

INSERT INTO MimingsMoneyAccount(customerID, MMAccID, MMSpent, MMEarnedTotal, realMoneySpentTotal, MMleft) VALUES
('03874', '00000', '371913', '3784193', '78311', '39231'),
('48421', '37814', '4892', '5729', '5832', '907392'),
('70971', '47202', '5789', '65817', '589', '69332'),
('68951', '68921', '689116', '5729', '58211', '5821'),
('58291', '572911', '6832', '68291', '683011', '68392');

create table Menu
(
    menuType varchar(10) not null,
    menuHoursAvailable varchar(50) not null,
    constraint MenuPK primary key (menuType)
);

INSERT INTO Menu(menuType, menuHoursAvailable) VALUES
('Breakfast', '8:00am-11:30am'),
('Lunch', '11:30am-4:30pm'),
('Dinner', '4:30pm-9pm');


create table Orders
(
    orderID varchar(10) not null,
    customerID varchar(10) not null,
    dateOfOrder varchar(10) not null,
    constraint OrdersPK primary key (orderID),
    constraint OrdersCustomerFK foreign key (customerID) references Customer (customerID)
);

INSERT INTO Orders(orderID, customerID, dateOfOrder) VALUES
('46234', '03874', '2017-04-12'),
('50655', '19011', '2017-05-30'),
('59144', '37853', '2017-07-26'),
('42544', '38921', '2017-08-03'),
('65372', '48421', '2017-09-15'),
('52468', '57831', '2017-10-05'),
('23423', '58291', '2018-02-06'),
('17117', '59027', '2018-04-23'),
('36792', '67301', '2018-11-05'),
('65303', '68951', '2018-11-21'),
('80191', '69271', '2017-02-02'),
('76209', '70971', '2017-03-01'),
('44145', '97047', '2017-03-17'),
('84269', '03874', '2017-04-04'),
('70232', '68951', '2017-05-15'),
('02822', '97047', '2017-06-22'),
('63540', '37853', '2018-01-25'),
('77593', '37853', '2018-02-23');

create table Payment
(
    orderID varchar(10) not null,
    paymentType varchar(10) not null,
    amountTotal varchar(10) not null,
    constraint PaymentPK primary key (orderID, paymentType, amountTotal),
    constraint PaymentOrdersFK foreign key (orderID) references Orders (orderID)
);

INSERT INTO Payment(orderID, paymentType, amountTotal) VALUES
('46234', 'Cash', '20'),
('50655', 'Cash', '40'),
('59144', 'Cash', '100'),
('42544', 'Credit', '500'),
('65372', 'Cash', '30'),
('52468', 'Credit', '50'),
('23423', 'Credit', '25'),
('17117', 'Credit', '95'),
('36792', 'Credit', '420'),
('65303', 'Credit', '200'),
('80191', 'Cash', '29'),
('76209', 'Credit', '190'),
('44145', 'Credit', '2000'),
('84269', 'Credit', '29'),
('70232', 'Credit', '25'),
('02822', 'Cash', '100'),
('63540', 'Cash', '120'),
('77593', 'Credit', '245');


create table MenuPricing
(
    menuType varchar(10) not null,
    itemName varchar(50) not null,
    itemPrice varchar(10) not null,
    itemSize varchar(10) not null,
    constraint MenuPricingPK primary key (menuType, itemName, itemSize),
    constraint MenuPricingMenuFK foreign key (menuType) references Menu (menuType),
    constraint MenuPricingMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

INSERT INTO MenuPricing(menuType, itemName, itemPrice, itemSize) VALUES
('Breakfast', 'Kung Pao Chicken', '24.99', 'small'),
('Breakfast', 'Kung Pao Chicken', '29.99', 'medium'),
('Lunch', 'Mushroom Chicken', '13.99', 'medium'),
('Dinner', 'Xo Noodles', '6.99', 'large'),
('Lunch', 'Brocolli Beef', '22.99', 'medium'),
('Dinner', 'Fried Fish', '13.50', 'small'),
('Breakfast', 'Fried Rice', '21.50', 'medium');


create table Discount
(
    discountID varchar(10) not null,
    orderOver200Disc varchar(10) not null,
    orderOver500Disc varchar(10) not null,
    orderOver1000Disc varchar(10) not null,
    constraint DiscountPK primary key (discountID)
);

INSERT INTO Discount(discountID, orderOver200Disc, orderOver500Disc, orderOver1000Disc) VALUES
('41145', '30', '40', '50'),
('75931', '25', '30', '35'),
('58391', '10', '15', '20');


create table OrderDetails
(
    menuType varchar(10) not null,
    itemName varchar(50) not null,
    orderID varchar(10) not null,
    discountID varchar(10) not null,
    quantityOrdered varchar(10) not null,
    priceEach varchar(10) not null,
    constraint OrderDetails primary key (menuType, itemName, orderID),
    constraint ODMPtypeFK foreign key (menuType) references Menu (menuType),
    constraint ODMPnameFK foreign key (itemName) references MenuItem (itemName),
    constraint OrderDetailsOrdersFK foreign key (orderID) references Orders (orderID),
    constraint OrderDetailsDiscountFK foreign key (discountID) references Discount (discountID)
);

INSERT INTO OrderDetails(menuType, itemName, orderID, discountID, quantityOrdered, priceEach) VALUES
('Breakfast','Kung Pao Chicken',    '46234', '41145', '4', '24.99'),
('Lunch', 'Mushroom Chicken',       '50655', '75931', '8', '13.99'),
('Dinner', 'Xo Noodles',            '59144', '58391', '3', '6.99'),
('Lunch', 'Brocolli Beef',          '42544', '75931', '2', '22.99'),
('Dinner', 'Fried Fish',            '65372', '41145', '4', '13.50'),
('Breakfast', 'Fried Rice',         '52468', '75931', '2', '21.50'),
('Dinner', 'Xo Noodles',            '23423', '58391', '4', '6.99'),
('Lunch', 'Mushroom Chicken',       '17117', '41145', '5', '13.99'),
('Dinner', 'Xo Noodles',            '36792', '75931', '4', '6.99'),
('Breakfast', 'Kung Pao Chicken',   '65303', '58391', '3', '29.99'),
('Lunch', 'Brocolli Beef',          '80191', '41145', '5', '22.99'),
('Lunch', 'Brocolli Beef',          '76209', '41145', '1', '22.99'),
('Lunch', 'Mushroom Chicken',       '44145', '75931', '2', '13.99'),
('Dinner', 'Xo Noodles',            '84269', '41145', '4', '6.99'),
('Lunch', 'Mushroom Chicken',       '70232', '58391', '3', '13.99'),
('Dinner', 'Fried Fish',            '02822', '58391', '2', '13.50'),
('Breakfast', 'Fried Rice',         '63540', '41145', '3', '21.50'),
('Lunch', 'Brocolli Beef',          '77593', '75931', '1', '22.99');

create table Categories
(
    itemName varchar(50) not null,
    category varchar(50) not null,
    constraint CategoriesPK primary key (itemName, category),
    constraint CategoriesMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

INSERT INTO Categories(itemName, category) VALUES
('Kung Pao Chicken', 'Meat Entrees'),
('Mushroom Chicken', 'Meat Entrees'),
('Xo Noodles', 'Chow Mein'),
('Brocolli Beef', 'Meat Entrees'),
('Fried Fish', 'Appetizer'),
('Fried Rice', 'Meat Entrees');


create table ToGo
(
    orderID varchar(10) not null,
    timeFoodIsReady varchar(10) not null,
    constraint ToGoPK primary key (orderID),
    constraint ToGoOrdersFK foreign key (orderID) references Orders (orderId)
);

INSERT INTO ToGo(orderID, timeFoodIsReady) VALUES 
('65303', '14:45:59'),
('76209', '13:00:32');


create table EatIn
(
    orderID varchar(10) not null,
    tablePreference varchar(10) not null,
    constraint EatInPK primary key (orderID),
    constraint EatInOrdersFK foreign key (orderID) references Orders (orderId)
);

INSERT INTO EatIn(orderID, tablePreference) VALUES 
('52468', '1'),
('23423', '4');


create table Web
(
    orderID varchar(10) not null,
    creditCardInfo varchar(50) not null,
    promoCodeEntered varchar(10) not null,
    constraint WebPK primary key (orderID),
    constraint WebOrdersFK foreign key (orderID) references Orders (orderId)
);

INSERT INTO Web(orderID, creditCardInfo, promoCodeEntered) VALUES
('46234', '472957201', '231');