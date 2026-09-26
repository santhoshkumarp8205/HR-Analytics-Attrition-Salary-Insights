SELECT
    [Department],
    row_number() over(order by department) as Dept_id
FROM (select distinct [department] from [ANALYTICS_PROJECT].[dbo].[data] where [department] is not null) as Dim_Department;