
@AbapCatalog.sqlViewName: 'ZFLTPLANDEMO3' 
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Meals, Demonstrating Right Joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZI_MEAL_RIGHT_JOIN as                  // Define uma nova view chamada ZI_MEAL_RIGHT_JOIN
select from smeal                                  // Seleciona dados da tabela 'smeal'
    left outer join smacourse as _main             // Realiza um LEFT OUTER JOIN com a tabela 'smacourse', usando o alias '_main'
        on  _main.carrid = smeal.carrid            // Condição de junção: 'carrid' deve ser igual em ambas as tabelas
        and _main.mealnumber = smeal.mealnumber    // Condição adicional de junção: 'mealnumber' deve ser igual em ambas as tabelas
    left outer join sdessert as _dess              // Realiza outro LEFT OUTER JOIN com a tabela 'sdessert', usando o alias '_dess'
        on  _dess.carrid = smeal.carrid            // Condição de junção: 'carrid' deve ser igual em ambas as tabelas
        and _dess.mealnumber = smeal.mealnumber    // Condição adicional de junção: 'mealnumber' deve ser igual em ambas as tabelas
{
   key smeal.carrid,                               // Define 'carrid' da tabela 'smeal' como uma chave da view
   key smeal.mealnumber,                           // Define 'mealnumber' da tabela 'smeal' como uma chave da view
       smeal.mealtype,                             // Seleciona 'mealtype' da tabela 'smeal'
       _main.mealnumber as main_meal,              // Seleciona 'mealnumber' da tabela 'smacourse' como 'main_meal'
       _dess.mealnumber as dess_meal               // Seleciona 'mealnumber' da tabela 'sdessert' como 'dess_meal'
} 

// 1 - Similar to Open Sql
// 2 - Inner Join 
// 3 - Left Outer Join

// We can provide a better result from queries not losing any data.
