class zcl_json_ticket_sys definition
  public
  abstract         "como nao há pasta para classes abstratas, temos de diferenciar aqui trocando o final para abstract
  create public .

  public section.

    interfaces zif_remote_ticket_sys.

  protected section.

    "os métodos declarados como abstratos devem ser implementados em outra classe
    methods create_tickets_in_remote_sys
      abstract
        importing
          json type string.

    methods cancel_tickets_in_remote_sys
      abstract
        importing
          json type string.

  private section.

    methods build_ticket_json
      importing
        tickets                 type zif_remote_ticket_sys=>ticket_list
        returning value(result) type string.

endclass.



class zcl_json_ticket_sys implementation.

  method zif_remote_ticket_sys~accept_new_tickets. "quando recebemos os métodos de uma interface, devemos implementá-lo.

    data(ticket_json) = build_ticket_json( tickets ). "cria o json a partir da tabela interna

  endmethod.

  method zif_remote_ticket_sys~cancel_tickets. "quando recebemos os métodos de uma interface, devemos implementá-lo.

    data(ticket_json) = build_ticket_json( tickets ). "cria o json a partir da tabela interna

  endmethod.

  method build_ticket_json.

    result = /ui2/cl_json=>serialize( tickets ).

  endmethod.

endclass.
