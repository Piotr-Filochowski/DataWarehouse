create procedure show_Target_Temp_Count as
SELECT 
    t.NAME AS TableName,
    p.[Rows]
FROM 
    Target.sys.tables t
INNER JOIN      
    Target.sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    Target.sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    Target.sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.NAME NOT LIKE 'dt%' AND
    i.OBJECT_ID > 255 AND   
    i.index_id <= 1
GROUP BY 
    t.NAME, i.object_id, i.index_id, i.name, p.[Rows]
ORDER BY 
    object_name(i.object_id) 
SELECT 
    t.NAME AS TableName,
    p.[Rows]
FROM 
    Temp.sys.tables t
INNER JOIN      
    Temp.sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    Temp.sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    Temp.sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.NAME NOT LIKE 'dt%' AND
    i.OBJECT_ID > 255 AND   
    i.index_id <= 1
GROUP BY 
    t.NAME, i.object_id, i.index_id, i.name, p.[Rows]
ORDER BY 
    object_name(i.object_id) 
go 