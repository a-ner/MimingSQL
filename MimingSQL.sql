create table WorkCrew
(
    dateWorked varchar(10) not null, -- yyyy-mm-dd
    constraint WorkCrewPK primary key (dateWorked)
);

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

create table WorkShift
(
    shiftType varchar(20) not null,
    shiftHours varchar(10) not null,
    staffID varchar(10) not null,
    dateWorked varchar(10) not null,
    constraint WorkShiftPK primary key (shiftType, shiftHours),
    constraint WorkShiftStaffFK foreign key (staffID) references Staff (staffID),
    constraint WorkShiftWorkCrewFK foreign key (dateWorked) references WorkCrew (dateWorked)
);

create table SalariedStaff
(
    staffID varchar(10) not null,
    salary varchar(10) not null,
    healthBenefits varchar(10) not null,
    constraint SalariedStaffPK primary key (staffID),
    constraint SalariedStaffStaffFK foreign key (staffID) references Staff (staffID)
);

create table LineCook
(
    staffID varchar(10) not null,
    activeLineCook varchar(10) not null,
    constraint LineCookPK primary key (staffID),
    constraint LineCookSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

create table WorkStations
(
    staffID varchar(10) not null,
    workStation varchar(10) not null,
    constraint WorkStationsPK primary key (staffID),
    constraint WorkStationsLineCookFK foreign key (staffID) references LineCook (staffID)
);

create table HourlyStaff
(
    staffID varchar(10) not null,
    hoursWorked varchar(10) not null,
    payRate varchar(10) not null,
    constraint HourlyStaffPK primary key (staffID),
    constraint HourlyStaffStaffFK foreign key (staffID) references Staff (staffID)
);

create table Dishwasher
(
    staffID varchar(10) not null,
    numOfDishesWashed varchar(10) not null,
    constraint DishwasherPK primary key (staffID),
    constraint DishwasherHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

create table Manager
(
    staffID varchar(10) not null,
    activeManager varchar(10) not null,
    constraint ManagerPK primary key (staffID),
    constraint ManagerSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

create table MaitreD
(
    staffID varchar(10) not null,
    numOfPartiesSeated varchar(10) not null,
    constraint MaitreDPK primary key (staffID),
    constraint MaitreDHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

create table HeadChef
(
    staffID varchar(10) not null,
    activeManager varchar(10) not null,
    constraint HeadChefPK primary key (staffID),
    constraint HeadChefSalariedStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

create table WaitStaff
(
    staffID varchar(10) not null,
    tipEarned varchar(10) not null,
    constraint WaitStaffPK primary key (staffID),
    constraint WaitStaffHourlyStaffFK foreign key (staffID) references HourlyStaff (staffID)
);

create table SousChef
(
    staffID varchar(10) not null,
    activeSousChef varchar(10) not null,
    constraint SousChefPK primary key (staffID),
    constraint SousChefHourlyStaffFK foreign key (staffID) references SalariedStaff (staffID)
);

create table Customer
(
    customerID varchar(10) not null,
    email varchar(30) not null,
    phonenumber varchar(15) not null,
    address varchar(50) not null,
    constraint CustomerPK primary key (customerID)
);

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

create table Recipe
(
    staffID varchar(10) not null,
    recipeID varchar(10) not null,
    recipeName varchar(20) not null,
    dateCreated varchar(10) not null,
    constraint RecipePK primary key (recipeID),
    constraint RecipeHeadChefFK foreign key (staffID) references HeadChef (staffID)
);

create table Tables
(
    staffID varchar(10) not null,
    tableNumber varchar(10) not null,
    partyID varchar(10) not null,
    constraint TablesPK primary key (staffID, tableNumber),
    constraint TablesWaitStaffFK foreign key (staffID) references WaitStaff (staffID),
    constraint TablesPartyFK foreign key (partyID) references Party (partyID)
);

create table Ingredients
(
    recipeID varchar(10) not null,
    ingredientName varchar(20) not null,
    constraint IngredientsPK primary key (recipeID),
    constraint IngredientsRecipeFK foreign key (recipeID) references Recipe (recipeID)
);

create table PrivateCustomer
(
    customerID varchar(10) not null,
    lastName varchar(20) not null,
    firstName varchar(20) not null,
    snailMail varchar(50) not null,
    constraint PrivateCustomerPK primary key (customerID),
    constraint PrivateCustomerCustomerFK foreign key (customerID) references Customer (customerID)
);

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

create table CorporateCustomer
(
    customerID varchar(10) not null,
    corpName varchar(50) not null,
    orgName varchar(50) not null,
    constraint CorpCustPK primary key (customerID),
    constraint CorpCustCustomerFK foreign key (customerID) references Customer (customerID)
);

create table MenuItem
(
    itemName varchar(50) not null,
    spiciness varchar(10) not null,
    constraint MenuItemPK primary key (itemName)
);

create table Specialty
(
    staffID varchar(10) not null,
    itemName varchar(50) not null,
    dateSpecialized varchar(10) not null,
    constraint SpecialtyPK primary key (staffID, itemName, dateSpecialized),
    constraint SpecialtySousChefFK foreign key (staffID) references SousChef (staffID),
    constraint SpecialtyMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

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

create table Menu
(
    menuType varchar(10) not null,
    menuHoursAvailable varchar(10) not null,
    constraint MenuPK primary key (menuType)
);

create table Orders
(
    orderID varchar(10) not null,
    customerID varchar(10) not null,
    timeOfOrder varchar(10) not null,
    constraint OrdersPK primary key (orderID),
    constraint OrdersCustomerFK foreign key (customerID) references Customer (customerID)
);

create table Payment
(
    orderID varchar(10) not null,
    paymentType varchar(10) not null,
    amountTotal varchar(10) not null,
    constraint PaymentPK primary key (orderID, paymentType, amountTotal),
    constraint PaymentOrdersFK foreign key (orderID) references Orders (orderID)
);

create table MenuPricing
(
    menuType varchar(10) not null,
    itemName varchar(50) not null,
    itemPrice varchar(10) not null,
    itemSize varchar(10) not null,
    constraint MenuPricingPK primary key (menuType, itemName),
    constraint MenuPricingMenuFK foreign key (menuType) references Menu (menuType),
    constraint MenuPricingMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

create table Discount
(
    discountID varchar(10) not null,
    orderOver200Disc varchar(10) not null,
    orderOver500Disc varchar(10) not null,
    orderOver1000Disc varchar(10) not null,
    constraint DiscountPK primary key (discountID)
);

create table OrderDetails
(
    menuType varchar(10) not null,
    itemName varchar(50) not null,
    orderID varchar(10) not null,
    discountID varchar(10) not null,
    quantityOrdered varchar(10) not null,
    priceEach varchar(10) not null,
    constraint OrderDetails primary key (menuType, itemName, orderID),
    constraint ODMPtypeFK foreign key (menuType) references MenuPricing (menuType),
    constraint ODMPnameFK foreign key (itemName) references MenuPricing (itemName),
    constraint OrderDetailsOrdersFK foreign key (orderID) references Orders (orderID),
    constraint OrderDetailsDiscountFK foreign key (discountID) references Discount (discountID)
);

create table Categories
(
    itemName varchar(50) not null,
    category varchar(10) not null,
    constraint CategoriesPK primary key (itemName, category),
    constraint CategoriesMenuItemFK foreign key (itemName) references MenuItem (itemName)
);

create table ToGo
(
    orderID varchar(10) not null,
    timeFoodIsReady varchar(10) not null,
    constraint ToGoPK primary key (orderID),
    constraint ToGoOrdersFK foreign key (orderID) references Orders (orderId)
);

create table EatIn
(
    orderID varchar(10) not null,
    tablePreference varchar(10) not null,
    constraint EatInPK primary key (orderID),
    constraint EatInOrdersFK foreign key (orderID) references Orders (orderId)
);

create table Web
(
    orderID varchar(10) not null,
    creditCardInfo varchar(50) not null,
    promoCodeEntered varchar(10) not null,
    constraint WebPK primary key (orderID),
    constraint WebOrdersFK foreign key (orderID) references Orders (orderId)
);