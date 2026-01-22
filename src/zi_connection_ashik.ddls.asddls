@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection view CDS data model'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
typeName: 'Connection',
typeNamePlural: 'Connections',
title: { type: #STANDARD,
                           label: 'Travel',
                           value: 'ConnectionId' }
}
@Search.searchable: true
define view entity ZI_CONNECTION_ASHIK
  as select from /dmo/connection as Connection
  association [1..*] to ZI_FLIGHT_ASHIK_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                       and $projection.ConnectionId = _Flight.ConnectionId

  association [1]    to ZI_CARRIER_ASHIK_R as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{ id: 'Connection',
                     purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label: 'Connection' },

                    { id: 'Flight',
                    purpose: #STANDARD,
                    type: #LINEITEM_REFERENCE,
                    position: 20,
                    label: 'Flight Details',
                    targetElement: '_Flight'
                    } ]

      @UI.lineItem: [{ position:  10, label : 'Airline'}]
      @UI.identification: [{ position: 10, label: 'Airline Identifier' }]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position:  20}]
      @UI.identification: [{ position: 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ position:  30, label: 'Departure Airport ID'}]
      @UI.identification: [{ position: 30, label: 'Departure Airport ID' }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {
                                                      name: 'ZI_AIRPORT_ASHIK_VH',
                                                      element: 'AirportId' }
                                                    }]
      airport_from_id as AirportFromId,
      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position:  40, label: 'Arrival Airport ID'}]
      @UI.identification: [{ position: 40, label: 'Arrival Airport ID' }]
      @EndUserText.label: 'Destination Airport ID'
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {
                                                name: 'ZI_AIRPORT_ASHIK_VH',
                                                element: 'AirportId' }
                                              }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position:  50, label : 'Departure Time'}]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position:  60, label : 'Arrival Time'}]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.identification: [{ position: 70 }]
      distance        as Distance,
      @UI.identification: [{ position: 80 }]
      distance_unit   as DistanceUnit,
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Airline
}
