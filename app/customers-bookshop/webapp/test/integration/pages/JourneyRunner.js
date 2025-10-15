sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/alfa/customersbookshop/test/integration/pages/CustomersList",
	"com/alfa/customersbookshop/test/integration/pages/CustomersObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/alfa/customersbookshop') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage
        },
        async: true
    });

    return runner;
});

