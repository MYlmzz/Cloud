@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule Projection'
@Search.searchable: true
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZMY_CLOUD_DD_04 as projection on ZMY_CLOUD_DD_02
{
    key ScheduleUuid,
        CourseBegin,
        CourseUuid,
        @Search.defaultSearchElement: true
        Location,
        @Search.defaultSearchElement: true
        Trainer,
        IsOnline,
        LastChangedAt,
        LocalLastChandedAt,
        
        /*Associations*/
        _Course : redirected to parent ZMY_CLOUD_DD_03
    
}
