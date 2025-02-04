SELECT
  COUNT(*) AS `COUNT`
FROM
  GLPI_TICKETS
  INNER JOIN CATEG ON (GLPI_TICKETS.ITILCATEGORIES_ID = CATEG.CATEG_ID)
WHERE
  CATEG.CATEG_ID_SUPERIOR = '38' AND 
  GLPI_TICKETS.IS_DELETED = 0 AND
  GLPI_TICKETS.SOLVEDATE >= DATE(NOW(6))
  AND GLPI_TICKETS.SOLVEDATE < DATE(DATE_ADD(NOW(6), INTERVAL 1 DAY))