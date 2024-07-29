select
  GLPI_TICKETS.id,
  GLPI_TICKETS.name ,
  GLPI_ENTITIES.name,
  case when GLPI_TICKETS.status = '1' then 'Novo'
       when GLPI_TICKETS.status = '2' then 'Em Atendimento(Atribuído)'
       when GLPI_TICKETS.status = '3' then 'Em Atendimento(Pixeon)'
       when GLPI_TICKETS.status = '4' then 'Pendente'
  	   else 'Status Indisponivel'
  end,
   GLPI_TICKETS.date,
   case when GLPI_TICKETS.priority= '6' then 'Critica'
       when GLPI_TICKETS.priority= '2' then 'Baixa'
       when GLPI_TICKETS.priority  = '3' then 'Média'
       when GLPI_TICKETS.priority  = '4' then 'Alta'
  	   else GLPI_TICKETS.priority
  end,
  CATEG.CATEG_NAME
FROM
  GLPI_TICKETS
  INNER JOIN CATEG ON (GLPI_TICKETS.ITILCATEGORIES_ID = CATEG.CATEG_ID)
  inner join glpi_entities on (GLPI_TICKETS.entities_id = GLPI_ENTITIES.id)
WHERE
  CATEG.CATEG_ID_SUPERIOR = '38' AND 
  GLPI_TICKETS.IS_DELETED = 0 AND
  GLPI_TICKETS.STATUS IN (1)
order by GLPI_TICKETS.ID ASC
