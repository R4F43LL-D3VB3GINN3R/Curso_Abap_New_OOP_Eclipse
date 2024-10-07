*&---------------------------------------------------------------------*
*& Report zp_connected_airports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zp_connected_airports.

start-of-selection.

    "demonstra que dois objetos instanciados e diferentes da mesma classe trabalham de forma independente
    
    data(connected_airports) = new zcl_connected_airport( ). "nova sintaxe para instancia de classe
    connected_airports->clear_airports( ).                   "limpa a tabela gerada na instância
    data(airport_alv) = connected_airports->get_as_list( ).  "recebe uma tabela com dados preenchidos.

*    cl_demo_output=>display_data( airport_alv ). "metodo do sistema para exibir uma tabela interna
    
    data(connected_airports2) = new zcl_connected_airport( ). "nova sintaxe para instancia de classe
    data(airport_alv2) = connected_airports2->get_as_list( ).  "recebe uma tabela com dados preenchidos.
