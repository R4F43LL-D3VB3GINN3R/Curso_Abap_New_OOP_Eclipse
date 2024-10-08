class zcl_connected_airport definition
  public
  final
  create public .

  public section.

    types airport_list type standard table of sairport with key id. "tabela de aeroportos

    methods constructor.

    methods get_as_list returning value(result) type airport_list. "retorna uma linha da tabela de aeroportos

    methods clear_airports.

  protected section.
  private section.

    types airport_id_list type standard table of sairport-id with key table_line. "tabela de ids de aeroportos

    data: connected_airport_ids type airport_id_list, "id do aeroporto
          connected_airports    type airport_list.    "linha da tabela de aeroportos

    methods read_connections.     "preenche a tabela tabela de ids de aeroportos
    methods read_airport_details. "preenche a estrutura com os dados do aeroporto

endclass.

class zcl_connected_airport implementation.

    method constructor.
        "ao invés de subrotinas, podemos declarar os métodos desta forma
        read_connections( ).
        read_airport_details( ).
    endmethod.

    method get_as_list.
        result = me->connected_airports.
    endmethod.

    method read_connections.
        "consulta para buscar ids que existam na tabela sflconn
        "estes ids devem coexistir nas colunas airpfrom e airpto
        "estes ids também nao podem se repetir em nenhuma outra linha
        select from sflconn
            fields distinct airpfrom
            union distinct
        select from sflconn
            fields distinct airpto
                into table @me->connected_airport_ids.

    endmethod.

    method read_airport_details.

        "consulta para buscar todos os campos da tabela
        "mas apenas os campos coexistentes na estrutura
        "onde o id da tabela sairport é igual a linha da tabela
        "nos campos correspondentes da tabela
        select from sairport
            fields *
            for all entries in @me->connected_airport_ids
            where sairport~id eq @me->connected_airport_ids-table_line
            into corresponding fields of table @me->connected_airports.

    endmethod.

    method clear_airports. "limpa a tabela de aeroportos

        clear me->connected_airports.

    endmethod.

endclass.
