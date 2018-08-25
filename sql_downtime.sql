

select
x.OpsDate,
x.WorkCenter,
x.OpHour,
CONCAT(x.opsdate,x.workcenter) as DWHLink,
x.DT_Reason,
x.DT_Comment,
x.DT_Duration,
CONCAT(x.opsdate,concat('Hour-',x.ophour)) as [Date-Hour],
concat('Hour-',x.ophour) as [Operations Hour],
l.DepartmentCode,
l.DepartmentDesc
from
(
select 
h.OpsDate,h.WorkCenter,h.OpHour,h.DT_Reason,h.DT_Comment,sum(h.DT_Duration) as DT_Duration
 from vDT_byhour h 
 group by h.OpsDate,h.WorkCenter,h.OpHour,h.DT_Reason,h.DT_Comment) x left join vDimLocation l on l.WorkCenterNum=x.WorkCenter