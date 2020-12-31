CREATE TABLE images (
  id     NUMBER(10)    NOT NULL,
  name   VARCHAR2(50)  NOT NULL,
  image  BLOB          NOT NULL
)
/

ALTER TABLE images ADD (
  CONSTRAINT images_pk PRIMARY KEY (id)
)
/

ALTER TABLE images ADD (
  CONSTRAINT images_uk UNIQUE (name)
)
/

CREATE SEQUENCE images_seq
/

CREATE OR REPLACE DIRECTORY image_dir AS 'C:\'
/


CREATE OR REPLACE PACKAGE Images_API AS

PROCEDURE Load (p_name  IN  images.name%TYPE);
PROCEDURE Get  (p_name  IN  images.name%TYPE,
                p_type  IN  VARCHAR2 DEFAULT 'gif');
                 
PROCEDURE Get_Gif  (p_name  IN  images.name%TYPE);
PROCEDURE Get_Jpeg (p_name  IN  images.name%TYPE);

END;
/

CREATE OR REPLACE PACKAGE BODY Images_API AS

PROCEDURE Load (p_name  IN  images.name%TYPE) IS
  v_bfile  BFILE;
  v_blob   BLOB;
BEGIN
  INSERT INTO images (id, name, image)
  VALUES (images_seq.NEXTVAL, p_name, empty_blob())
  RETURN image INTO v_blob;

  v_bfile := BFILENAME('IMAGE_DIR', p_name);
  Dbms_Lob.Fileopen(v_bfile, Dbms_Lob.File_Readonly);
  Dbms_Lob.Loadfromfile(v_blob, v_bfile, Dbms_Lob.Getlength(v_bfile));
  Dbms_Lob.Fileclose(v_bfile);

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;

PROCEDURE Get (p_name  IN  images.name%TYPE,
               p_type  IN  VARCHAR2 DEFAULT 'gif') IS
  v_blob  BLOB;
  v_amt   NUMBER := 30;
  v_off   NUMBER := 1;
  v_raw   RAW(4096);
BEGIN
  SELECT image
  INTO   v_blob
  FROM   images 
  WHERE  name = p_name;

  Owa_Util.Mime_Header('image/' || p_type);

  BEGIN
    LOOP
      Dbms_Lob.Read(v_blob, v_amt, v_off, v_raw);
      
      Htp.Prn(Utl_Raw.Cast_To_Varchar2(v_raw));
      v_off := v_off + v_amt;
      v_amt := 4096;
    END LOOP;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN 
      NULL;
  END;
END;

PROCEDURE Get_Gif  (p_name   IN images.name%TYPE) IS
BEGIN
  Get (p_name, 'gif');
END;

PROCEDURE Get_Jpeg (p_name  IN  images.name%TYPE) IS
BEGIN
  Get (p_name, 'jpeg');
END;

END;
/