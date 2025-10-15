using BookshopCatalog as service from '../../srv/service';
annotate service.Customers with @(
    //TABLE FIRST PAGE
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
        }
    ],

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

    // Facets - Grupo - Onde referenciamos nosso form
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Informações do cliente',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
);

