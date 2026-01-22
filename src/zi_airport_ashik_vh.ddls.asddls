@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for Airport'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZI_AIRPORT_ASHIK_VH as select from /dmo/airport
{

     @Search.defaultSearchElement: true
    key airport_id as AirportId,
    name as Name,
    city as City,
    country as Country
}
