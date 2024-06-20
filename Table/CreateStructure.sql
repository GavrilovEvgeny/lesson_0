create table dbo.SKU(
	ID int not null identity
	,Code as 's ' + convert(varchar(255), ID)
	,Name varchar(255) null
	,constraint PK_SKU primary key clustered (ID)
)

create table dbo.Family(
	ID int not null identity
	,SurName varchar(255) null
	,BudgetValue money null
	,constraint PK_Family primary key clustered (ID)
)

create table dbo.Basket(
  ID int not null identity
  ,ID_SKU int null
  ,ID_Family int null
  ,Quantity int null
  ,Value money null
  ,PurchaseDate date null
  ,DiscountValue money null
)
alter table dbo.Basket add constraint FK_Basket_ID_SKU foreign key (ID_SKU) references dbo.SKU(ID)
alter table dbo.Basket add constraint FK_Basket_ID_Family foreign key (ID_Family) references dbo.Family(ID)
alter table dbo.Basket add constraint CK_Basket_Quantity check	(Quantity >= 0)
alter table dbo.Basket add constraint CK_Basket_Value check (Value >= 0)
alter table dbo.Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate;
