create procedure dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
if exists(
	select f.*
	from dbo.Family as f
	where f.SurName = @FamilySurName
	)
	update f
	set BudgetValue = f.BudgetValue - (
    	select sum(b.Value)
      	from dbo.Basket as b
      		inner join dbo.Family as f on f.ID = b.ID_Family
		where f.SurName = @FamilySurName
    	)
	from dbo.Family as f
		inner join dbo.Basket as b on b.ID_Family = f.ID
	where f.SurName = @FamilySurName
else
	select 'Такой семьи не существует'
end
