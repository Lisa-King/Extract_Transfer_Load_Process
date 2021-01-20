-- Get the related surrogate key through left join to populate the fact table, SYSDATETIME field is given the current system date time;
INSERT INTO FACTVIDEOSTART
SELECT DD.DATETIME_SKEY, DP.PLATFORM_SKEY, DS.SITE_SKEY, DV.VIDEO_SKEY, now() FROM VIDEOSTART_DLT VSD
LEFT JOIN DIMDATE DD ON DATE_FORMAT(VSD.DATETIME,'%Y%m%d%H%i') = DD.DATETIME_SKEY
LEFT JOIN DIMPLATFORM DP ON VSD.PLATFORM = DP.PLATFORM
LEFT JOIN DIMSITE DS ON VSD.SITE = DS.SITE
LEFT JOIN DIMVIDEO DV ON VSD.VIDEO = DV.VIDEO;

COMMIT;