-- VIDEOSTART_RAW contains the data loaded from raw file, it should not be truncated;
-- All dimension tables have inserted 1 initial record for auto_increment uasage;
-- Therefore, only delta tables need not be tracated in this stage;

truncate table VIDEOSTART_DLT;
truncate table DIMDATE_DLT;
truncate table DIMPLATFORM_DLT;
truncate table DIMSITE_DLT;
truncate table DIMVIDEO_DLT;