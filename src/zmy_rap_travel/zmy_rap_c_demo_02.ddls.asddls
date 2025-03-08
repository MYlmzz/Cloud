@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book BO projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZMY_RAP_C_DEMO_02 as projection on ZMY_RAP_DD_DEMO_02 as Booking
{
    key BookingUUID,
       TravelUUID,
       @Search.defaultSearchElement: true
       BookingID,
       BookingDate,
       @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
       @ObjectModel.text.element: ['CustomerName']
       @Search.defaultSearchElement: true
       CustomerID,
       _Customer.LastName as CustomerName,
       @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
       @ObjectModel.text.element: ['CarrierName']
       CarrierID,
       _Carrier.Name      as CarrierName,
       @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                            additionalBinding: [ { localElement: 'CarrierID',    element: 'AirlineID' },
                                                                 { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                                                 { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
       ConnectionID,
       FlightDate,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       FlightPrice,
       @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
       CurrencyCode,
       LocalLastChangedAt,

       /* associations */
       _Travel : redirected to parent ZMY_RAP_C_DEMO_01T,
       _Customer,
       _Carrier,
       _Connection,
       _Flight
 }
