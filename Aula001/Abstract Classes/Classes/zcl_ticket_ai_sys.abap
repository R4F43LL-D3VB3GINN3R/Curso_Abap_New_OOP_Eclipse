class zcl_ticket_ai_sys definition
  public
  inheriting from zcl_json_ticket_sys "herda a classe abstrata
  final
  create public .

  public section.
  protected section.

    "declaramos a redefinicao dos métodos abstratos
    methods: create_tickets_in_remote_sys redefinition,
             cancel_tickets_in_remote_sys redefinition.

  private section.
endclass.


class zcl_ticket_ai_sys implementation.

  method cancel_tickets_in_remote_sys.

    new-line.

    write 'Tickets cencelled in AI system'.

  endmethod.

  method create_tickets_in_remote_sys.

    new-line.

    write 'Tickets created in AI system'.

  endmethod.

endclass.
