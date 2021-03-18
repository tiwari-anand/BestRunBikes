using { sap.capire.dev as db } from '../db/schema';

service BestBikesService @(requires: 'authenticated-user'){
    entity Service as projection on db.Service;
    entity Status as projection on db.Status;
    entity ServiceType as projection on db.ServiceType;
    entity BicycleType as projection on db.BicycleType;
}

annotate BestBikesService.Service with @(
UI: {
HeaderInfo: {
TypeName: 'Service',
TypeNamePlural: 'Service Entries',
Title: { Value: serviceType_code },
Description: { Value: FullName }
},
SelectionFields: [ Country, serviceType_code,bicycleType_code, completed_code],
LineItem: [
{ Value: FullName, Label:'Customer Name'},
{ Value: serviceType.name ,Label:'Service Type'},
{ Value: bicycleType.name, Label:'Bicycle Type' },
{ Value: City },
{ Value: completed.name },
],
Facets: [
{
$Type: 'UI.CollectionFacet',
Label: 'Service Details',
Facets: [
{$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Details'}
]
}
],
FieldGroup#Main: {
Data: [
{ Value: FullName, Label:'Customer Name' },
{ Value: Description, Label:'Description' },
{ Value: City ,Label:'City'},
{ Value: Country , Label:'Country'},
{ Value: Pincode , Label:'Pincode'},
{ Value: serviceType_code, Label:'Service Type' },
{ Value: purchaseDate  },
{ Value: bicycleType_code, Label:'Bicycle Type'},
]
}
}
);

annotate BestBikesService.Service with {
 serviceType @Common : {
 Text : serviceType.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
 bicycleType @Common : {
 Text : bicycleType.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
 completed @Common : {
 Text : completed.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
};

annotate BestBikesService.ServiceType with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'ServiceType';
};

annotate BestBikesService.BicycleType with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'BicycleType';
};

annotate BestBikesService.Status with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'Service Completed';
};