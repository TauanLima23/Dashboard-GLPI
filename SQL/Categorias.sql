create view CATEG as 
select 	GI.id as CATEG_ID, 
		GI.id as CATEG_ID_SUPERIOR, 
		GI.completename as CATEG_NAME, 
		GI.`level` as CATEG_LEVEL,
		gi.completename as CATEG_SUPERIOR
from glpi_itilcategories GI
where GI.`level` = '1'
union
select 	GI.id as CATEG_ID, 
		GI.itilcategories_id as CATEG_ID_SUPERIOR, 
		GI.completename as CATEG_NAME, 
		GI.`level` as CATEG_LEVEL,
		SUP.completename as CATEG_SUPERIOR
from 	glpi_itilcategories GI 
 		left join glpi_itilcategories SUP on (GI.itilcategories_id = SUP.ID) and (sup.level = '1')
where GI.`level` = '2'
union 
select 	GI.id as CATEG_ID, 
		GI2.itilcategories_id as CATEG_ID_SUPERIOR, 
		GI.completename as CATEG_NAME, 
		GI.`level` as CATEG_LEVEL,
		SUP.completename as CATEG_SUPERIOR
from 	glpi_itilcategories GI 
		LEFT join glpi_itilcategories gi2 on (GI.itilcategories_id = GI2.ID)
		left join glpi_itilcategories SUP on (gi2.itilcategories_id = sup.id) and (sup.level = '1')
where GI.`level` = '3';