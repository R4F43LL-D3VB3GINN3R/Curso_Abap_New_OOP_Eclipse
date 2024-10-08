class zcl_ticket_security_sys definition
  public
  final
  create public .

  public section.

    interfaces zif_remote_ticket_sys.

  protected section.
  private section.
endclass.



class zcl_ticket_security_sys implementation.

  method zif_remote_ticket_sys~accept_new_tickets.

    new-line.

    write 'Tickets sent to security system'.

  endmethod.

  method zif_remote_ticket_sys~cancel_tickets.

    new-line.

    write 'Tickets cancelled from security system'.

  endmethod.

endclass.
