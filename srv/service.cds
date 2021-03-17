using { sap.capire.dev as db } from '../db/schema';

service BestBikesService {
    entity Service as projection on db.Service;
    entity ServiceType as projection on db.ServiceType;
    entity BicycleType as projection on db.BicycleType;
}

annotate BestBikesService.Service with @(
UI: {
HeaderInfo: {
TypeName: 'Service',
TypeNamePlural: 'Incidents',
Title: { Value: ServiceID },
Description: { Value: CustomerNo }
},
SelectionFields: [ ServiceID, CustomerNo, City,Country, Pincode,serviceType_code,bicycleType_code],
LineItem: [
// { Value: ID },
// { Value: title },
{ Value: ServiceID, Label:'ServiceID'  },
{ Value: FullName, Label:'CustomerName' },
{ Value: serviceType.name ,Label:'Service Type'},
{ Value: City },
{ Value: bicycleType.name, Label:'Bicycle Type' }
],
Facets: [
{
$Type: 'UI.CollectionFacet',
Label: 'Incident Info',
Facets: [
{$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Details'}
]
}
],
FieldGroup#Main: {
Data: [
//{ Value: ID },
{ Value: ServiceID },
{ Value: CustomerNo },
{ Value: City },
//{ Value: status_code , Label:'Status'},
{ Value: Country },
{ Value: serviceType_code, Label:'Service Type' },
//{ Value: closed_on  },
{ Value: bicycleType_code, Label:'Bicycle Type'},
//{ Value: assignedIndividual_code ,Label:'Assigned Individual'}
]
}
}
);

annotate BestBikesService.Service with {
 ServiceType @Common : {
 Text : serviceType.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
 BicycleType @Common : {
 Text : bicycleType.name,
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