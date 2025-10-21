sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookshopordercontrol/test/integration/pages/OrdersList",
	"bookshopordercontrol/test/integration/pages/OrdersObjectPage"
], function (JourneyRunner, OrdersList, OrdersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookshopordercontrol') + '/index.html',
        pages: {
			onTheOrdersList: OrdersList,
			onTheOrdersObjectPage: OrdersObjectPage
        },
        async: true
    });

    return runner;
});

