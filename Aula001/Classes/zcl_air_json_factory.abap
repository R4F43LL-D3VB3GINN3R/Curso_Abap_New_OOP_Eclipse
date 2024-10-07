class zcl_air_json_factory definition
  public
  final
  create public .

  public section.
    methods build_conn_airport_json returning value(result) type string. "método para retornar um json de uma tabela interna
  protected section.
  private section.
ENDCLASS.

CLASS ZCL_AIR_JSON_FACTORY IMPLEMENTATION.
    method build_conn_airport_json.
        data(conn_airports) = new zcl_connected_airport( ).  "instancia da classe
        data(airport_list)  = conn_airports->get_as_list( ). "objeto de classe usa o método airport_list
        result = /ui2/cl_json=>serialize( airport_list ).    "a tabela retornada do método é convertida para json.file
    endmethod.
ENDCLASS.
