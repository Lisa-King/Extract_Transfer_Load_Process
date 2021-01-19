INSERT INTO VIDEOSTART_DLT
SELECT CONCAT(SUBSTRING(DATETIME,1, 4), SUBSTRING(DATETIME,6, 2),SUBSTRING(DATETIME,9, 2),SUBSTRING(DATETIME,12, 2), SUBSTRING(DATETIME,15, 2), SUBSTRING(DATETIME,18, 2)) AS DATETIME,
CASE WHEN VIDEOTITLE LIKE 'APP%' THEN 'APP' 
     WHEN VIDEOTITLE LIKE 'NEWS|%' THEN 'DESKTOP' ELSE 'UNKNOWN' END AS PLATFORM,
CASE WHEN VIDEOTITLE LIKE 'NEWS|%' THEN 'NEWS' ELSE 'UNKNOWN' END AS SITE,
LTRIM(SUBSTRING_INDEX(VIDEOTITLE, '|', -1)) AS VIDEO 
FROM VIDEOSTART_RAW
WHERE EVENTS LIKE '%206%'
AND VIDEOTITLE LIKE '%|%'
;
COMMIT;

--Extract the needed info and concatenate together as DATETIME;
--From VIDEOTITLE to extract platform info: if like 'APP|%' as 'APP', if like 'NEWS|%' THEN 'DESKTOP' ELSE 'UNKNOWN';
--From VIDEOTITLE to extract site info: if like 'NEWS|%' THEN 'NEWS' ELSE 'UNKNOWN';
--Extract the second half after split VIDEOTITLE by '|' as VIDEO and trim the left spaces;
--Only EVENTS of records like '%206%' are valid;
--Only VIDEOTITLE LIKE '%|%' are valid;

