using BookshopCatalog as service from '../../srv/service';

annotate service.Customers with @(
    // ativar create / update - rascunho
    odata.draft.enabled,
    // annotations da nossa tabela
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
            @HTML5.CssDefaults : {
                $Type : 'HTML5.CssDefaultsType',
                width : 'auto',
            },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Nome',
            Value : firstName,
            @HTML5.CssDefaults : {
                $Type : 'HTML5.CssDefaultsType',
                width : 'auto',
            },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Sobrenome',
            Value : lastName,
            @HTML5.CssDefaults : {
                $Type : 'HTML5.CssDefaultsType',
                width : 'auto',
            },
        },
        {
            $Type : 'UI.DataField',
            Label : 'Valores dos pedidos',
            Value : orders.totalValue,
            @HTML5.CssDefaults : {
                $Type : 'HTML5.CssDefaultsType',
                width : 'auto',
            },
        }
    ],

    UI.SelectionFields : [
        firstName,
        lastName
    ],

    UI.FieldGroup #Group1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Nome',
            Value : firstName
        },
        {
            $Type : 'UI.DataField',
            Label : 'Sobrenome',
            Value : lastName
        },
        {
            $Type : 'UI.DataField',
            Label : 'CPF',
            Value : cpf
        },
        {
            $Type : 'UI.DataField',
            Label : 'Telefone',
            Value : phone
        },
                {
            $Type : 'UI.DataField',
            Label : 'Endereço',
            Value : address
        },
                {
            $Type : 'UI.DataField',
            Label : 'Cidade',
            Value : city
        },
                {
            $Type : 'UI.DataField',
            Label : 'Estado',
            Value : state
        },
                {
            $Type : 'UI.DataField',
            Label : 'CEP',
            Value : cep
        }
        ]
    },

    UI.HeaderInfo : {
        TypeName : 'Cliente',
        TypeNamePlural : 'Clientes',
        Title : { Value : firstName },
        Description : { Value : cpf }
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Group1',
            Label : 'Informações do Cliente',
            Target : '@UI.FieldGroup#Group1'
        }
    ]
);

annotate service.Customers with {
    firstName @Common.Label : 'Nome';
    lastName @Common.Label : 'Sobrenome';
};



