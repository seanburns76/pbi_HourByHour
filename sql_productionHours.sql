

select 
x.*,
CONCAT(x.OpsDate,x.WorkCenter,x.OpsHour) as DWH,
CONCAT('Hour-',x.OpsHour) as [Hour],
CONCAT(x.opsdate,' ',CONCAT('Hour-',x.OpsHour)) as [Date-Hour],
CONCAT(l.DepartmentCode,l.WorkCenterNum) as DeptWCLink,
CONCAT(x.OpsDate,l.DepartmentCode) as DDLink,
CONCAT(x.opsdate,l.departmentcode,x.opshour) as DDH,
l.DepartmentCode,
l.DepartmentDesc
from
(
select 
p.OpsDate,
p.WorkCenter,
p.OpsHour,
sum(p.ProdHours) as ProdHours
from vProdHours p
group by 
p.OpsDate,
p.WorkCenter,
p.OpsHour

) x left join vDimLocation l on l.WorkCenterNum=x.WorkCenter