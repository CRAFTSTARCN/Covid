CREATE TABLE Resident (
    Id CHAR(17) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Prov VARCHAR(30),
    City VARCHAR(30),
    District VARCHAR(30),
    Age INT NOT NULL,
    Gender VARCHAR(2),
    IdType VARCHAR(20),
    PRIMARY KEY (Id)  
);



CREATE TABLE TestCase(
    Id CHAR(17) NOT NULL,
    Sampler CHAR(17),
    Laboratorian CHAR(17),
    TestTime DATE,
    Resault CHAR(1) DEFAULT 'U' CHECK(Resault IN ('U', 'P', 'N')),
    Batch INT,
    PRIMARY KEY (Id,TestTime),
    FOREIGN KEY (Id) REFERENCES Resident(Id)
);

CREATE TABLE Infected(
    CaseNumber INT NOT NULL,
    Id CHAR(17) NOT NULL,
    ConfirmTime DATE,
    InProv VARCHAR(30),
    InCity VARCHAR(30),
    InDistrict VARCHAR(30),
    PRIMARY KEY(CaseNumber),
    FOREIGN KEY (ID) REFERENCES Resident(Id)
);

CREATE TABLE Recovered (
    CaseNumber INT NOT NULL,
    RecoverTime DATE,
    PRIMARY KEY (CaseNumber),
    FOREIGN KEY (CaseNumber) REFERENCES Infected(CaseNumber)
);

CREATE TABLE DeadCase (
    CaseNumber INT NOT NULL,
    DeadTime DATE,
    PRIMARY KEY (CaseNumber),
    FOREIGN KEY (CaseNumber) REFERENCES Infected(CaseNumber)
);

CREATE TABLE Officer (
    Id CHAR(17) NOT NULL,
    Pass CHAR(64) NOT NULL,
    Duty INT DEFAULT 0 CHECK(-1 < Duty AND Duty < 4),
    WorkProv VARCHAR(30) NOT NULL,
    WorkCity VARCHAR(30) NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Resident(Id)
);

CREATE TABLE Administrator (
    AdminId CHAR(8),
    Pass CHAR(64),
    WorkProv VARCHAR(30),
    WorkCity VARCHAR(30),
    PRIMARY KEY (AdminId)
);

CREATE TABLE CloseContact (
    Id CHAR(17) NOT NULL,
    CaseNumber INT,
    ContactTime DATE,
    LivingProv VARCHAR(30),
    LivingCity VARCHAR(30),
    LivingDistrict VARCHAR(30),
    TestResault CHAR(1) DEFAULT 'U' CHECK(TestResault IN ('U', 'P', 'N')),
    PRIMARY KEY (Id,ContactTime),
    FOREIGN KEY (CaseNumber) REFERENCES Infected(CaseNumber)
);

CREATE TABLE InfectedVisit (
    CaseNumber INT NOT NULL,
    VisitTime DATETIME NOT NULL,
    Prov VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    District VARCHAR(30) NOT NULL,
    TotalName VARCHAR(50) NOT NULL,
    PRIMARY KEY (CaseNumber,VisitTime),
    FOREIGN KEY (CaseNumber) REFERENCES Infected(CaseNumber)
);

CREATE TABLE Traffic (
    CaseNumber INT NOT NULL,
    TakingTime DATETIME,
    TType VARCHAR(20),
    TNumber VARCHAR(20),
    PRIMARY KEY(CaseNumber, TakingTime, TType, TNumber),
    FOREIGN KEY(CaseNumber) REFERENCES Infected(CaseNumber)
);

CREATE TABLE Notify (
    Title VARCHAR(100) NOT NULL,
    Body TEXT,
    AdminId CHAR(8),
    PublishTime DATETIME,
    Nid INT,
    PRIMARY KEY (Nid),
    FOREIGN KEY (AdminId) REFERENCES Administrator(AdminId)
    
);

CREATE INDEX Res_ID ON Resident(Id, FirstName, LastName);
CREATE INDEX TEST_CASE_ID ON TestCase(ID);
CREATE INDEX Infected_Num_Id ON Infected(CaseNumber,Id);
CREATE INDEX Cloes_Contact_Res ON CloseContact(Id, TestResault);