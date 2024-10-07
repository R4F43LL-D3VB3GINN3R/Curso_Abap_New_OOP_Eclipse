class zcl_sap_user definition
  public
  final
  create public .

  public section.

    class-methods enable_access_for_all_users.  "habilita acesso
    class-methods disable_access_for_all_users. "desabilita acesso

    methods
      constructor
        importing bname type syuname. "recebe o nome do user

    methods
      say_your_name. "escreve uma mensagem na tela

  protected section.
  private section.

    class-data access_disabled type abap_bool. "flag para dizer se foi recebido ou nao o nome

    data bname type syuname. "atributo de classe de nome do user

endclass.

class zcl_sap_user implementation.

    method constructor.
        me->bname = bname.
    endmethod.

    method say_your_name.

        new-line.

        "se o nome estiver desabilitado
        if zcl_sap_user=>access_disabled = abap_true.
            write 'Cant say my name'.
            return.
        endif.

        new-line.

        "do contrário, escreve o nome
        write  me->bname.

    endmethod.

    method enable_access_for_all_users. "habilita o nome
        zcl_sap_user=>access_disabled = abap_false.
    endmethod.

    method disable_access_for_all_users. "desabilita o nome
        zcl_sap_user=>access_disabled = abap_true.
    endmethod.

endclass.
