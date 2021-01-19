INSERT INTO DIMDATE (DATETIME_SKEY)
SELECT f.DATETIME
FROM DIMDATE_DLT f
LEFT JOIN DIMDATE t
ON f.DATETIME = t.DATETIME_SKEY
WHERE t.DATETIME_SKEY IS NULL;

INSERT INTO DIMPLATFORM (PLATFORM)
SELECT f.PLATFORM
FROM DIMPLATFORM_DLT f
LEFT JOIN DIMPLATFORM t
ON f.PLATFORM = t.PLATFORM
WHERE t.PLATFORM IS NULL;

INSERT INTO DIMSITE (SITE)
SELECT f.SITE
FROM DIMSITE_DLT f
LEFT JOIN DIMSITE t
ON f.SITE = t.SITE
WHERE t.SITE IS NULL;

INSERT INTO DIMVIDEO (VIDEO)
SELECT f.VIDEO
FROM DIMVIDEO_DLT f
LEFT JOIN DIMVIDEO t
ON f.VIDEO = t.VIDEO
WHERE t.VIDEO IS NULL;

commit;