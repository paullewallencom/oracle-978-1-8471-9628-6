LOAD DATA
INFILE *
APPEND
INTO TABLE ABC
FIELDS TERMINATED BY ':'
(ID, ABC)
BEGINDATA
27:A':'BCDEFGHIJKLMNOPQRSTUVWXYZ
28:AB\:CDEFGHIJKLMNOPQRSTUVWXYZ
29:ABC\:DEFGHIJKLMNOPQRSTUVWXYZ
30:ABCD\:EFGHIJKLMNOPQRSTUVWXYZ
31:ABCDE\:FGHIJKLMNOPQRSTUVWXYZ
32:ABCDEF\:GHIJKLMNOPQRSTUVWXYZ
33:ABCDEFG\:HIJKLMNOPQRSTUVWXYZ
34:ABCDEFGH\:IJKLMNOPQRSTUVWXYZ
35:ABCDEFGHI\:JKLMNOPQRSTUVWXYZ