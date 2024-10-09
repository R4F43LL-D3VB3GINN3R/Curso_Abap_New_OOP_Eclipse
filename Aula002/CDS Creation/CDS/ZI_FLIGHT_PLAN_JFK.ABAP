@AbapCatalog.sqlViewName: 'ZFLTPLANDEMO2'   
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Plan - Only JFK'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZI_FLIGHT_PLAN_JFK as //CDS de uma CDS
select from ZI_FLIGHT_PLAN_DEMO
{
    key carrid,
    key connid,
    airpfrom,
    airpto
}
where airpfrom = 'JFK' //Podemos inserir cláusulas aqui também
or airpto = 'JFK'    
