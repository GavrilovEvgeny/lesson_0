create view dbo.vw_SKUPrice
as
select
	s.*
	,dbo.udf_GetSKUPrice(ID_SKU) as gp
from dbo.SKU as s
	inner join dbo.Basket as b on b.ID_SKU = s.ID
