*&---------------------------------------------------------------------*
*& Report zp_sap_user_demo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zp_sap_user_demo.

start-of-selection.

"isto mostra que métodos estáticos têm influência em todas as intâncias
"pois não foram criados objetos particulares que se comportam de forma independente.

"ao habilitar ou desabilitar a flag, todas as instâncias sofrem os efeitos de habilitar ou desabilitar.

data(user1) = new zcl_sap_user( 'Developer1' ).
data(user2) = new zcl_sap_user( 'Developer2' ).

user1->say_your_name( ).
user2->say_your_name( ).

zcl_sap_user=>disable_access_for_all_users( ).

user1->say_your_name( ).
user2->say_your_name( ).

zcl_sap_user=>enable_access_for_all_users( ).

user1->say_your_name( ).
user2->say_your_name( ).


