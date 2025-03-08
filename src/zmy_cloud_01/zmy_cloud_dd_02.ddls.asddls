@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DEMO Data Definition 003'
@AbapCatalog.sqlViewName: 'ZMY_CLOUD_02'
define view ZMY_CLOUD_DD_02 as select from ZMY_CLOUD_DB_002 as Schedule
    association to parent ZMY_CLOUD_DD_01 as _Course on $projection.CourseUuid = _Course.CourseUuid
{
    key Schedule.schedule_uuid as ScheduleUuid,
        Schedule.course_begin as CourseBegin,
        Schedule.course_uuid as CourseUuid,
        Schedule.location as Location,
        Schedule.trainer     as Trainer,
        Schedule.is_online as IsOnline,
        @Semantics.systemDateTime.lastChangedAt: true
        Schedule.last_changed_at as LastChangedAt,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        Schedule.local_last_changed_at as LocalLastChandedAt,
        
        _Course
}
