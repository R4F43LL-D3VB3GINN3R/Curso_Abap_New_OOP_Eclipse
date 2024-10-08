interface ZIF_REMOTE_TICKET_SYS
  public .

    types ticket_list type standard table of sticket with default key. "tabela de tickets de voo

    "envia tickets a base de dados
    methods accept_new_tickets
      importing
        tickets type ticket_list.

    "cancela os tickets enviados
    methods cancel_tickets
      importing
        tickets type ticket_list.

endinterface.
