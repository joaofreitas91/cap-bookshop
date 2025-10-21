using BookshopCatalog as service from '../../srv/service';

/**
 * ===========================================================
 *  Orders (Header)
 * ===========================================================
 */
annotate service.Orders with @(
    odata.draft.enabled,
    fiori.draft.enabled,
    UI.HeaderInfo                    : {
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : {Value: customer.firstName},
        Description   : {Value: status}
    },
    UI.FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Order Date',
                Value: OrderDate
            },
            {
                $Type: 'UI.DataField',
                Label: 'Total Value',
                Value: totalValue
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value: status
            },
            {
                $Type: 'UI.DataField',
                Label: 'Customer',
                Value: customer_ID
            }
        ]
    },
    UI.Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInfo',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInformation'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'OrderItems',
            Label : 'Order Items',
            Target: 'orderItems/@UI.LineItem',
        }
    ],
    UI.LineItem                      : [
        {
            $Type: 'UI.DataField',
            Label: 'Order Date',
            Value: OrderDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Total Value',
            Value: totalValue
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: status
        },
        {
            $Type: 'UI.DataField',
            Label: 'Customer',
            Value: customer.firstName
        }
    ]
);

/**
 * ===========================================================
 *  Value Help for Customers
 * ===========================================================
 */
annotate service.Orders with {
    customer @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Customers',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: customer_ID,
                ValueListProperty: 'ID'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'firstName'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'lastName'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'cpf'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'phone'
            }
        ]
    };
};

/**
 * ===========================================================
 *  OrderItems (Table inside Object Page)
 * ===========================================================
 */
annotate service.OrderItems with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Book',
        Value: book_ID
    },
    {
        $Type: 'UI.DataField',
        Label: 'Quantity',
        Value: quantity
    }
]);

/**
 * ===========================================================
 *  Value Help for Books
 * ===========================================================
 */
annotate service.OrderItems with {
    book @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Books',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: book_ID,
                ValueListProperty: 'ID'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'title'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'price'
            }
        ]
    };
};
