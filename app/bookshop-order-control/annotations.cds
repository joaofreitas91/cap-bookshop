using BookshopCatalog as service from '../../srv/service';

annotate service.Orders with @(
    odata.draft.enabled,
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'OrderDate',
                Value: OrderDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'totalValue',
                Value: totalValue,
            },
            {
                $Type: 'UI.DataField',
                Label: 'status',
                Value: status,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'OrderDate',
            Value: OrderDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'totalValue',
            Value: totalValue,
        },
        {
            $Type: 'UI.DataField',
            Label: 'status',
            Value: status,
        },
    ],
);

annotate service.Orders with {
    customer @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Customers',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: customer_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'firstName',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'lastName',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'cpf',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'phone',
            },
        ],
    }
};
