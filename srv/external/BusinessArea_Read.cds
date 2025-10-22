/* checksum : 4fb66dd2c81f96592e0eacff4c4c67bf */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service BusinessArea_Read {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Business Area'
  entity A_BusinessArea {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Business Area'
    key BusinessArea : String(4) not null;
    to_Text : Association to many A_BusinessAreaText {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Business Area Text'
  entity A_BusinessAreaText {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Business Area'
    key BusinessArea : String(4) not null;
    @sap.label : 'Language Key'
    key Language : String(2) not null;
    @sap.label : 'Business Area Name'
    BusinessAreaName : String(30);
    to_BusinessArea : Association to A_BusinessArea {  };
  };
};

