class zcl_ticket_police_sys definition
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



class zcl_ticket_police_sys implementation.

  method cancel_tickets_in_remote_sys.

    new-line.

    write 'Tickets cencelled in police system'.

  endmethod.

  method create_tickets_in_remote_sys.

    new-line.

    write 'Tickets created in police system'.

  endmethod.

endclass.
