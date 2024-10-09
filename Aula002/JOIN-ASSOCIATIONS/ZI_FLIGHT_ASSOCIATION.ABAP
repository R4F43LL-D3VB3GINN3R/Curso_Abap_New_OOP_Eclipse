@AbapCatalog.sqlViewName: 'ZFLTPLANDEMO4' 
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//Associations são muito importantes para a cessar dados em tabelas relacionadas

define view ZI_FLIGHT_ASSOCIATION as 
select from sflight
association [1..1] to scarr as _carrier on _carrier.carrid = $projection.carrid      //Primeira tabela sssociada scarr

association [0..*] to sbook as _booking on  _booking.carrid    = $projection.carrid  //Segunda tabela associada _booking
                                        and _booking.connid    = $projection.connid
                                        and _booking.fldate    = $projection.fldate
                                        and _booking.cancelled = ''
{
    key sflight.carrid, // -> This is $projection.carrid
    key sflight.connid,
    key sflight.fldate,
        @Semantics.amount.currencyCode: 'currency' //Annotation para ligar dois campos na view
        sflight.price,
        sflight.currency,
        
        _carrier, //Numa association temos sempre de mencionar a tabela associada aqui
        _booking
}
