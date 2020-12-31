LOAD DATA
INFILE *
INTO TABLE image_table
REPLACE
FIELDS TERMINATED BY ','
(
 image_id,
 file_name,
 image_data LOBFILE (file_name) TERMINATED BY EOF
)
BEGINDATA
001,OracleHQ1.jpg
002,oracleHQ2.jpg
003,OracleHQ3.jpg
004,Foto_041208_004.jpg
