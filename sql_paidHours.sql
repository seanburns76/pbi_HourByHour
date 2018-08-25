
select
h.OpsDate,
h.DepartmentID,
h.OpHour,
sum(h.reghours) as RegHours,
sum(h.OT_Hours) as OT_Hours,
CONCAT(h.opsdate,h.departmentid,h.OpHour) as DDH
from vPaidHour h
group by 
h.OpsDate,
h.DepartmentID,
h.OpHour,
CONCAT(h.opsdate,h.departmentid)