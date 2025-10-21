sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/model/json/JSONModel",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/ui/layout/form/ResponsiveGridLayout",
    "sap/m/Input",
    "sap/ui/layout/form/Form",
    "sap/ui/layout/form/FormContainer",
    "sap/ui/layout/form/FormElement",
    "sap/m/Label"
], function (MessageToast, JSONModel, Dialog, Button, ResponsiveGridLayout, Input, Form, FormContainer, FormElement) {
    "use strict";

    return {
        showCustomerDetails: async function (oContext, aSelectedContexts) {
            if (!aSelectedContexts || !aSelectedContexts.length) {
                MessageToast.show("Por favor, selecione um cliente.");
                return;
            };
            const oModel = aSelectedContexts[0].getModel();
            const sPath = aSelectedContexts[0].getPath(); // ex: "/Customers('GUID')"

            // const test = await oModel.bindContext('/Customers').requestObject(); // pegar todo o contexto de Customers

            const oBindingContext = oModel.bindContext(sPath);
            const obj = await oBindingContext.requestObject();

            const oData = {
                ID: obj.ID,
                name: obj.firstName,
                lastname: obj.lastName,
                cpf: obj.cpf,
                phone: obj.phone,
                adress: obj.address,
                city: obj.city,
                state: obj.state,
                cep: obj.cep
            };

            const oFormModel = new JSONModel(oData);

            const form = new Form({
                layout: new ResponsiveGridLayout(),
                formContainers: [
                    new FormContainer({
                        formElements: [
                            new FormElement({
                                label: 'ID',
                                fields: [
                                    new Input({
                                        value: "{/ID}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'name',
                                fields: [
                                    new Input({
                                        value: "{/name} {/lastName}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'CPF',
                                fields: [
                                    new Input({
                                        value: "{/cpf}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'Endereço',
                                fields: [
                                    new Input({
                                        value: "{/adress}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'Cidade',
                                fields: [
                                    new Input({
                                        value: "{/city}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'Estado',
                                fields: [
                                    new Input({
                                        value: "{/state}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            }),
                            new FormElement({
                                label: 'CEP',
                                fields: [
                                    new Input({
                                        value: "{/cep}",
                                        maxLength: 100,
                                        editable: false
                                    })
                                ]
                            })
                        ]
                    })
                ]
            });

            const dialog = new Dialog({
                title: "Detalhes do cliente",
                contentWidth: "400px",
                content: form,
                endButton: new Button({
                    text: "Cancelar",
                    press: function () {
                        dialog.close();
                    }
                }),
                afterClose: function () {
                    dialog.destroy();
                }
            });

            dialog.setModel(oFormModel);
            dialog.open();
        }
    }
});