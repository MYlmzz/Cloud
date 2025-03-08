@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZMY_RAP_C_DEMO_01T
  provider contract transactional_query as projection on ZMY_RAP_DD_DEMO_01 as Travel
{
   key TravelUUID,
       @Search.defaultSearchElement: true
       TravelID,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
       @ObjectModel.text.element: ['AgencyName']
       @Search.defaultSearchElement: true
       AgencyID,
       _Agency.Name       as AgencyName,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
       @ObjectModel.text.element: ['CustomerName']
       @Search.defaultSearchElement: true
       CustomerID,
       _Customer.LastName as CustomerName,
       BeginDate,
       EndDate,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       BookingFee,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       TotalPrice,
       @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
       CurrencyCode,
       Description,
       TravelStatus,
       LastChangedAt,
       LocalLastChangedAt,

       /* Associations */
       _Agency,
       _Booking : redirected to composition child ZMY_RAP_C_DEMO_02,
       _Currency,
       _Customer   
}
