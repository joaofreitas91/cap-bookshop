using BookshopCatalog as service from '../../srv/service';
annotate service.Customers with @(
    // ativa CRUD
    odata.draft.enabled,
    //TABLE LIST PAGE
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Nome',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Sobrenome',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CPF',
            Value : cpf,
        }
    ],

    //Campos de filtro na table
    UI.SelectionFields : [ firstName, lastName ],

    // FORM PAGE DETAILS
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Nome',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Sobrenome',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CPF',
                Value : cpf,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Telefone',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Endereço',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Cidade',
                Value : city,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Estado',
                Value : state,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CEP',
                Value : cep,
            },
        ],
    },

    
    // Informações de header da object page / titulo da tabela customer
    UI.HeaderInfo : {
        TypeName : 'Cliente',
        TypeNamePlural : 'Clientes',
        Title : { Value : firstName },
        Description : { Value : cpf }
    },
    

    // Facets - Grupos da nossa Object Page - Onde referenciamos nosso formulário por exemplo
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Informações do cliente',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'OrdersFacet',
            Label : 'Pedidos do Cliente',
            Target : 'orders/@UI.LineItem',
            CreateHidden : true
        }
    ]
    );

annotate service.Orders with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'OrderDetailsFacet',
            Label : 'Status do Pedido',
            Target : '@UI.FieldGroup#OrderDetails'
        }
    ],

    UI.FieldGroup #OrderDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'ID do Pedido', Value : ID },
            { $Type : 'UI.DataField', Label : 'Data', Value : OrderDate },
            { $Type : 'UI.DataField', Label : 'Status', Value : status },
        ]
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'ID do Pedido', Value : ID },
        { $Type : 'UI.DataField', Label : 'Data do pedido', Value : OrderDate },
    ],

    UI.HeaderInfo : {
        TypeName : 'Pedido',
        TypeNamePlural : 'Pedidos',
        Title : { Value : 'Informações' }
    }
);

// LABEL DOS FILTROS
annotate service.Customers with {
    firstName @Common.Label : 'Nome'
};

annotate service.Customers with {
    lastName @Common.Label : 'Sobrenome'
};

