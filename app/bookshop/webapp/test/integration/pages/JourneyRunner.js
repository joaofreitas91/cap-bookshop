sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/alfa/bookshop/test/integration/pages/CustomersList",
	"com/alfa/bookshop/test/integration/pages/CustomersObjectPage",
	"com/alfa/bookshop/test/integration/pages/OrdersObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage, OrdersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/alfa/bookshop') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage,
			onTheOrdersObjectPage: OrdersObjectPage
        },
        async: true
    });

    return runner;
});

