CLASS zmy_cloud_c_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmy_cloud_c_01 IMPLEMENTATION.
     METHOD if_oo_adt_classrun~main.
        Data: lt_course type STANDARD TABLE OF ZMY_CLOUD_DB_001 WITH EMPTY KEY,
              lt_schedule type STANDARD TABLE OF ZMY_CLOUD_DB_002 WITH EMPTY KEY.


       try.
       lt_course = VALUE #(
       ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
        course_id = 'BC400'
        course_name = 'ABAP'
        course_length = 5
        COUNTRY = 'TR'
        price = 1000
        currency_code = 'TRY' )

        ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
        course_id = 'BC401'
        course_name = 'OOP'
        course_length = 3
        COUNTRY = 'TR'
        price = 2000
        currency_code = 'TRY' )
       ).

       delete from ZMY_CLOUD_DB_001.
       INSERT ZMY_CLOUD_DB_001 FROM TABLE @LT_COURSE.

       OUT->WRITE( |{ SY-dbcnt } 'Entries db004' | ).

       lt_schedule = VALUE #(
       ( schedule_uuid = cl_system_uuid=>create_uuid_x16_static( )
         course_uuid = lt_course[ 1 ]-course_id
         course_begin = '20240101'
         trainer = 'MY'
         is_online = abap_false
         location = 'Eskişehir'
          )
         ( schedule_uuid = cl_system_uuid=>create_uuid_x16_static( )
         course_uuid = lt_course[ 1 ]-course_id
         course_begin = '20250101'
         trainer = 'YLMZ'
         is_online = abap_false
         location = 'Kırşehir'
          )
         ).

         DELETE FROM ZMY_CLOUD_DB_002.
         INSERT ZMY_CLOUD_DB_002 FROM TABLE @LT_SCHEDULE.

         OUT->write( |{ SY-dbcnt } ENTRIES DB005 |  ).

         COMMIT WORK.

         CATCH CX_UUID_ERROR.


       ENDTRY.

    ENDMETHOD.
ENDCLASS.
