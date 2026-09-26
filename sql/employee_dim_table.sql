/*
SELECT 
    f.[EmpID],
    REPLACE(f.[Employee_Name], ',', '_') AS [Name],
    d.[Dept_ID] AS [DeptID],
    CASE 
        WHEN f.[MarriedID] = '1' THEN 'Married'
        WHEN f.[MarriedID] = '0' THEN 'Not_Married'
        ELSE 'Not_Mentioned'
    END AS [Married_status],
    f.[PerfScoreID],
    f.[FromDiversityJobFairID],
    p.[Position_ID] AS [Position_ID],
    f.[State],
    f.[Zip],
    f.[DOB],
    CASE
        WHEN f.[Sex] = 'm' THEN 'Male'
        WHEN f.[Sex] = 'f' THEN 'Female'
        ELSE 'Not_Mentioned'
    END AS Sex,
    f.[MaritalDesc],
    f.[CitizenDesc],
    f.[HispanicLatino],
    f.[RaceDesc],
    f.[TermReason],
    f.[EmploymentStatus],
    f.[ManagerID],
    f.[RecruitmentSource],
    f.[Salary],
    f.[Termd],
    f.[PerformanceScore],
    f.[EngagementSurvey],
    f.[EmpSatisfaction],
    f.[SpecialProjectsCount],
    f.[DaysLateLast30],
    f.[Absences]
FROM [ANALYTICS_PROJECT].[dbo].[data] AS f
LEFT JOIN Dimention_Department AS d 
    ON f.[Department] = d.[Department]
LEFT JOIN dimention_position AS p 
    ON f.[Position] = p.[Position];
    */


WITH UniqueEmployees AS (
    SELECT DISTINCT [EmpID]
    FROM [ANALYTICS_PROJECT].[dbo].[data]
    WHERE [EmpID] IS NOT NULL
)
SELECT 
    u.[EmpID],
    REPLACE(f.[Employee_Name], ',', '_') AS [Name],
    CASE 
        WHEN f.[MarriedID] = '1' THEN 'Married'
        WHEN f.[MarriedID] = '0' THEN 'Not_Married'
        ELSE 'Not_Mentioned'
    END AS [Married_status],
    f.[PerfScoreID],
    f.[FromDiversityJobFairID],
    f.[State],
    f.[Zip],
    f.[DOB],
    CASE
        WHEN f.[Sex] = 'm' THEN 'Male'
        WHEN f.[Sex] = 'f' THEN 'Female'
        ELSE 'Not_Mentioned'
    END AS Sex,
    f.[MaritalDesc],
    f.[CitizenDesc],
    f.[HispanicLatino],
    f.[RaceDesc],
    f.[EmploymentStatus],
    f.[ManagerID],
    f.[RecruitmentSource]
FROM UniqueEmployees AS u
INNER JOIN [ANALYTICS_PROJECT].[dbo].[data] AS f 
    ON u.[EmpID] = f.[EmpID];