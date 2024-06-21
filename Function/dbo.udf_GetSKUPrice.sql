create function dbo.udf_GetSKUPrice(
  @ID_SKU int
)
returns decimal(18, 2)
as
begin
    declare @price decimal(18, 2)
    select @price = sum(Value) / sum(Quantity)
    from dbo.Basket as b
    where b.ID_SKU = @ID_SKU

    return @price
end
