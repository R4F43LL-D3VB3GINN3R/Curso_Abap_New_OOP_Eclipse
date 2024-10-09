@AbapCatalog.sqlViewName: 'ZFLTPLANDEMO'   
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Plan Demo CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZI_FLIGHT_PLAN_DEMO
  as select from spfli
    inner join sairport on spfli.airpfrom = sairport.id
{
    key spfli.carrid,
    key spfli.connid,
        spfli.airpfrom,
        spfli.airpto,
        sairport.name
}
