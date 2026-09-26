SELECT
      row_number() over(order by position) as position_id
      ,position
  FROM (select distinct position from [ANALYTICS_PROJECT].[dbo].[data]
  where position is not null) as postion_table

