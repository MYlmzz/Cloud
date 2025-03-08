@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Course Cds'
define root view entity ZMY_CLOUD_DD_01 as select from ZMY_CLOUD_DB_001 as Course
    composition [1..1] of ZMY_CLOUD_DD_02 as _Schedule
//    association [0..1] to I_CURRENCY as _CURRENCY on $projection.CurrencyCode = _Currency
//    association [0..1] to I_Country  as _COUNTRY  on $projection.Country = _Coutnry.code
{

    key Course.course_uuid as CourseUuid,
        Course.course_id   as CourseId,
        Course.course_name as CourseName,
        Course.course_length as CourseLength,
        Course.country  as CourseCountry,
        Course.price as Price,
        Course.currency_code as CurrencyCode,
        @Semantics.systemDateTime.lastChangedAt: true
        Course.last_changed_at as LastChangedAt,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        Course.local_last_changed_at as LocalLastChangedAt,
        
        _Schedule
//        _Currency,
//        _Country
//    
}
//
