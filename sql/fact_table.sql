SELECT 
      f.[EmpID]
      ,f.[DeptID]
      ,f.[Salary]
      ,f.[Termd]
      ,p.[position_id] as Position_ID
      ,f.[TermReason]
      ,f.[PerformanceScore]
      ,f.[EngagementSurvey]
      ,f.[EmpSatisfaction]
      ,f.[SpecialProjectsCount]
      ,f.[DaysLateLast30]
      ,f.[Absences]
    ,f.[DateofHire],
    f.[DateofTermination],
    f.[LastPerformanceReview_Date]
  FROM data as f left join dimention_position as p
  on f.position = p.position;
