@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Course Projection'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZMY_CLOUD_DD_03 as projection on ZMY_CLOUD_DD_01
{
    key CourseUuid,
        @Search.defaultSearchElement: true
        CourseId,
        @Search.defaultSearchElement: true
        CourseName,
        CourseLength,
        @Search.defaultSearchElement: true
//        @Consumption.valueHelpDefinition: [{ entity: { name:  }]
//        Country,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        Price,
//        @Consumption.valueHelpDefinition: [{  }]
        CurrencyCode,
        LastChangedAt,
        LocalLastChangedAt,
        
        /* Associations */
        _Schedule: redirected to composition child ZMY_CLOUD_DD_04
}
